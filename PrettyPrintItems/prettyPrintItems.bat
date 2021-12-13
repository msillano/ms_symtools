rem @ECHO off
rem file doc (for doxygen)
::/**  
:: *  @file 
:: *  <b>prettyPrint SyMenu</b> (<tt>prettyPrintItems.bat</tt>) is the first utility I wrote for me and other <i>SyMenu</i> expert users.
:: *  It produces a snapshot of the  menu Items structure, as a dynamic HTML page, from the <code>SyMenuItem.zip</code> configuration file, essentially for documentation purposes. 
:: *  You get all info about nodes, also the internal <i>programGUID</i> required by  <i>SyMenu</i> CL parameter
:: * <A href="https://www.ugmfree.it/SyMenuManual.aspx#CommandLine" >-run{programGUID}</A>. @n
:: *  This is a 'portable' implementation that works only in union with <A HREF="www.ugmfree.it">SyMenu</A>.@n
:: *  You can also cut HTML fragments and paste them into custom HTML pages.@n
:: *
:: *  @par Preconditions
:: *  You must have <i>SyMenu</i>, installed and working: 
:: *    @li As default, this program tries to find the  <tt>SyMenuItems.zip</tt> configuration file in the standard position: [symenu]/Config/SyMenuItems.zip.
:: *    @li You can have many <tt>SyMenuItems.zip</tt> placed anywhere (if you use <tt>-fc</tt> or <tt>-fp</tt> <A href="https://www.ugmfree.it/SyMenuManual.aspx#CommandLine">parameter</A> ).
:: *       In this case, calling this program, you MUST use as a parameter the path complete to the <tt>SyMenuItems.zip</tt>.
:: *
:: *  @par Installation
:: *   @li  Unzip this pachage in <tt>[SyMenu]/ProgramFiles</tt>, so you get: <tt>[SyMenu]/Programfiles/sm-symtools/prettyPrintItems.bat</tt> .. etc.
:: *
:: *   @li  Verify the Java installation in your host machine (e.g. on <tt>cmd</tt> console type: <tt>&gt;java  -version  [enter]</tt>. More on java portable installation here: https://www.ugmfree.it/Forum/messages.aspx?TopicID=344.
:: *
:: *   @li  In <b>SyMenu</b> you can add the 'PrettyPrint menu' entry  for <tt>PrettyPrintItems.bat</tt> using drag&drop (using default). @n
:: *        If the path is not standard or you have many instances, add into the configuration the required parameter. Here you can use relative paths too: SyMenu cares about the conversion.
:: *
:: *   @par How to run PrettyPrintItems hidden
:: *    The <tt>prettyPrintItems.bat</tt> runs in a <tt>cmd</tt> console (if you comment the first line, <tt>"rem @ECHO OFF"</tt> you will see the program running line-by-line).
:: *    I don't like this behavior, useful only on debug,
:: *  so I added the file <tt>runTools.hide.vbs</tt>.  This little VBS program is general purpose: it runs hidden any BAT file passed as a parameter. 
:: *   See <A href="https://ss64.com/vb/run.html" >invisible.vbs</A>.@n
:: *   In <b>SyMenu</b> you can add the <i>PrettyPrint menu</i> entry for the silent mode. You MUST edit the configuration like this two examples:<code><pre>
:: *               -&lt;SyProgramCmd>
:: *                    &lt;name>pp SyMenu (default)&lt;/name>
:: *                    &lt;description>
:: *                         Shows the menu tree of main SyMenu in the default browser.
:: *                    &lt;/description>
:: *                    &lt;path>wscript.exe&lt;/path>
:: *                    &lt;param>
:: *                         "runTools.hide.vbs" "prettyPrintItems.bat"
:: *                    &lt;/param>
:: *              &lt;/SyProgramCmd>
:: *
:: *              &lt;SyProgramCmd>
:: *                    &lt;name>pp SyMenu (MMedia)&lt;/name>
:: *                    &lt;description>
:: *                        Shows the menu tree of MultiMedia SyMenu in the default browser.
:: *                    &lt;/description>
:: *                    &lt;path>wscript.exe&lt;/path>
:: *                    &lt;param>
:: *                        "runTools.hide.vbs" "prettyPrintItems.bat"  "./../../config MM/SyMenuItems.zip"]
:: *                    &lt;/param>
:: *               &lt;/SyProgramCmd>
:: *               </pre> </code>
:: *    Note:
:: *          @li The program <tt>Path</tt>  MUST be <b>wscript.exe</b> (only the file name, don't use quotes here)
:: *          @li The parameters MUST be the VBS file and the BAT file. If required add the <tt>SyMenuItems.zip</tt> path. You can also use absolute paths if you like.
:: *          @li Use double quotes around the paths in the <i>parameter section</i>.
:: *          @li If you plan to use <tt>trunTools.hide.vbs</tt> for other BAT files, a caveat: all arguments sent to BAT file are in doubles quotes.
:: *
:: *  @par Output
:: *   The output file path is like: <tt>"[SyMenu]/ProgramFiles/ms-symtools/result/SyMenuItem_pp_2021-12-07_14h10m40s.html"</tt>.
:: *   As default, this file is standalone, i.e. it can be moved where you like. @n
:: *
:: *  @par parameter
:: *   Two parameters control some aspects of the output HTML page:
:: *   @li  <tt>status</tt>: defines the initial look of the tree: open (default) or close.
:: *   @li  <tt>INLINE_HEADER</tt>: controls the handling of required style and script tags.  Enbedded (default) or included, both local or remote.  
:: *
:: *   You can change the defaults by editing the last line of code. For more info see xmlPrintSyItems.xslt.
:: *
:: *  @par customization
:: *   1. The look of the resulting HTML page can be changed by editing the CSS in any HTML or updating the <tt>libPrintCol2.xslt</tt> code, CSS section, or editing
:: *       the  <tt>[SyMenu]/ProgramFiles/ms-symtools/result/include/colCode.css</tt> file, if you use it. @n
:: *
:: *   2. You can cut a complete branch and paste it on another <i>HTML</i> page, or in <i>Doxygen</i> documentation, in <i>chm</i> help file, in <i>markdown</i> (.md) files, etc...  keeping the colors and the dynamic behavior. To do this:@n
:: *   @li The first thing to do is to insert in target page the CSS and Javascrip blocs. Thath can be done by two ways:@n
:: *        - insert in HEAD the lines required to include external files (not always possible; e.g. using <i>Doxygen</i> you can't modify the HEAD) @n
:: *        - or copy in the BODY the <tt>%lt;style></tt> and <tt>&lt;script></tt> tags.
:: *   @li  Copy the required HTML fragment and paste it on the target page BODY, after the CSS and Javascript code, if you choose the second option. @n
:: *   note: The HTML source code contains detailed instructions to guide you. To see the source right-click on the browser window and choose 'View source' or 'HTML' 
:: *   or open the HTML file in a text editor for HTML (I use notepad++)
:: *
:: *
:: * @par acknowledgments
:: *    @li <A href="https://www.7-zip.org/download.html">7z.exe</A> is used to unzip the configuration file.
:: *    @li The files <tt>xmlfilter.jar, libPrintCol2.xsl, xmlPrintSyItems.xslt</tt> comes (modified) from <A href="https://github.com/msillano/filters_dox">filters_dox</A>.
:: *    @li <A href="https://www.doxygen.nl/index.html">Doxygen</a> + filter_dox have been used to build this help.
:: *    @li <A href="https://www.ugmfree.it/forum/viewprofile.aspx?UserID=1">Gianluca</A> provided valuable insights to improve the alpha version of this program.
:: *
:: *    <i>I make this utility because I need it. This program is Open Source (<A href="https://github.com/msillano/ms_symtools">https://github.com/msillano/ms_symtools </A>) in the hope that it will be useful, without any warranty: it is very experimental. </i>
:: */

::/** @file
:: * @version 2.0 12/12/21 (beta) tested on Windows 11 Pro (21H2), java  17.0.1 and SyMenu  6.16.7962 [2021.10.19]
:: * @author Copyright 2021 Marco Sillano.
:: */
rem code doc
::/**
:: *  Pseudo-function with actual BAT script code.
:: *
:: *  This program is a filter that uses <tt>xmlfilter.java</tt> with a XSL files 'ad hoc': xmlPrintSyItems.xslt.
:: *  The program getsd a snapshot of the actual SyMenuItems.zip and produces an HTML tree presentation, colored and collapsable.
:: *  @par How it works
:: *     -# STEP: checks the paths and setup some vars (BATPATH and CONFIGFILE). If any error, die.
:: *       If the <code>SyMenuItem.zip</code> is't in his default directory, the user MUST add its actual path as a parameter.
:: *     -# STEP: Unzip the <code>[SyMenu]/Config/SyMenuItem.zip</code> using 7.zip.
:: *       The result is in the temporary file <code> %TMP%/SyMenuItem.xml</code> @n
:: *     -# STEP: Copy <code>[SyMenu]/Config/SyMenuItem/SyMenuItem.xml</code> (UTF-16LE) to the temporary file <code> %TMP%/SyMenuItem8.xml</code> (UTF-8).
:: *       The UTF-8 format is required by the next step: the XML parser don't accepts BOMs.
:: *     -# STEP: A XML transformer (<code>xtmlfilter</code>, in java) gets the <code>SyMenuItem8.xml</code> file and, <code>xmlPrintSyItems.xslt</code>using the 'transformations'
:: *        <code>xmlPrintSyItems.xslt</code> and <code>libPrintCol.xsl</code>, produces in output the required HTML file <code>SyMenuItem_pp.AAAAMMGG-HHhMMmSSs.html</code>.
:: *     -# STEP: The resulting file is sent to the default browser. 
:: */

:: You can remove "rem" from following two lines, if you'd like to use a specific java jre or jrk (example):
rem set JAVA_HOME=C:/j2sdk1.4.2_10
rem set PATH=%JAVA_HOME%/bin

pushd .
:: error messages: 
SET ERRMSG1=^^^<b^^^>PrettyPrint ERROR:^^^</b^^^> ^^^<BR^^^> The standard SyMenu configuration file not found: ^^^<CODE^^^>[symenu]/Config/SyMenuItem.zip^^^</CODE^^^>!^^^<BR^^^>. Not standard? Maybe you must add the full path of the config file in use.
SET ERRMSG2=^^^<b^^^>PrettyPrint ERROR: ^^^</b^^^>^^^<BR^^^> The configuration file ^^^<CODE^^^>SyMenuItem.zip^^^</CODE^^^> not found!^^^<BR^^^>Check the parameter. Now it is ^^^<CODE^^^>[%1]^^^</CODE^^^>. 
:: in any working-dir on start
:: ::  ================= STEP 0:  CHECKs
for %%i in ("%~dp0.") do SET "BATPATH=%%~fi"
ECHO Tool working-dir is: %BATPATH%
CD /D %BATPATH%
:: OUTPUT file, with timestamp
rem ref: https://www.it-swarm.it/it/windows/creazione-di-un-nome-file-come-timestamp-un-processo-batch/967227137/
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set mytimestamp=%ldt:~0,4%-%ldt:~4,2%-%ldt:~6,2%.%ldt:~8,2%h%ldt:~10,2%m%ldt:~12,2%s
if not exist %BATPATH%/result/NUL (MKDIR %BATPATH%/result)
set OUTFILE=%BATPATH%/result/SyMenuItem_pp_%mytimestamp%.html
:: get  CONFIGFILE the SyMenuItems.zip full path.
if .%1==. (set CONFIGFILE=%BATPATH%/../../Config/SyMenuItem.zip) & GOTO test
if exist %1 (set CONFIGFILE=%~1)
::  only for test.
rem ECHO default "%BATPATH%/../../Config/SyMenuItem.zip"
rem ECHO test1   "%1"
:test
if EXIST "%CONFIGFILE%"  goto continue
:: ERROR: the SyMenuItem.zip file  not found.
ECHO Pretty Printer ERROR: the SyMenuItem.zip file [%CONFIGFILE%] not found.
IF .%1==. (ECHO %ERRMSG1% > %OUTFILE%) ELSE (ECHO %ERRMSG2% > %OUTFILE%)
goto :showout
:continue
:: :: ================= STEP 1: UNZIP (using 7.zip)
:: ref: https://www.dotnetperls.com/7-zip-examples;  7z.exe path is: [SyMenu]/Lib/7z.exe. 
set EXE7ZFILE=./Lib/7z.exe
%EXE7ZFILE% x "%CONFIGFILE%" -aoa -o%TMP%  >NUL
:: :: ================= STEP 2: UTF_16LE  => UTF_8noBOM (xmlfilter parser don't process UTF_16LE)
:: ref: https://stackoverflow.com/questions/265370/utf-16-to-utf-8-conversion-for-scripting-in-windows
powershell -c "(Get-Content %TMP%/SyMenuItem.xml)|ForEach-Object {$_ -Replace 'UTF-16', 'UTF-8' }|Set-Content %TMP%/SyMenuItem8.xml"
:: :: ================= STEP 3: Transformation  XML => HTML (using xmlfilter)
:: :: parameter: you can add in next line  --usr="INLINE_HEADER&xxx" and/or --usr="status&xxx" to control the output. See help: xmlPrintSyItems.xsl, 'variables' topic.
:: ::  e.g.  java.exe -jar xmlfilter.jar ./xslt/xmlPrintSyItems.xslt -i %TMP%/SyMenuItem8.xml  --usr="status&close" --usr="INLINE_HEADER&http://www.o2xdl.org" > "%OUTFILE%"
java.exe -jar xmlfilter.jar ./xslt/xmlPrintSyItems.xslt -i %TMP%/SyMenuItem8.xml > "%OUTFILE%"
:showout
:: :: ================= STEP 4: Show result  file (using default browser), restore 'current dir'
popd
"%OUTFILE%" 
 