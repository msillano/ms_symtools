@ECHO off
:: ********************** DEFAULTS IN CONFIG file ***************** 
:: fine tuneup for experts: change line 150 to have historical log.
CALL MDexchange.config.bat
rem file doc (for doxygen)
::/**  
:: *  @file 
:: *  <b>SyMenu to MD Export</b> produces a snapshot of the <i>SyMenu</i> Items structure, as an editable Markdown file.
:: *  This is a 'portable' application, and works only in union with <A HREF="www.ugmfree.it" target="_blank" >SyMenu</A>.
:: *
:: *  @par SyMenu MDExchange basic workflow 
:: *    @li  Export the actual SyMenu menu, via SyMenu2MDexport.bat: the MD result will be saved in NEWPATH and loaded into the 'MarkdownPad2' (MDEDITOR).
:: *    @li  Or you can start loading a 'shared' MD SyMenu file in 'MarkdownPad2'.
:: *    @li  Modify the MD file as desired (see rules in <tt>share\\MD-for-SyMenu.md</tt> or share\\MD-for-SyMenu.pdf).
:: *    @li  When finished with MarkdownPad2, export the MD file in (X)HTML mode, using the default INPATH.
:: *    @li  Use MD2SyMenuImport.bat to update your actual menu: If successful, the updated menu (xml) will be displayed (using XMLEDITOR). 
:: *         - If the REPLACE option is 'YES', use 'Reload' on SyMenu to update. 
:: *         - If REPLACE=NO, the output is the file <TT>[SyMenu]\\config\\SyMenuItems.new.zip</TT>. 
:: *
:: *  @par Preconditions
:: *   @li You must have <i>SyMenu</i>, installed, and a host Windows PC.
:: *   @li MarkdownPad2 must be installed on SyMenu or on the host. 
:: *   @li Verify the Java installation on your host machine (e.g. on the <tt>cmd</tt> console type: <tt>&gt;java  -version  [enter]</tt>). More on java portable installation here: <A  href="https://www.ugmfree.it/Forum/messages.aspx?TopicID=344"  target="_blank">https://www.ugmfree.it/Forum/messages.aspx?TopicID=344.</A>
:: *   @li Update the <tt>MDExchange.config.bat</tt> with required default options.
:: *
:: *  @par Parameters
:: *  Command line: <code>SyMenu2MDexport.bat  [path-SyMenuItem.zip] [path-newMenu.md] [MODE=FLAT|TREE|FULL] [HASHTAG=NONE|AUTO|USER]</code>
:: *  
:: * <i>The order of the parameters does not matter. All parameters are optional</i>.
:: *
:: *   - <tt>path-symenuitem.zip</tt>: absolute path or relative to the directory where this file is located. Use it to change at runtime the default location. @n
:: *
:: *   - <tt>path-newMenu.md</tt> identifies the output file for <i>MarkdownPad2</i>. Absolute or relative path.
:: *
:: *   - <tt>MODE</tt> This option controls the MD output. Values:
:: *              - <tt>FULL</tt>: The complete menu tree.
:: *              - <tt>FLAT</tt>: A unique list of all Items: useful to update names/descriptions.
:: *              - <tt>TREE</tt>: Only branches, to change the tree structure and  to share with other users.
:: *
:: *   - <tt>HASHTAG</tt> This command line option controls the global hashtag policy. Values:
:: *        - <tt>NONE</tt>: Hashtags not used. Existing hashtags are deleted. All tooltips are one line shorter.
:: *        - <tt>USER</tt>: Existing hashtag are respected, SyMenu and the user handle them.
:: *        - <tt>AUTO</tt>: All hashtags are automatically updated, reflecting the item position in the menu tree (dot notation).
:: *
:: * <i>Next options can't be changed at runtime in the CLI, but only in <tt>MDExchange.config.bat</tt></i>:
:: *   - <tt>VERBOSE</tt> YES|NO, adds extra info, statistics and START/END to any branch of the tree, useful for single branch editing.

:: *   - <tt>MDEDITOR</tt> <b>MarkdownPad2</b> is required: you MUST set the path:
:: *        -  <tt>relative</tt>: If both MDExchange and MarkdownPad2 are in SyMenu, the path can be relative (portable).
:: *        -  "": Uses the Windows host association to '.md': it MUST exist and MUST be MarkdownPad2.exe
:: *        -  <tt>absolute</tt>: Else the path can be absolute (not portable).
:: *
:: * <b>note</b>@n
:: *  -  For the MDExchange tools, all defaults are locate in a  single file (MDExchange.config.bat) shared by all tools. That simplifies the maintenance: the user must customize it only. 
:: *  - Using predefined names for files (NEWPATH and INPATH) makes the next tool, MD2SyMenuImport, more automatic.
:: *  - Any run appends info to the log file <tt>"[SyMenu]\ProgramFiles\ms-symtools\MDExchange.log"</tt>.
:: *
:: *  @par Input
:: *    The input is the actual SyMenuItem.zip file.@n
:: * <i>note:</i>  As default, this program tries to find the  <tt>SyMenuItems.zip</tt> configuration file in the standard position: [symenu]/Config/SyMenuItems.zip. You can change this default.@n
:: *     But you can have many SyMenu configuration files (<tt>SyMenuItems.zip</tt>), placed anywhere if you use the <tt>-fc</tt> <A href="https://www.ugmfree.it/SyMenuManual.aspx#CommandLine" target="_blank" >SyMenu parameter</A>.
:: *       In this case you MUST set the actual <tt>SyMenuItems.zip</tt> path as CLI parameter.
:: *
:: * @par  SyMenu2MDexport and SyMenu
:: *    In <b>SyMenu</b> you can add the 'SyMenu Export to MD' entry  for <tt>SyMenu2MDExport.bat</tt> using drag&drop (using defaults). @n
:: *    The path is: <tt>.\\ProgramFiles\\ms-symtools\\SyMenu2MDExport.bat</tt>. @n
:: *    Next you can edit the Item to add icon, and any required/optional CLI parameter. If the paths are not standard or you have many instances, you can add the required parameters on CLI or in MDExchange.config.bat.@n
:: *    It runs better with 'Window Style' = Minimized, as in this sample: <pre>
:: *        &lt;SyProgramCmd  windowStyle="2">
:: *             &lt;name>Export only Items&lt;/name>
:: *             &lt;guid>83ed792d-fd7b-4593-b2b4-f5d3a3fad16f&lt;/guid>
:: *             &lt;icon>.\\Icons\\imageres_5375.ico&lt;/icon>
:: *             &lt;description>
:: *                 Quiet exports to MD only Item names and descriptions for update.
:: *             &lt;/description>
:: *             &lt;path>.\\ProgramFiles\\ms-symtools\\SyMenu2MDExport.bat&lt;/path>
:: *             &lt;param>MODE=FLAT "..\..\Config\SyMenuItem.zip"&lt;/param>
:: *        &lt;/SyProgramCmd> </pre>
:: *
:: *  @par Output
:: *    The output is a correct Markdown file, with names and descriptions of all SyContainers and/or Items in menu, plus optional comments.
:: *    The output is saved in NEWPATH and open in MarkdownPad2.@n
:: *    *note:*  The file MDExchange.log will be displayed in case of problems.

:: *
:: * @par MD editing
:: *   Look at  <tt>share\\MD-for-SyMenu.pdf</tt> (or <tt>share\\MD.for-SyMenu.md</tt>) to get info about  formatting and editing.@n
:: *   For a better look of the HTML preview using <i>markdownPad2</i>, you can choose  as CSS the <tt>markdown.css</tt> (Tools|Options|Stylesheets), 
:: *   adding una tantum the following lines at end:  <pre>
:: *        /&lowast;...... H1, H2...H6  are the SyContainer name TAGs       &lowast;/
:: *        /&lowast;...... em is the description TAG (container and items)  &lowast;/
:: *        /&lowast;       em { white-space: pre; }        &lowast;/
:: *                 em { white-space: pre-wrap; }   
:: *        /&lowast;       em { display: none; }           &lowast;/
:: *                 em { display: block;
:: *                       font-style: italic;
:: *                       }  
:: *        /&lowast;...... dfn is the item name TAG ...................... &lowast;/
:: *                 dfn { font-weight: 600; 
:: *                       font-family: Arial, Helvetica, sans-serif;
:: *                       }
:: *        /&lowast;...... label is the SyLabel name  .................... &lowast;/
:: *                 label { font-style: italic;
:: *                       font-weight: 600; 
:: *                       }
:: *        /&lowast;...... hr.syseparator is the SySeparator TAG  ........ &lowast;/
:: *                 hr.syseparator  { width: 350px;
:: *                       border-top: 8px solid lightgrey;
:: *                       margin-bottom: -15px; 
:: *                       margin-right:auto;
:: *                       margin-left: 0;
:: *                       }   </pre>
:: *  This is not mandatory, but a good format in preview helps the reading, and this is a start point for custom skins.
:: *
:: * @par acknowledgments
:: *    @li <A href="http://markdownpad.com/news/2013/introducing-markdownpad-2/" target="_blank" >MarkdownPad2</a> is the Editor of choice for '.md' files. It is included in SyMenu Suite.
:: *    @li <A href="https://www.7-zip.org/download.html" target="_blank">7z.exe</A>, in lib dir, is used to unzip the configuration file.
:: *    @li <A href="https://www.saxonica.com/download/dotnet.xml" target="_blank">SAXON_HE </A>,in lib dir, is the XMLT Transformer used.
:: *    @li The file <tt>regexfilter.jar</tt> comes from <A href="https://github.com/msillano/filters_dox" target="_blank" >filters_dox</A>. 
:: *    @li <A href="https://www.doxygen.nl/index.html" target="_blank">Doxygen</a> + filter_dox have been used to build this help.
:: *
:: *    <i>I make this utility because I use it. This program is Open Source (<A href="https://github.com/msillano/ms_symtools" target="_blank" >https://github.com/msillano/ms_symtools </A>) in the hope that it will be useful, without any warranty: it is very experimental. </i>
:: */

::/** @file
:: * @version 2.1 19/01/22 (beta) tested on Windows 11 Pro (21H2), SAXON_HE 15.05,  and SyMenu  7.00.8038 [2022.01.03]
:: * @author Copyright 2021 Marco Sillano.
:: */
rem code doc
::/**
:: *  This program uses XSLT transformations and text editing, in successive steps.
:: *  XSLT files and <tt>Transformer.exe</tt> (SAXON) are used for the XML transformations, "regular expressions" (rgx) files and <tt>regexfilter.jar</tt> are used for text handling.
:: */

pushd .
:: PRE: on start: any working-dir 
:: ::  ================= STEP 0:  CD, CL parameters and CHECKs
for %%i in ("%~dp0.") do SET "BATPATH=%%~fi"
CD /D %BATPATH%
::  timestamp: ref: https://www.it-swarm.it/it/windows/creazione-di-un-nome-file-come-timestamp-un-processo-batch/967227137/
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set mytimestamp=%ldt:~0,4%%ldt:~4,2%%ldt:~6,2%-%ldt:~8,2%h%ldt:~10,2%m%ldt:~12,2%s
:: portable dependencies
set EXE7ZFILE=.\Lib\7z.exe
set SAXON=.\Lib\Transform.exe
if not exist %BATPATH%\result\NUL (MKDIR %BATPATH%\result)
::  IN next line: single ^> logs last run, double  ^>^> historical log
ECHO ++++++ SyMenu2MDExport %mytimestamp% > MDExchange.log 
::  cleanup...
IF EXIST "%TMP%\SyMenuItem.xml"  (del /Q "%TMP%\SyMenuItem.xml"  2>> MDExchange.log )
IF EXIST "%TMP%\MDExchange.*.*"  (del /Q "%TMP%\MDExchange.*.*"  2>> MDExchange.log )
:: processing USER INPUT CLI:  SyMenu2MDExport.bat  [path-SyMenuItem.zip] [path-newMenu.md]   [MODE=FLAT|TREE|MARK]  [HASHTAG=NONE|AUTO|USER]
SET USERFILE=none
FOR /F "delims=" %%F IN ("%NEWPATH%") DO SET "OUTFILE=%%~dpnxF"
:looptest
IF "%~1"=="" GOTO doneCLI
ECHO "%~x1X"| FIND /I ".zipX"  >NUL
IF %ERRORLEVEL% equ  0 GOTO setfile
ECHO "%~x1X"| FIND /I ".mdX"  >NUL
IF %ERRORLEVEL% equ  0 GOTO setout
ECHO "%~1"| FIND /I "HASHTAG"  >NUL
IF %ERRORLEVEL% equ  0 GOTO tagmode
ECHO "%~1"| FIND /I "MODE"  >NUL
IF %ERRORLEVEL% equ  0 GOTO startend
:badCLI
  echo STEP 0 ERROR: Unknown Option: %1 %2  >> MDExchange.log
  echo Usage: SyMenu2MDExport.bat [menuzip] [outfile] [HASHTAG=NONE^|AUTO^|USER] [MODE=FLAT^|TREE^|MARK] >> MDExchange.log
  goto :badoutput
:setfile
 SET USERFILE=%~f1
 SHIFT
GOTO :looptest
:setout
 SET OUTFILE=%~f1
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
:startend
 IF "%~2" equ "FLAT"   goto okpar3
 IF "%~2" equ "TREE"   goto okpar3 
 IF "%~2" equ "FULL"   goto okpar3
  GOTO badCLI
:okpar3
  SET MODE=%~2
  SHIFT
  SHIFT
GOTO :looptest
:doneCLI
:: ================== test existence of SyMenuItem.zip file.
IF EXIST "%OUTFILE%" (del /Q "%OUTFILE%"  2>> MDExchange.log )
:: Tests SyMenuItem.zip existence
FOR /F "delims=" %%F IN ("%DEFAULTCONFIG%") DO SET "CONFIGFILE=%%~dpnxF"
if "%USERFILE%" NEQ "none" (FOR /F "delims=" %%F IN ("%USERFILE%") DO SET "CONFIGFILE=%%~dpnxF")
if EXIST "%CONFIGFILE%"  (goto continue)
:: ERROR: the SyMenuItem.zip file  not found.
IF "%USERFILE%" equ "none" (
ECHO STEP 0 ERROR: the default SyMenuItem.zip file [%CONFIGFILE%] not found. >> MDExchange.log
 ) ELSE (
ECHO STEP 0 ERROR: Check parameters: SyMenuItem.zip file [%CONFIGFILE%] not found. >> MDExchange.log
)
goto :badoutput
:continue
:: :: ================= STEP 1: UNZIP (using 7.zip)
:: ref: https://www.dotnetperls.com/7-zip-examples;  7z.exe path is: [%BATPATH%]/Lib/7z.exe. 
set EXE7ZFILE=./Lib/7z.exe
"%EXE7ZFILE%" x "%CONFIGFILE%" -aoa -o%TMP%    1>NUL   2>> MDExchange.log

if NOT EXIST "%TMP%\SyMenuItem.xml"  goto badoutput
ECHO STEP 1 OK: output "%TMP%\SyMenuItem.xml"         >> MDExchange.log
:: :: ================= STEP 2: UTF_16LE  => UTF_8 (required by regexfilter)
:: ref: https://stackoverflow.com/questions/265370/utf-16-to-utf-8-conversion-for-scripting-in-windows
   powershell -c "(Get-Content %TMP%\SyMenuItem.xml)|ForEach-Object {$_ -Replace 'UTF-16', 'UTF-8' }|Out-File -Encoding "utf8" %TMP%\MDExchange.utf8.xml 2>> MDExchange.log"
   
if NOT EXIST "%TMP%\MDExchange.utf8.xml"  goto badoutput
ECHO STEP 2: output "%TMP%\MDExchange.utf8.xml"  >> MDExchange.log
:: :: ================= STEP 3: Pre-processing with regexfilter to process HASHTAG (option) plus XML pre-process
 if "%HASHTAG%" equ "USER"  (goto noclean)
   java.exe -jar regexfilter.jar .\rgx\MDE.clean_hashtag.rgx -b -i="%TMP%\MDExchange.utf8.xml" -o="%TMP%\MDExchange.toMD.xml"   2>> MDExchange.log" 
   COPY /y  "%TMP%\MDExchange.toMD.xml"  "%TMP%\MDExchange.utf8.xml"   1>NUL   2>> MDExchange.log
 :noclean
   java.exe -jar regexfilter.jar .\rgx\MDE.clean_xml.rgx -b -i="%TMP%\MDExchange.utf8.xml" -o="%TMP%\MDExchange.toMD.xml"         2>> MDExchange.log"  
   
if NOT EXIST "%TMP%\MDExchange.toMD.xml"  goto badoutput
ECHO STEP 3 OK: output "%TMP%\MDExchange.toMD.xml"  >> MDExchange.log
:: :: ================= STEP 4: Transformation XML => MD (using saxon)
   %SAXON%  -s:"%TMP%\MDExchange.toMD.xml"   -xsl:"%BATPATH%\xslt\MDE.export.xslt"   -o:"%TMP%\MDExchange.step1.md" HASHTAG=%HASHTAG%  MODE=%MODE% VERBOSE=%VERBOSE% timestamp=%mytimestamp% 2>> MDExchange.log
 
 if NOT EXIST "%TMP%\MDExchange.step1.md"  goto badoutput
 ECHO STEP 4 OK: output "%TMP%\MDExchange.step1.md"  >> MDExchange.log
:: :: ================= STEP 5: final cleanup of the MD file (using regexfilter)
  java.exe -jar regexfilter.jar .\rgx\MDE.clean_md.rgx -b -i="%TMP%\MDExchange.step1.md" -o="%OUTFILE%"   2>> MDExchange.log" 
 
if NOT EXIST "%OUTFILE%"  goto badoutput
:: checks also the file size
FOR /F "delims=" %%F IN ("%OUTFILE%") DO SET "OUTSIZE=%%~zF"
ECHO STEP 5 CHK: output file size: %OUTSIZE% >> MDExchange.log
IF %OUTSIZE% LSS 10  goto badoutput
ECHO SyMenu2MDExport DONE: output "%OUTFILE%"  >> MDExchange.log
:: :: ================= STEP 6: Show result: file or log (using MDEDITOR/notepad apps), restore 'current dir'
popd
start %MDEDITOR% "%OUTFILE%"
 goto :EOF
:badoutput
ECHO ++++++ unexpected SYSTEM ERROR: run aborted. >> MDExchange.log
popd
start "notepad.exe"  %BATPATH%\MDExchange.log"
goto :EOF
