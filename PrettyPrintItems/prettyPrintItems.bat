rem @ECHO off
rem file doc (for doxygen)
::/**  
:: *  @file 
:: *  <b>PrettyPrint Items</b> is the first utility i wrote for <i>SyMenu</i> expert users.
:: *  It produces a HTML page from menu Items structure, in the <code>SyMenuItem.zip</code> file, essentially for documentation purposes.
:: *  This is a 'portable' implementation that works in union with <A HREF="www.ugmfree.it">SyMenu</A>.
:: *
:: *  @par Preconditions
:: *  You must have, installed and working in <i>SyMemenu</i>: 
:: *    @li <b>filters_dox</b>: you  must download and extract it in <tt>xxxx\SyMenu\ProgramFiles\filters_dox</tt> from: https://github.com/msillano/filters_dox.
:: *    @li <b>NirCMD</b>: here is used to run the BAT file in hidden mode, it is included in NirSoft Suite.
:: *    @li <b>7z.exe</b>: here is used the instance [ver. 19.00 (x86)] in <tt>xxxx\SyMenu\Lib</tt>, so the 7z.exe installation is not required.

:: *  @par Installation
:: *   @li  Unzip this pachage in <tt>xxxx\SyMenu\ProgramFiles</tt>, so you get: <tt>xxxx\SyMenu\Programfile\sm-symtools\xxx.xxx</tt>.
:: *
:: *   @li  Verify the java installation in your host machine (e.g. on <tt>cmd</tt> console type: <tt>&gt;java  -version  [enter]</tt>. More on java portable installation here: https://www.ugmfree.it/Forum/messages.aspx?TopicID=344 .
:: *
:: *   @li  In <b>SyMenu</b> you can add the 'PrettyPrint menu' entry  for PrettyPrintItems.hide.bat (see) using drag&drop. @n
:: *         - Alternative: you can also add the new program 'PrettyPrint menu' using as path: <tt>.\ProgramFiles\SPSSuite\NirSoftSuite\NirCmd_x64_sps\nircmd.exe</tt> and as parameters: <tt>exec hide "..\..\..\ms-symtools\prettyPrintItems.bat"</tt>.@n
:: *         - note: don't use quotes (') or double quotes (") around the program path: SyMenu care of this.
:: *  @par Notes
:: *    @li <i>The <tt>filters_dox-ver403</tt> is an add-on for Doxigen, a source documentation tool for programmers, that I use to build this help. Here we use only the <tt>xmlfilter.claas</tt>, a simple 
:: *    XML transformer, implemented in java.</i>
:: *
:: *    @li  <i>The look of resulting HTML page can be changed with CSS customization, see the <code>libPrintCol2.xslt</code> code, CSS section. </i>
:: *
:: *    <i>I make this utility because I need it. This program is Open Source in the hope that it will be useful, whithout any warranty: it is very experimental. </i>
:: */
::/** @file
:: * @version 1.0 26/11/21 tested on Windows 11 Pro (21H2), java  17.0.1 and SyMenu  6.16.7962 [2021.10.19]
:: * @author Copyright &copy;2021 Marco Sillano.
:: */
rem code doc
::/**
:: *  Pseudo-function with actual BAT script code.
:: *
:: *  This filter uses <tt>xmlfilter.java</tt> with a XSL files 'ad hoc': xmlPrintSyItems.xslt.
:: *  The program get a snapshot of the actual SyMenuItems.zip and produce3s a HLTM tree presentation, colored and collassable.
:: *  Changing the CSS you can change the result page look.
:: *  @par How it works
:: *     -# STEP: Unzip the <code>SyMenu\Config\SyMenuItem.zip</code> using 7.zip.
:: *       The result is in the temporary file <code>SyMenu\Config\SyMenuItem\SyMenuItem.xml</code>
:: *     -# STEP: Copy <code>SyMenu\Config\SyMenuItem\SyMenuItem.xml</code> (UTF-16LE) to the temporary file <code>SyMenu\Config\SyMenuItem\SyMenuItem8.xml</code> (UTF-8).
:: *       The UTF-8 format is required by the next step: the XML parser don't accepts BOM
:: *     -# STEP: A XML transformer (<code>xtmlfilter</code>, in java) gets the <code>SyMenuItem8.xml</code> file and using the 'ad hoc' XSLT file <code>xmlPrintSyItems.xslt</code> 
:: *           produces in output the required file <code>SyMenuItem_pp.AAAAMMGG-HHhMMmSSs.html</code>.
:: *     -# STEP: Cleanup deleting temporary files.
:: *     -# STEP: The result file is sent to the default browser.
:: *  
:: */

rem You can remove "rem" from following two lines, if you'd like to use a specific java jre or jrk (example):
rem set JAVA_HOME=C:\j2sdk1.4.2_10
rem set PATH=%JAVA_HOME%\bin

rem  can start using any 'current dir' or disk:
for %%i in ("%~dp0.") do SET "startpath=%%~fi"
pushd .
cd /D "%startpath%"

rem ================= STEP 0: date string, portable, timestamp like backup files
rem ref: https://www.it-swarm.it/it/windows/creazione-di-un-nome-file-come-timestamp-un-processo-batch/967227137/
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set mydate=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2%_%ldt:~8,2%h%ldt:~10,2%m%ldt:~12,2%s
rem echo test - timestamp: %mydate%

rem ================= STEP 1: UNZIP (using 7.zip)
rem ref: https://www.dotnetperls.com/7-zip-examples
rem BAT starts in xxxx\SyMenu\ProgramFiles\ms-symtools: goto Config dir:
set ARCHDIR=..\..\Config
rem  7z.exe path is: xxxx\SyMenu\Lib\7z.exe
set EXE7ZFILE="..\Lib\7z.exe"
rem
CD %ARCHDIR%
%EXE7ZFILE% x SyMenuItem.zip -aoa -oSyMenuItem

rem ================= STEP 2: UTF_16LE  => UTF_8noBOM (xmlfilter parser don't process UTF_16LE)
rem ref: https://stackoverflow.com/questions/265370/utf-16-to-utf-8-conversion-for-scripting-in-windows
REM Goto work dir:  xxxx\SyMenu\Config\SyMenuItem
set WORKDIR=SyMenuItem
rem
CD %WORKDIR%
powershell -c "(Get-Content SyMenuItem.xml)|ForEach-Object {$_ -Replace 'UTF-16', 'UTF-8' }|Set-Content SyMenuItem8.xml"

rem ================= STEP 3: Transformation  XML => HTML (using xmlfilter)
rem Goto filter class dir (to not use CLASSPATH)
set FILTERDIR=..\..\ProgramFiles\filters_dox\bin
rem XSLT used file: \SyMenu\ProgramFiles\ms-symtools\xslt\xmlPrintSyItems.xslt
set XSLTDIR=..\..\ms-symtools\xslt
REM XML file dir:  xxxx\SyMenu\Config\SyMenuItem
set XMLFILEDIR=..\..\..\Config\SyMenuItem

rem  ref: https://www.it-swarm.it/it/windows/creazione-di-un-nome-file-come-timestamp-un-processo-batch/967227137/
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set mytimestamp=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2%_%ldt:~8,2%h%ldt:~10,2%m%ldt:~12,2%s
set OUTFILE=%CD%/SyMenuItem_pp.%mytimestamp%.html
rem echo outfile name: %OUTFILE%

CD %FILTERDIR%
java.exe  xmlfilter %XSLTDIR%\xmlPrintSyItems.xslt -i %XMLFILEDIR%\SyMenuItem8.xml > %OUTFILE%

rem ================ STEP 4: cleanup dir
DEL %XMLFILEDIR%\SyMenuItem8.xml > NULL
DEL %XMLFILEDIR%\SyMenuItem.xml > NULL

rem  =============== STEP 5: Show result  file (using default browser), restore 'current dir'
start "" "file://%OUTFILE%"
popd
