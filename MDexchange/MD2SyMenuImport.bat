@ECHO off
:: ********************** DEFAULTS IN CONFIG file ***************** 
:: fine tuneup for expert: change line 123 to have historical log.
CALL MDExchange.config.bat
rem file doc (for doxygen)
::/**  
:: *  @file 
:: *  <b>MD to SyMenu Import</b> updates the  SyMenu Items structure, smart merging an MD file.
:: * Smart rules:
:: *  - If the root of the MD tree is "syRoot" (FULL and TREE cases)  the whole menu tree is updated.
:: *  - If the root of the MD tree is any old branch (case of partial-cut tree) only this branch is updated.
:: *  - Otherwise (FLAT case) the tree do not change, only the Items are updated in place.
:: * 
:: * In any case, this tool never deletes any Item. All Items from the original menu, but not present in the updated output, are grouped in a container named 'orphans'.
:: *
:: *  @par SyMenu MDExchange basic workflow 
:: *    @li  Export the actual SyMenu menu, via SyMenu2MDexport.bat: the MD result will be saved in NEWPATH and loaded into the 'MarkdownPad2' (MDEDITOR).
:: *    @li  Or you can start loading a 'shared' MD SyMenu file in 'MarkdownPad2'.
:: *    @li  Modify the MD file as desired (see rules in <tt>share\\MD-for-SyMenu.md</tt> or share\\MD-for-SyMenu.pdf).
:: *    @li  When finished with MarkdownPad2, export the MD file in (X)HTML mode, using the default INPATH.
:: *    @li  Use MD2SyMenuImport.bat to update your actual menu: If successful, the updated menu (xml) will be displayed (using XMLEDITOR). 
:: *       - If the REPLACE option is 'YES', use 'Reload' on SyMenu to update. 
:: *       - If REPLACE=NO, the output is the file <TT>[SyMenu]\\config\\SyMenuItems.new.zip</TT>. 
:: *
:: *  @par Preconditions
:: *   @li You must have <i>SyMenu</i>, installed, and a host Windows PC.
:: *   @li You must have MarkdownPad2 installed in SyMenu or in the host. This application is required to edit the .md files and to create the (X)HTML output.
:: *   @li  Verify the Java installation in your host machine (e.g. on <tt>cmd</tt> console type: <tt>&gt;java  -version  [enter]</tt>. More on java portable installation here: https://www.ugmfree.it/Forum/messages.aspx?TopicID=344.
:: *   @li Update the <tt>MDExchange.config.bat</tt> with required options.
:: * <i>note:</i>  As default, this program tries to find the  <tt>SyMenuItems.zip</tt> configuration file in the standard position: [symenu]/Config/SyMenuItems.zip. You can change this default.@n
:: *     But you can have many SyMenu configuration files (<tt>SyMenuItems.zip</tt>), placed anywhere if you use the <tt>-fc</tt> <A href="https://www.ugmfree.it/SyMenuManual.aspx#CommandLine" target="_blank" >parameter</A>.
:: *       In this case, to use this program, you MUST set as parameter the path to the actual <tt>SyMenuItems.zip</tt>.
:: *
:: *
:: *  @par Input
:: *    The input file is an (X)HTML file exported by MarkdownPad2 (INPATH).@n
:: *    The path can be changed in configuration or by a Command line parameter.
:: *  @par Output
:: *     See REPLACE parameter.
:: *
:: *  @par parameter
:: *  Command line: <code>MD2SyMenuImport.bat [path-SyMenuItem.zip] [path-newMenu.html] [HASHTAG=NONE|USER|AUTO] [REPLACE=YES|NO]</code>
:: *  
:: * <i>The order of the parameters does not matter. All parameters are optional</i>
:: * 
:: *   - <tt>path-SyMenuItem.zip</tt> identifies the SyMenuItem.zip file used. Required only if you use more than one SyMenu. Absolute or relative path.
:: *
:: *   - <tt>path-newMenu.html</tt> identifies the input file from <i>MarkdownPad2</i>. Absolute or relative path.
:: *
:: *   - <tt>HASHTAG</tt> This command line option controls the global hashtag policy. Values:
:: *        - <tt>NONE</tt>: Hashtags not used. Existing hashtags are deleted. All tooltips are one line shorter.
:: *        - <tt>USER</tt>: (default) Existing hashtag are respected, SyMenu and the user handle them.
:: *        - <tt>AUTO</tt>: All hashtags are automatically updated, reflecting the item actual position in the menu tree (dot notation).
:: *
:: *  - <tt>REPLACE</tt> Controls to output file processing, one of YES|NO. 
:: *       - <TT<YES</tt>: MD2SyMenuImport replaces the SyMenuItem.zip file used by SyMenu (you need do a SyMenu  restart or 'reload'). 
:: *            <i>note:</i> a backup is always done, so SyMenuUndo.bat can restore previous state.
:: *       - <tt>NO</tt>: saves the result as <tt>[SyMenu]\\config\\SyMenuItems.new.zip</tt>

:: * <i>Next option can't be changed at runtime in the CLI, but only in <tt>MDExchange.config.bat</tt>:
:: *   - <tt>VERBOSE</tt> YES|NO, adds extra info, like the source of any Item (update|original).
:: * 
:: *   - <tt>XMLEDITOR</tt>  A <b>text editor for XML</b> is required: e.g. Notepad++ (or your favorite XML editor):
:: *
:: * @par note
:: *   - To export then import the SyMenu is the 'identity' function, if MODE=FULL|FLAT: If HASHTAG=AUTO only HASHTAGs will be updated.
:: *   - If you export then import the SyMenu, with MODE=TREE, you do the 'nullify' function: you get an empty menu tree and all the Items in a 'orphans' Container.
:: *  -  For the MDExchange tools, all defaults are locate in a  single file (MDExchange.config.bat) shared by all tools. That simplifies the maintenance: the user must customize it only. 
:: *   - Using predefined names for files (NEWPATH and INPATH) makes easier the tools use.
:: *   - Any run appends info to a log file <tt>"[SyMenu]\ProgramFiles\ms-symtools\MDExchange.log"</tt>.
:: *  

:: *
:: *   @par  MD2SyMenuImport.bat and SyMenu
:: *    In <b>SyMenu</b> you can add the 'SyMenu Import from MD' entry  for <tt>MD2SyMenuImport.bat</tt> using drag&drop (using defaults). @n
:: *    The path is: <tt>.\\ProgramFiles\\ms-symtools\\MD2SyMenuImport.bat</tt>. @n
:: *    Next you can edit the Item to add icon, and any required/optional CLI parameter. If the paths are not standard or you have many instances, you can add the required parameters on CLI or in MDExchange.config.bat.@n
:: *    It runs better with 'Window Style' = Minimized, as in this sample: <pre>
:: *        &lt;SyProgramCmd  windowStyle="2">
:: *             &lt;name>Import from MD&lt;/name>
:: *             &lt;guid>83ed792d-fd7b-4593-b2b4-f5d3a3fad16f&lt;/guid>
:: *             &lt;icon>.\\Icons\\imageres_5375.ico&lt;/icon>
:: *             &lt;description>
:: *                 Quiet update for SyMenu. Do 'Reload' to activate the new menu.
:: *             &lt;/description>
:: *             &lt;path>.\\ProgramFiles\\ms-symtools\\MD2SyMenuImport.bat&lt;/path>
:: *             &lt;param>UPDATE=YES  HASHTAG=AUTO  "..\..\Config\SyMenuItem.zip"&lt;/param>
:: *        &lt;/SyProgramCmd> </pre>
:: *
:: *  
:: * @par acknowledgments
:: *    @li <A href="http://markdownpad.com/news/2013/introducing-markdownpad-2/" target="_blank" > MarkdownPad2</a> is the reference Editor I chose for '.md' files. It is included in SyMenu Suite.
:: *    @li <A href="https://www.7-zip.org/download.html" target="_blank" >7z.exe</A>, in lib dir, is used to unzip the configuration file.
:: *    @li <A href="https://www.saxonica.com/download/dotnet.xml" target="_blank">SAXON_HE </A>,in lib dir, is the XMLT Transformer used.
:: *    @li The file <tt>regexfilter.jar</tt> comes from <A href="https://github.com/msillano/filters_dox" target="_blank" >filters_dox</A>.
:: *    @li <A href="https://www.doxygen.nl/index.html" target="_blank" >Doxygen</a> + filter_dox have been used to build this help.
:: *
:: *    <i>I make this utility because I need it. This program is Open Source (<A href="https://github.com/msillano/ms_symtools" target="_blank" >https://github.com/msillano/ms_symtools </A>) in the hope that it will be useful, without any warranty: it is very experimental. </i>
:: */

::/** @file
:: * @version 2.1 19/01/22 (beta) tested on Windows 11 Pro (21H2), java  17.0.1 and SyMenu  6.16.7962 [2021.10.19]
:: * @author Copyright 2021 Marco Sillano.
:: */
rem code doc
::/**
:: *
:: *  This program updates the actual SyMenu configuration file using a (X)HTML file exported by <i>MarkdownPad2</i>.
:: *  It uses XSLT transformations for the conversion (X)HTML to XML, and a regex filter for text handling.
:: */

pushd .
:: PRE: on start: any working-dir 
:: ::  ================= STEP 0:   CD, CL parameters and CHECKs
for %%i in ("%~dp0.") do SET "BATPATH=%%~fi"
CD /D %BATPATH%
:: timestamp (same format as SyMenu). ref: https://www.it-swarm.it/it/windows/creazione-di-un-nome-file-come-timestamp-un-processo-batch/967227137/
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set mytimestamp=%ldt:~0,4%%ldt:~4,2%%ldt:~6,2%-%ldt:~8,2%h%ldt:~10,2%m%ldt:~12,2%s
:: portable dependencies
set EXE7ZFILE=.\Lib\7z.exe
set SAXON=.\Lib\Transform.exe
if not exist %BATPATH%\result\NUL (MKDIR %BATPATH%\result)
:: start
::  IN next line: ^> logs last run,  ^>^> historical log
ECHO ++++++ MD2SyMenuImport %mytimestamp%  > MDExchange.log 
:: cleanup temp files
IF EXIST "%TMP%\SyMenuItem.xml" (del /Q "%TMP%\SyMenuItem.xml"     2>> MDExchange.log)
IF EXIST "%TMP%\MDExchange.*.*" (del /Q "%TMP%\MDExchange.*.*"     2>> MDExchange.log)
:: processing USER INPUT CLI 
SET USRCONFIG=none
SET INFILE=none
:looptest
IF "%~1"=="" GOTO doneCLI
ECHO "%~x1X"| FIND /I ".zipX"
IF %ERRORLEVEL% equ  0 GOTO setconf
ECHO "%~x1X"| FIND /I ".htmlX"
IF %ERRORLEVEL% equ  0 GOTO setinput
ECHO "%~1"| FIND /I "HASHTAG"
IF %ERRORLEVEL% equ  0 GOTO tagmode
ECHO "%~1"| FIND /I "REPLACE"
IF %ERRORLEVEL% equ  0 GOTO replace
:badCLI
  echo STEP 0 ERROR: Unknown Option: %1 %2  >> MDExchange.log
  echo Usage: MD2SyMenuImport.bat  [path-SyMenuItem.zip] [path-newMenu.html] [HASHTAG=NONE^|USER^|AUTO] [REPLACE=YES^|NO] >> MDExchange.log
  goto :badexit
:setconf
 SET USRCONFIG=%~f1
 SHIFT
GOTO :looptest
:setinput
 SET INFILE=%~f1
 SHIFT
GOTO :looptest
:tagmode
  IF "%~2" equ "NONE"  goto okpar2
  IF "%~2" equ "AUTO"  goto okpar2
  IF "%~2" equ "USER"  goto okpar2
  GOTO badCLI
:okpar2
  SET HASHTAG=%~2
  SHIFT
  SHIFT
GOTO :looptest
:replace
  IF "%~2" equ "YES" goto okpar3
  IF "%~2" equ "NO"  goto okpar3
   GOTO badCLI
:okpar3
  SET REPLACE=%~2
  SHIFT
  SHIFT
GOTO :looptest
:doneCLI
:: ================= test existence of SyMenuItem.zip and input MD file.
:: Test SyMenuItem.zip existence
FOR /F "delims=" %%F IN ("%DEFAULTCONFIG%") DO SET "CONFIGFILE=%%~dpnxF"
if "%USRCONFIG%" NEQ "none" (FOR /F "delims=" %%F IN ("%USRCONFIG%") DO SET "CONFIGFILE=%%~dpnxF")
if EXIST "%CONFIGFILE%"  goto continue
:: ERROR: the SyMenuItem.zip file  not found.
IF "%USRCONFIG%" equ "none" (
ECHO STEP 0 ERROR: the default SyMenuItem.zip file [%CONFIGFILE%] not found. >> MDExchange.log
 ) ELSE (
ECHO STEP 0 ERROR: Check parameter: SyMenuItem.zip file [%CONFIGFILE%] not found. >> MDExchange.log
)
goto :badexit
:continue
:: Test path-newMenu.html existence
FOR /F "delims=" %%F IN ("%INPATH%") DO SET "INPATH=%%~dpnxF"
if "%INFILE%" NEQ "none" (FOR /F "delims=" %%F IN ("%INFILE%") DO SET "INPATH=%%~dpnxF")
if EXIST "%INPATH%"  goto okinput
IF "%INFILE%" equ "none" (
ECHO STEP 0 ERROR: the default input ^(X^)HTML file [%INPATH%] not found. >> MDExchange.log
 ) ELSE (
ECHO STEP 0 ERROR: Check parameter:  the input ^(X^)HTML file [%INPATH%] not found >> MDExchange.log
)
goto :badexit
:okinput
:: :: ================= STEP 1: BACKUP and UNZIP (using 7.zip)
:: ref: https://www.dotnetperls.com/7-zip-examples;  7z.exe path is: [%BATPATH%]/Lib/7z.exe. 
:: ?? import shutil
FOR %%i IN ("%CONFIGFILE%") DO ( SET CONFDIR=%%~dpi) 
IF "%REPLACE%" equ "YES"  (
   copy "%CONFIGFILE%", "%CONFDIR%SyMenuItem.bak.%mytimestamp%.zip"  1>NUL 2>> MDExchange.log
   )
"%EXE7ZFILE%" x "%CONFIGFILE%" -aoa -o%TMP% 1>NUL  2>> MDExchange.log

if NOT EXIST "%TMP%\SyMenuItem.xml"  goto badexit
ECHO STEP 1 OK: output "%TMP%\SyMenuItem.xml"  >> MDExchange.log
:: :: ================= STEP 2: UTF_16LE  => UTF_8 
:: ref: https://stackoverflow.com/questions/265370/utf-16-to-utf-8-conversion-for-scripting-in-windows
   powershell -c "(Get-Content %TMP%\SyMenuItem.xml)|ForEach-Object {$_ -Replace 'UTF-16', 'UTF-8' }|Out-File -Encoding "utf8" %TMP%\MDExchange.utf8.xml 2>> MDExchange.log"
  
 if NOT EXIST "%TMP%\MDExchange.utf8.xml"  goto badexit
 ECHO STEP 2 OK: output "%TMP%\MDExchange.utf8.xml"  >> MDExchange.log
 del /Q  "%TMP%\SyMenuItem.xml"   1>NUL   2>>MDExchange.log
:: :: ================= STEP 3: Pre-processing imput HTML with regexfilter 
   java.exe -jar regexfilter.jar .\rgx\MDE.import_md.rgx -b -i="%INPATH%"  -o="%TMP%\MDExchange.fromMD.xml"    2>> MDExchange.log
   
if NOT EXIST "%TMP%\MDExchange.fromMD.xml"  goto badexit
ECHO STEP 3 OK: output "%TMP%\MDExchange.fromMD.xml"  >> MDExchange.log
:: :: ================= STEP 4: Transformation  XHTML = XML (using xmlfilter/saxon)
 :: to uses the external saxon install the .NET version from: https://www.saxonica.com/download/dotnet.xml
 :: see also:  https://www.saxonica.com/documentation10/index.html#!using-xsl/commandline  
   %SAXON%  -xsl:"%BATPATH%\xslt\MDE.convert_md_to_xml.xslt"   -s:"%TMP%\MDExchange.fromMD.xml"  -o:"%TMP%\MDExchange.update.xml"  2>> MDExchange.log
 
if NOT EXIST "%TMP%\MDExchange.update.xml"  goto badexit
ECHO STEP 4 OK: output "%TMP%\MDExchange.update.xml"  >> MDExchange.log
:: :: ================= STEP 5: Cut old hashtag (optional) + Smart Merge Transformation 2XML => XML 

IF "%HASHTAG%" equ "USER" goto nocut
    java.exe -jar regexfilter.jar .\rgx\MDE.clean_hashtag.rgx -b -i="%TMP%\MDExchange.update.xml"  -o="%TMP%\MDExchange.upd_cut.xml"    2>> MDExchange.log
    java.exe -jar regexfilter.jar .\rgx\MDE.clean_hashtag.rgx -b -i="%TMP%\MDExchange.utf8.xml"    -o="%TMP%\MDExchange.utf8_cut.xml"   2>>  MDExchange.log
COPY /y "%TMP%\MDExchange.upd_cut.xml"  "%TMP%\MDExchange.update.xml"    1>NUL   2>> MDExchange.log
COPY /y "%TMP%\MDExchange.utf8_cut.xml" "%TMP%\MDExchange.utf8.xml"   1>NUL   2>> MDExchange.log
:nocut
:: note: files to be merged passed as parameter to XSLT: oldfile and newfile (MDE.empty.xml is required by v. XSLT 1.0, but it is dummy)
    %SAXON% -s:"%BATPATH%\xslt\MDE.empty.xml"  -xsl:"%BATPATH%\xslt\MDE.merge_menu.xslt"   -o:"%TMP%\MDExchange.merged8.xml" oldfile="%TMP%\MDExchange.utf8.xml"  newfile="%TMP%\MDExchange.update.xml"  HASHTAG=%HASHTAG%  VERBOSE=%VERBOSE% 2>> MDExchange.log

if NOT EXIST "%TMP%\MDExchange.merged8.xml"  goto badexit
ECHO STEP 5 OK: output "%TMP%\MDExchange.merged8.xml"  >> MDExchange.log
:: :: ================= STEP 6: Add orphans to output
     %SAXON%  -s:"%BATPATH%\xslt\MDE.empty.xml"  -xsl:"%BATPATH%\xslt\MDE.add_orphans.xslt"   -o:"%TMP%\MDExchange.full8.xml" oldfile="%TMP%\MDExchange.utf8.xml"  newfile="%TMP%\MDExchange.merged8.xml"  HASHTAG=%HASHTAG% VERBOSE=%VERBOSE%   today="%mytimestamp%" 2>> MDExchange.log

if NOT EXIST "%TMP%\MDExchange.full8.xml"  goto badexit
ECHO STEP 6 OK: output "%TMP%\MDExchange.full8.xml"  >> MDExchange.log
:: :: ================= STEP 7: Some cleanup in UTF-8
::   "XTSE0020  Serialization parameter Q{.../saxon.sf.net/}newline is not available in Saxon-HE" so now we have 'LF' in place of 'CRLF' 
    java.exe -jar regexfilter.jar .\rgx\MDE.import_xml.rgx -b -i="%TMP%\MDExchange.full8.xml"  -o="%TMP%\MDExchange.full8ok.xml"  2>> MDExchange.log

if NOT EXIST "%TMP%\MDExchange.full8ok.xml"  goto badexit
ECHO STEP 7 OK: output "%TMP%\MDExchange.full8ok.xml"  >> MDExchange.log
:: :: ================= STEP 8:back to UTF-16
    powershell -c "(Get-Content "%TMP%\MDExchange.full8ok.xml"  -Encoding "UTF8") |ForEach-Object {$_ -Replace 'UTF-8', 'UTF-16' }|Out-File -Encoding "unicode" "%TMP%\SyMenuItem.xml" 2>> MDExchange.log"

if NOT EXIST "%TMP%\SyMenuItem.xml"  goto badexit
:: now checks also the file size
FOR /F "delims=" %%F IN ("%TMP%\SyMenuItem.xml") DO SET "OUTSIZE=%%~zF"
ECHO STEP 8 CHK: output file size: %OUTSIZE% >> MDExchange.log
IF %OUTSIZE% LSS 100  goto badexit
ECHO STEP 8 OK: output "%TMP%\SyMenuItem.xml"  >> MDExchange.log
:: :: ================= STEP 9: Zip and (optional) replace
IF EXIST "%CONFDIR%SyMenuItem.new.zip" (
    del /Q  "%CONFDIR%SyMenuItem.new.zip"   1>NUL   2>>MDExchange.log
    )
   "%EXE7ZFILE%" a -tzip  "%CONFDIR%SyMenuItem.new.zip" "%TMP%\SyMenuItem.xml"  1>NUL 2>> MDExchange.log
if NOT EXIST "%CONFDIR%SyMenuItem.new.zip" goto badexit

IF "%REPLACE%" equ "NO"  goto doneNO
 :: doneYES
COPY /y  "%CONFDIR%SyMenuItem.new.zip" "%CONFDIR%SyMenuItem.zip"   1>NUL   2>> MDExchange.log
if NOT EXIST "%CONFDIR%SyMenuItem.zip" goto badexit
del /Q  "%CONFDIR%SyMenuItem.new.zip"   1>NUL 2>> MDExchange.log
ECHO MD2SyMenuImport  DONE - REPLACE=YES:  updated "%CONFDIR%SyMenuItem.zip", you must do [reload] on SyMenu. >> MDExchange.log
goto doneOK
:doneNO
ECHO MD2SyMenuImport  DONE - REPLACE=NO: output "%CONFDIR%SyMenuItem.new.zip"  >> MDExchange.log
:: :: =================  Show result file or log (using XMLEDITOR/notepad apps), restore 'current dir'
:doneOK
popd
start %XMLEDITOR% "%TMP%\SyMenuItem.xml" 
goto :EOF
:: ============== bad EXIT
:badexit
ECHO ++++++ unexpected SYSTEM ERROR: run aborted. >> MDExchange.log
popd
start "notepad" "%BATPATH%\MDExchange.log"
goto :EOF
