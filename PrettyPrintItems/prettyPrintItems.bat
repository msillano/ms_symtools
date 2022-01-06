@ECHO off
::  *********************  DEFAULT CONFIG (user can edit)
:: ---- defaults, updated by CL parameters:
rem DEFAULTCONFIG: the SyMenu configuration zip file, absolute path or relative to the directory where this file is located.
set DEFAULTCONFIG=..\..\Config\SyMenuItem.zip
rem STATUS= one of open|close, to control the tree start look, close better for big menus.
set STATUS=close
:: ---- Options not on CL, you MUST change them here
rem INLINE_HEADER=  Controls the output of tags  &lt;style> and &gt;script> in the HTML page:
rem       true:      tags and full code are included in HEAD (or BODY), to make a stand-alone page (default)
rem       false:     puts in HEAD the relative default includes for local files in  <tt>.\\include</tt>
rem       [BaseURL]: used for external (local or remote) files anywhere: BaseURL/include/xxx.yyy 
rem              note: You can use here the files in http://www.o2xdl.org that I put in public domain for user tests.
SET INLINE_HEADER=true
:: You can remove "rem" from following two lines, if you'd like to use a specific java jre or jdk (example):
rem set JAVA_HOME=C:/j2sdk1.4.2_10
rem set PATH=%JAVA_HOME%/bin
:: You can remove "rem" from following line, to change the default 'TMP' path used (example):
rem set TMP=%USERPROFILE%\Desktop
:: ************************************* (edit ends)

rem file doc (for doxygen)
::/**  
:: *  @file 
:: *  <b>prettyPrint SyMenu</b> (<tt>prettyPrintItems.bat</tt>) is the first utility I wrote for me and other <i>SyMenu</i> expert users.
:: *  It produces a snapshot of the  menu Items structure, as a dynamic HTML page, from the <code>SyMenuItem.zip</code> configuration file, essentially for documentation purposes. 
:: *  You get all info about nodes, also the internal <i>programGUID</i> required by  <i>SyMenu</i> CL parameter
:: * <A href="https://www.ugmfree.it/SyMenuManual.aspx#CommandLine" target="_blank">-run{programGUID}</A>. @n
:: *  This is a 'portable' implementation that works only in union with <A HREF="www.ugmfree.it">SyMenu</A>.@n
:: *  You can also cut HTML fragments and paste them into custom HTML pages.@n
:: *
:: *  @par Preconditions
:: *  You must have <i>SyMenu</i>, installed and working: 
:: *    @li As default, this program tries to find the  <tt>SyMenuItems.zip</tt> configuration file in the standard position: [symenu]/Config/SyMenuItems.zip.
:: *    @li You can have many <tt>SyMenuItems.zip</tt> placed anywhere (if you use <tt>-fc</tt> or <tt>-fp</tt> <A href="https://www.ugmfree.it/SyMenuManual.aspx#CommandLine" target="_blank">parameters</A> )@n
:: *       In this case, calling this program, you MUST use as a parameter the path to the <tt>SyMenuItems.zip</tt>.
:: *
:: *  @par Installation
:: *   @li  Unzip this package in <tt>[SyMenu]/ProgramFiles</tt>, so you get: <tt>[SyMenu]/Programfiles/sm-symtools/prettyPrintItems.bat</tt> .. etc.
:: *
:: *  @par Output
:: *   The output file path is like: <tt>"[SyMenu]/ProgramFiles/ms-symtools/result/SyMenuItem_pp_20211207-14h10m40s.html"</tt>.
:: *   As default, this file is standalone, i.e. it can be moved where you like. @n
:: *
:: *  @par use
:: *
:: * command line> <code>prettyPrintItems.bat  [path-SyMenuItem.zip] [STATUS=open|close]</code>
:: * 
:: * CLI parameters:@n
:: *  -<tt>path-symenuitem.zip</tt>: absolute path or relative to the directory where this file is located. Use it to change at runtime the DEFAULTCONFIG, defined in this file.@n
:: *  -<tt>STATUS</tt>: Controls the default initial look of the HTML tree. Accepts two values: 'open'|'close'. Use it to change at runtime the default STATUS, defined in this file.@n
:: * 
:: *  Of course you can edit the defaults values of DEFAULTCONFIG, STAUS, to change it to suit your needs.
:: *
:: *  Extra option, NOT on CLI (you MUST edit the prettyPrintItems.bat file to change it):@n
:: *  <tt>INLINE_HEADER</tt> Controls the output of tags  &lt;style> and &gt;script> in HTML page. 
:: *       @li  <tt>none</tt>:    puts nothing (not used in <i>prettyPrint SyMenu</i>).
:: *       @li  <tt>true</tt>:    tags and full code are included in HEAD (or BODY), to make a stand-alone page (default)
:: *       @li  <tt>false</tt>:   puts in HEAD the relative default includes for local files in  <tt>.\\include</tt>
:: *       @li  <i>BaseURL</i>:   used for external (local or remote) files anywhere. @n   note: You can use here the files in http://www.o2xdl.org that I put in public domain for users convenience.
:: *
:: *   @par  PrettyPrintItems and SyMenu
:: *        In <b>SyMenu</b> you can add the 'PrettyPrint menu' entry  for <tt>PrettyPrintItems.bat</tt> using drag&drop (using defaults). The path is: <tt>.\\ProgramFiles\\ms-symtools\\prettyPrintItems.bat</tt>. @n
:: *        Next you can edit the Item to add icon, any required/optional CLI parameter, etc.@n
:: *        It runs better with 'Window Style' = Minimized, as here: <pre>
:: *        &lt;SyProgramCmd  windowStyle="2">
:: *             &lt;name>prettyPrint Default menu&lt;/name>
:: *             &lt;guid>83ed792d-fd7b-4593-b2b4-f5d3a3fac16f&lt;/guid>
:: *             &lt;icon>.\\Icons\\imageres_5375.ico&lt;/icon>
:: *             &lt;description>
:: *                 Run prettyPrintItems.BAT in hidden mode. Finally it shows the tree (HTML page) in the default browser.
:: *             &lt;/description>
:: *             &lt;path>.\\ProgramFiles\\ms-symtools\\prettyPrintItems.bat&lt;/path>
:: *             &lt;param>STATUS=open "..\..\Config\SyMenuItem.zip"&lt;/param>
:: *        &lt;/SyProgramCmd> </pre>
:: *
:: *  @par customization
:: *   1. The look of the resulting HTML page can be changed by editing the CSS in the result HTML file, or updating the <tt>libPrintCol2.xslt</tt> code, CSS section, or editing
:: *       the  <tt>[SyMenu]/ProgramFiles/ms-symtools/result/include/colCode.css</tt> file, if you use it. @n
:: *
:: *   2. You can cut a complete branch and paste it on another <i>HTML</i> page, or in <i>Doxygen</i> documentation, in <i>chm </i> help file, in <i>markdown</i> (.md) files, etc...  keeping the colors and the dynamic behavior. To do this:@n
:: *   @li You first thing to do is to insert in target page the CSS and Javascrip blocs. This can be done two ways:@n
:: *        - insert in HEAD the lines required to include external files (not always possible; e.g. using <i>Doxygen</i> you can't modify the HEAD) @n
:: *        - or copy in the BODY the <tt>&lt;style></tt> and <tt>&lt;script></tt> tags.
:: *   @li  Copy the required HTML fragment and paste it on the target page BODY, after the CSS and Javascript code, if you choose the second option. @n
:: *   note: The HTML source code contains detailed instructions to guide you. To see the source right-click on the browser window and choose 'View source' or 'HTML' 
:: *   or open the HTML file in a text editor for HTML (I use Notepad++)
:: *
:: * @par acknowledgments
:: *    @li <A href="https://www.7-zip.org/download.html" target="_blank">7z.exe</A>, in lib dir, is used to unzip the configuration file.
:: *    @li <A href="https://www.saxonica.com/download/dotnet.xml" target="_blank">SAXON_HE </A>,in lib dir, is the XMLT Transformer used.
:: *    @li The files <tt>libPrintCol2.xsl, xmlPrintSyItems.xslt</tt> comes (modified) from <A href="https://github.com/msillano/filters_dox" target="_blank">filters_dox</A>.
:: *    @li <A href="https://www.doxygen.nl/index.html" target="_blank">Doxygen</a> + filter_dox have been used to build this help.
:: *    @li <A href="https://www.ugmfree.it/forum/viewprofile.aspx?UserID=1" target="_blank">Gianluca</A> provided valuable insights to improve this program.
:: *
:: *    <i>I make this utility because I need it. This program is Open Source (<A href="https://github.com/msillano/ms_symtools" target="_blank">https://github.com/msillano/ms_symtools </A>) in the hope that it will be useful, without any warranty: it is very experimental. </i>
:: */

::/** @file
:: * @version 2.2  06/01/22 (beta) tested on Windows 11 Pro (21H2), SAXON_HE 15.05, and SyMenu  7.00.8038 [2022.01.03]
:: * @author Copyright 2021-2022 Marco Sillano.
:: */
rem code doc
::/**
:: *  Pseudo-function with actual BAT script code.
:: *
:: *  This program is a filter that uses a XSLT Transformer (SAXON) with a XSL files 'ad hoc': xmlPrintSyItems.xslt.
:: *  The program get a snapshot of the actual SyMenuItems.zip and produce3s a HTML tree presentation, colored and collapsible.
:: *  @par How it works
:: *     - START: checks the parameters and setup some vars (BATPATH and CONFIGFILE). If any error, it is sent to log.
:: *       If the <code>SyMenuItem.zip</code> isn't in his default directory, the user MUST change the defaults or add its actual path as parameter.
:: *     -# STEP: Unzip the <code>[SyMenu]/Config/SyMenuItem.zip</code> using 7.zip.
:: *       The result is in the temporary file <code> %TMP%/SyMenuItem.xml</code> @n
:: *     -# STEP: A XML transformer (SAXON) gets the <code>SyMenuItem.xml</code> file and, using the 'transformations'
:: *        <code>xmlPrintSyItems.xslt</code> and <code>libPrintCol.xsl</code>, produces in output the required (X)HTML file: <code>SyMenuItem_pp.AAAAMMGG-HHhMMmSSs.html</code>.
:: *     -# STEP: DONE: the result file or the log is sent to the default application. 
:: */

pushd .

:: ::  ================= STEP 0:  CD, CLI parameters and CHECKs
for %%i in ("%~dp0.") do SET "BATPATH=%%~fi"
CD /D %BATPATH%
:: portable dependencies
set EXE7ZFILE=.\Lib\7z.exe
set SAXON=.\Lib\Transform.exe

::  timestamp: ref: https://www.it-swarm.it/it/windows/creazione-di-un-nome-file-come-timestamp-un-processo-batch/967227137/
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set mytimestamp=%ldt:~0,4%%ldt:~4,2%%ldt:~6,2%-%ldt:~8,2%h%ldt:~10,2%m%ldt:~12,2%s
if not exist %BATPATH%\result\NUL (MKDIR %BATPATH%\result)
FOR /F "delims=" %%F IN ("result\SyMenuItem_pp_%mytimestamp%.html") DO SET "OUTFILE=%%~dpnxF"
::  cleanup...
del /Q "%TMP%\SyMenuItem.xml" > nul
ECHO ++++++ prettyPrintItems %mytimestamp%  >>prettyPrint.log 
:: processing USER INPUT CLI:  prettyPrintItems.bat  [path-SyMenuItem.zip] [STATUS=open|close]
SET USERFILE=none
:looptest
IF "%~1"=="" GOTO doneCLI
ECHO "%~x1X"| FIND /I ".zipX"  >NUL
IF %ERRORLEVEL% equ  0 GOTO setfile
ECHO "%~1"| FIND /I "STATUS"  >NUL
IF %ERRORLEVEL% equ  0 GOTO tagmode
:badCLI
if "%1" NEQ "" (
  echo Usage: prettyPrintItems.bat [menuzip] [STATUS=open^|close] >>prettyPrint.log
  echo Error: Unknown Option: %1 %2  >>prettyPrint.log
  goto :badoutput
  )
GOTO doneCLI
:setfile
 SET USERFILE=%~f1
 SHIFT
GOTO :looptest
:tagmode
 IF "%~2" equ "open"   goto okpar2
 IF "%~2" equ "close"  goto okpar2
  GOTO badCLI
:okpar2
  SET STATUS=%~2
  SHIFT
  SHIFT
GOTO :looptest
:doneCLI
:: Tests SyMenuItem.zip existence
FOR /F "delims=" %%F IN ("%DEFAULTCONFIG%") DO SET "CONFIGFILE=%%~dpnxF"
if "%USERFILE%" NEQ "none" (FOR /F "delims=" %%F IN ("%USERFILE%") DO SET "CONFIGFILE=%%~dpnxF")
if EXIST "%CONFIGFILE%"  (goto continue)
:: ERROR: the SyMenuItem.zip file  not found.
IF "%USERFILE%" equ "none" (
ECHO prettyPrintItems ERROR: the default SyMenuItem.zip file [%CONFIGFILE%] not found.       >>prettyPrint.log
 ) ELSE (
ECHO prettyPrintItems ERROR - Check parameter: SyMenuItem.zip file [%CONFIGFILE%] not found. >>prettyPrint.log
)
goto :badoutput
:continue

:: :: ================= STEP 1: UNZIP (using 7.zip)
:: ref: https://www.dotnetperls.com/7-zip-examples;  7z.exe path is: [SyMenu]/Lib/7z.exe. 
set EXE7ZFILE=.\Lib\7z.exe
"%EXE7ZFILE%" x "%CONFIGFILE%" -aoa -o%TMP% 1>NUL 2>> prettyPrint.log

if NOT EXIST "%TMP%\SyMenuItem.xml"  goto badoutput
ECHO STEP 1 OK: output "%TMP%\SyMenuItem.xml"  >> prettyPrint.log
:: :: ================= STEP 2: Transformation  XML => HTML (using SAXON)
:: see:  https://www.saxonica.com/documentation10/index.html#!using-xsl/commandline  
   %SAXON% -s:"%TMP%\SyMenuItem.xml"   -xsl:"%BATPATH%\xslt\prettyPrintItems.xslt"   -o:"%OUTFILE%" today=%mytimestamp% STATUS=%STATUS% INLINE_HEADER=%INLINE_HEADER%  2>> prettyPrint.log

if NOT EXIST "%OUTFILE%"  goto badoutput
:: checks also the file size
FOR /F "delims=" %%F IN ("%OUTFILE%") DO SET "OUTSIZE=%%~zF"
ECHO STEP 2 CHK: output file size: %OUTSIZE% >> MDexchange.log
IF %OUTSIZE% LSS 100  goto badoutput
ECHO =========== DONE OK: output "%OUTFILE%"  >> prettyPrint.log
:: :: ================ STEP 3: Show result  file (using default browser) or log, restore 'current dir'
popd
"%OUTFILE%"
 goto :EOF

:badoutput
ECHO ++++++ unexpected SYSTEM ERROR: run aborted. >> prettyPrint.log
popd
"%BATPATH%\prettyPrint.log"
goto :EOF
