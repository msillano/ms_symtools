rem @ECHO off
::  *********************  DEFAULT CONFIG (user can edit)
:: ---- defaults, can be updated by CL parameters:
rem DEFAULTCONFIG: the SyMenu configuration zip file, absolute path or relative to the directory where this file is located.
set DEFAULTCONFIG=..\..\Config\SyMenuItem.zip
rem BASEPATH defines where BAT will make directories:
:: set BASEPATH=D:\USER\SyMenu\documents
set BASEPATH=.
rem ONLYTREE define the created dirs, values YES|NO. 
SET ONLYTREE=NO
rem DUMMY, creates a small file in any new directory, so you can use cleanup tools that deletes empty directories. Values YES|NO
SET DUMMY=NO
rem POSID, If YES, any dir has a position index: '05_xxxx'. WARNING: if a container changes position in the menu, this option creates a new dir. 
rem  To make the dirs updateable, better to use 'NO'.  Values YES|NO.
SET POSID=YES
:: fine tuneup for expert: change line 112 to have historical log.
:: ************************************* (edit ends)

rem file doc (for doxygen)
::/**  
:: *  @file 
:: *  <b>SyMenu to dir</b> (<tt>SyMenu2dir.bat</tt>) is a simple utility that creates a BAT file to get a folder structure isomorphic to the SyMenu's tree.
:: *  This is a 'portable' implementation that works only in union with <A HREF="www.ugmfree.it">SyMenu</A>.@n
:: *
:: *  @par Preconditions
:: *  You must have <i>SyMenu</i>, installed and working: 
:: *    @li As default, this program tries to find the  <tt>SyMenuItems.zip</tt> configuration file in the standard position: [symenu]/Config/SyMenuItems.zip.
:: *    @li You can change this behavior editing the default in this file or using as parameter the path to the actual <tt>SyMenuItems.zip</tt>.
:: *
:: *  @par Installation
:: *   @li  Unzip this package in <tt>[SyMenu]/ProgramFiles</tt>, so you get: <tt>[SyMenu]/Programfiles/sm-symtools/SyMenu2dir.bat</tt> .. etc.
:: *
:: *  @par Output
:: *   The output file path is like: <tt>"[SyMenu]/ProgramFiles/ms-symtools/result/makeMyMenuDir.20211207-14h10m40s.bat"</tt>.
:: *   If you defines a BASEPATH not like ".", the BAT output file can be run without copy.
:: *
:: *  @par use
:: *
:: * command line> <code>SyMenu2dir.bat  [path-SyMenuItem.zip] [BASEPATH=a-path] [ONLYTREE=YES^|NO] [DUMMY=YES^|NO] [POSID=YES^|NO] </code>
:: * 
:: * @par CLI parameters:
:: *    - <tt>path-symenuitem.zip</tt>: absolute or relative path to the directory where configuration file is located. Use it to change at runtime the standard DEFAULTCONFIG, defined in this file.@n
:: *    - <tt>BASEPATH</tt>: The new folders are: %BASEPATH%\SyRoot\xxxxzz, so:
:: *        - Using '.' (dot) the BAT will build directories relative to working dir, i.e. you MUST copy the BAT where you like to create the folders.
:: *        - Else you can specify a directory (example  BASEPATH="D:\\USER\\SyMenu\\my documents") and run the BAT from anywhere.@n
:: *    - <tt>ONLYTREE</tt>: walues: 'YES'|'NO'. Controls the 'deep' of dir tree. 
:: *        - YES: the BAT file will make folders only for the TREE branches. 
:: *        - NO: BAT creates folders also for any Items (programs, links etc.).@n
:: *    - <tt>DUMMY</tt>:  walues: 'YES'|'NO'.  
:: *        - If YES, the BAT creates a 'dummy' file in any new dir. So you can use cleaning tools that deletes empty dirs.@n
:: *    - <tt>POSID</tt>:  walues: 'YES'|'NO'.  
:: *        - If YES, any dir has a position index: '05_xxxx' to keep the menu order. WARNING: if a container changes position in the menu, this option creates a new dir. To make the dirs updateable, better to use 'NO'. 
:: *
:: * note: CLI parameters overwrite the default values defined in this file. Of course you can edit this defaults, to change it.
:: *
:: *   @par  'SyMenu to dir' and SyMenu
:: *        In <b>SyMenu</b> you can add the 'SyMenu to dir' entry  for <tt>SyMenu2dir.bat</tt> using drag&drop (using defaults). The path is: <tt>.\\ProgramFiles\\ms-symtools\\SyMenu2dir.bat</tt>. @n
:: *        Next you can edit the Item to add icon, any required/optional CLI parameter, etc.@n
:: *        It runs better with 'Window Style' = Minimized, as in this example: <pre>
:: *        &lt;SyProgramCmd  windowStyle="2">
:: *             &lt;name>SyMenu2dir Default menu&lt;/name>
:: *             &lt;guid>83ed792d-fd7b-4593-b2b4-f5d3aaaac16f&lt;/guid>
:: *             &lt;icon>.\\Icons\\imageres_5375.ico&lt;/icon>
:: *             &lt;description>
:: *                 Run SyMenu2dir.BAT in hidden mode. The BAT is in [SyMenu]\\ProgramFiles\\ms-symtools\\result.
:: *             &lt;/description>
:: *             &lt;path>.\\ProgramFiles\\ms-symtools\\SyMenu2dir.bat&lt;/path>
:: *             &lt;param> BASEPATH="D:\USER\documenti" ONLYTREE=NO  POSID=NO DUMMY=YES &lt;/param>
:: *        &lt;/SyProgramCmd> </pre>
:: *
:: * @par acknowledgments
:: *    @li <A href="https://www.7-zip.org/download.html" target="_blank">7z.exe</A>, in lib dir, is used to unzip the configuration file.
:: *    @li <A href="https://www.saxonica.com/download/dotnet.xml" target="_blank">SAXON_HE </A>,in lib dir, is the XMLT Transformer used.
:: *    @li <A href="https://www.doxygen.nl/index.html" target="_blank">Doxygen</a> + filter_dox have been used to build this help.
:: *
:: *    <i>I make this utility because I need it. This program is Open Source (<A href="https://github.com/msillano/ms_symtools" target="_blank">https://github.com/msillano/ms_symtools </A>) in the hope that it will be useful, without any warranty: it is very experimental. </i>
:: */

::/** @file
:: * @version 2.1  06/01/22 (beta) tested on Windows 11 Pro (21H2), SAXON_HE 15.05, and SyMenu  7.00.8038 [2022.01.03]
:: * @author Copyright 2022 Marco Sillano.
:: */
rem code doc
::/**
:: *  Pseudo-function with actual BAT script code.
:: *
:: *  This program is a filter that uses the XSLT Transformer (SAXON) with a XSL files 'ad hoc': "SyMenu2dir.xslt".
:: *  @par How it works
:: *     - START: checks the parameters and defaults. If any error, it is sent to log.
:: *     -# STEP: Unzip the <code>[SyMenu]/Config/SyMenuItem.zip</code> using 7.zip.
:: *       The result is in the temporary file <code> %TMP%/SyMenuItem.xml</code> @n
:: *     -# STEP: A XML transformer (SAXON) gets the <code>SyMenuItem.xml</code> file and, using the 'transformation'
:: *        <code>SyMenu2dir.xslt</code> produces in output the required BAT file: <code>makeMyMenuDir.YYYYMMDD-HHhMMmSSs.bat</code>.
:: *     -# STEP: DONE: A POPup ask the user if the BAT must be run. 
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
FOR /F "delims=" %%F IN ("result\makeMyMenuDir.%mytimestamp%.bat") DO SET "OUTFILE=%%~dpnxF"
::  cleanup...
del /Q "%TMP%\SyMenuItem.xml" > nul

::  tuneup: IN next line: ^> logs last run,  ^>^> historical log
ECHO ++++++ SyMenu2dir %mytimestamp%  > SyMenu2dir.log 
:: processing USER INPUT CLI:  SyMenu2dir.bat   [path-SyMenuItem.zip] [BASEPATH=a-path] [ONLYTREE=YES^|NO] [DUMMY=YES^|NO] [POSID=YES^|NO]
SET USERFILE=none
:looptest
IF "%~1"=="" GOTO doneCLI
ECHO "%~x1X"| FIND /I ".zipX"  >NUL
IF %ERRORLEVEL% equ  0 GOTO okfile
ECHO "%~1"| FIND /I "BASEPATH"
IF %ERRORLEVEL% equ  0 GOTO okbase
ECHO "%~1"| FIND /I "ONLYTREE"
IF %ERRORLEVEL% equ  0 GOTO testtree
ECHO "%~1"| FIND /I "DUMMY"
IF %ERRORLEVEL% equ  0 GOTO testdummy
ECHO "%~1"| FIND /I "POSID"
IF %ERRORLEVEL% equ  0 GOTO testidx

:badCLI
if "%1" equ "" GOTO doneCLI
  echo Usage: SyMenu2dir.bat [path-SyMenuItem.zip] [BASEPATH=a-path] [ONLYTREE=YES^|NO] [DUMMY=YES^|NO] [POSID=YES^|NO] >>SyMenu2dir.log
  echo Error: Unknown Option: %1 %2    >>SyMenu2dir.log
  goto :badexit
 
:testtree
 IF "%~2" equ "YES" goto oktree
 IF "%~2" equ "NO"  goto oktree
  GOTO badCLI
:testdummy
 IF "%~2" equ "YES" goto okdummy
 IF "%~2" equ "NO"  goto okdummy
 GOTO badCLI
:testidx
 IF "%~2" equ "YES" goto okidx
 IF "%~2" equ "NO"  goto okidx
 GOTO badCLI
:okfile
 SET USERFILE=%~f1
 SHIFT
GOTO :looptest
:okbase
SET BASEPATH=%~2
 SHIFT
 SHIFT
GOTO :looptest
:oktree
SET ONLYTREE=%~2
 SHIFT
 SHIFT
GOTO :looptest
:okdummy
SET DUMMY=%~2
 SHIFT
 SHIFT
GOTO :looptest
:okidx
SET POSID=%~2
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
ECHO SyMenu2dir ERROR: the default SyMenuItem.zip file [%CONFIGFILE%] not found.       >>SyMenu2dir.log
 ) ELSE (
ECHO SyMenu2dir ERROR - Check parameter: SyMenuItem.zip file [%CONFIGFILE%] not found. >>SyMenu2dir.log
)
goto :badexit
:continue
:: :: ================= STEP 1: UNZIP (using 7.zip)
:: ref: https://www.dotnetperls.com/7-zip-examples;  7z.exe path is: [SyMenu]/Lib/7z.exe. 
"%EXE7ZFILE%" x "%CONFIGFILE%" -aoa -o%TMP% 1>NUL 2>> SyMenu2dir.log

if NOT EXIST "%TMP%\SyMenuItem.xml"  goto badexit
ECHO STEP 1 OK: output "%TMP%\SyMenuItem.xml"  >> SyMenu2dir.log
:: :: ================= STEP 2: Transformation  XML => BAT (using SAXON)
:: see:  https://www.saxonica.com/documentation10/index.html#!using-xsl/commandline  
   %SAXON% -s:"%TMP%\SyMenuItem.xml" -xsl:"%BATPATH%\xslt\SyMenu2dir.xslt" -o:"%OUTFILE%" BASEPATH="%BASEPATH%" ONLYTREE=%ONLYTREE% DUMMY=%DUMMY% POSID=%POSID% timestamp=%mytimestamp% 2>> SyMenu2dir.log

if NOT EXIST "%OUTFILE%"  goto badexit
:: checks also the file size
FOR /F "delims=" %%F IN ("%OUTFILE%") DO SET "OUTSIZE=%%~zF"
ECHO STEP 2 CHK: output file size: %OUTSIZE% >> SyMenu2dir.log
IF %OUTSIZE% LSS 10  goto badexit
ECHO =========== DONE OK: output "%OUTFILE%"  >> SyMenu2dir.log
:: :: ================ STEP 3: do AUTORUN 
:: :: +++++ Internationalization: edit next line to change the message texts +++++
rem see https://w3schools.sinsixx.com/vbscript/func_msgbox.asp.htm
echo wscript.echo msgbox("Run the dir maker file  %OUTFILE%." ^& vbcrlf ^& "     Are you sure?",4,"Confirm Makedir action") > "%TMP%\input.vbs"
for /f "tokens=* delims=" %%a in ('cscript //nologo "%TMP%\input.vbs"') do set YesNo=%%a
if "%YesNo%" equ "6"  goto runbat
  ECHO ++++++ SyMenu2Dir ABORT: User does not confirm the auto run. >> SyMenu2dir.log  
  goto exitOK 
:: :: ================ STEP 4: optional Run and show result  file (using notepad) or log, restore 'current dir'
:runbat
CALL  %OUTFILE%
:exitOK
popd
START notepad.exe "%OUTFILE%"
goto :EOF
:badexit
ECHO ++++++ unexpected SYSTEM ERROR: run aborted. >> SyMenu2dir.log
popd
START notepad.exe "%BATPATH%\SyMenu2dir.log"
goto :EOF
