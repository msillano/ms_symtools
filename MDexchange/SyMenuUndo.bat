@ECHO off
:: ********************** DEFAULTS IN CONFIG file ***************** 
:: fine tuneup for expert: change line 52 to have historical log.
CALL MDexchange.config.bat
rem file doc (for doxygen)
::/**  
:: *  @file 
:: *  <b>SyMenu Undo</b> is a simple tool to restore the SyMenuItem.zip from the newest backup.
:: *  Every run of menuUndo consumes a backup, so you can go back how many steps you like. @n
:: *  This tool is included in MDExchange as a rescue in case of problems: MDExchange makes a backup before any modification to SyMenuItem.zip @n
:: *  If you have the option 'Backup configuration files' checked, see <tt>SyMenu|Options|General</tt>), this tool can be used alone, e.g. in case of errors in updating a menu, or in case of altered configurations that do not allow SyMenu to start.@n
:: *
:: *  @par Parameters
:: *  This tool uses, as all MDExchange tools, the <tt>MDExchange.config.bat</tt> file for default definitions, and accepts only one parameter (optional).@n
:: *  Command line: <code>menuUndo.bat  [path-SyMenuItem.zip]</code>
:: *   - <tt>path-SyMenuItem.zip</tt> identifies the SyMenuItem.zip file used. Required only if you use more than one SyMenu. Absolute or relative path.
:: *
:: * @par Use
:: *  - Before performing the replacement, this tool presents a popup with the most recent backup file: from the timestamp the user can confirm or deny the undo action.
:: *  - It is best to use this tool with SyMenu off, and restart SyMenu after the restoration. 
:: *  - As alternative, you can use the 'Reload' option in the context menu. If you don't have 'Reload' in the contextual commands you can add it from <tt>SyMenu|Options|Structure</tt>.
:: *
:: * - Like other MDExchange tools, the log file is shown in case of an error, as an help in troubleshooting.
:: */
::/** @file
:: * @version 2.1  05/01/2022 (beta) tested on Windows 11 Pro (21H2) and SyMenu  7.00.8038  [2022.01.03]
:: * @author Copyright  2022 Marco Sillano.
:: */
rem code doc
::/**
:: *  Pseudo-function with actual BAT script code.
:: *
:: *  This program performs the following steps:
:: *     -# STEP: checks the CL and setup some vars (BATPATH and CONFIGFILE). 
:: *       If the <code>SyMenuItem.zip</code> isn't in its default directory, the user MUST change the defaults or add its actual path as parameter.
:: *     -# STEP:  most recent backup file found.
:: *     -# STEP: A pop up asks the user for confirmation. If 'yes' the <tt>SyMenuItem.zip</tt> is restored.
:: * @par note
:: *   A log file (<tt>"[SyMenu]\ProgramFiles\ms-symtools\MDExchange.log"</tt>) is updated each step. In case of an error, this log is shown to the user.@n
:: *   Internationalization: if you like, you can change the popup messages (now in English) editing one line (89) of this file.
:: */

pushd .
:: PRE: on start: any working-dir 
:: ::  ================= STEP 0:  params and CHECKs
for %%i in ("%~dp0.") do SET "BATPATH=%%~fi"
CD /D %BATPATH%
:: timestamp (same format as SyMenu). ref: https://www.it-swarm.it/it/windows/creazione-di-un-nome-file-come-timestamp-un-processo-batch/967227137/
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
set mytimestamp=%ldt:~0,4%%ldt:~4,2%%ldt:~6,2%-%ldt:~8,2%h%ldt:~10,2%m%ldt:~12,2%s
::  IN next line: single ^> logs last run, double  ^>^> historical log
ECHO ++++++ MenuUndo %mytimestamp% > MDexchange.log
SET USRCONFIG=none
:looptest
IF "%~1"=="" GOTO doneCLI
ECHO "%~x1X"| FIND /I ".zipX"
IF %ERRORLEVEL% equ  0 GOTO setconf
  echo Usage: MenuUndo.bat  [path-SyMenuItem.zip]  >> MDexchange.log
  echo Error: Unknown Option: %1 %2  >> MDexchange.log
  goto :badoutput
:setconf
 SET USRCONFIG=%~f1
 SHIFT
GOTO :looptest
:doneCLI
:: :: ================= STEP 1: test existence of SyMenuItem.zip 
FOR /F "delims=" %%F IN ("%DEFAULTCONFIG%") DO SET "CONFIGFILE=%%~dpnxF"
if "%USRCONFIG%" NEQ "none" (FOR /F "delims=" %%F IN ("%USRCONFIG%") DO SET "CONFIGFILE=%%~dpnxF")
if EXIST "%CONFIGFILE%"  goto continue

:: ERROR: the SyMenuItem.zip file  not found.
IF "%USRCONFIG%" equ "none" (
ECHO STEP 1 ERROR - The default SyMenuItem.zip file [%CONFIGFILE%] not found. >> MDexchange.log
 ) ELSE (
ECHO STEP 1 ERROR - Check parameter: SyMenuItem.zip file [%CONFIGFILE%] not found. >> MDexchange.log
)
goto :badoutput
:continue
ECHO STEP 1 OK, found the configuration file: %CONFIGFILE%  >> MDexchange.log
:: :: ================= STEP 2: found newest backup 
FOR %%i IN ("%CONFIGFILE%") DO ( SET CONFDIR=%%~dpi) 
for /f "delims=" %%x in ('dir "%CONFDIR%SyMenuItem.bak.*.zip" /B /O:D') do set "NEWEST_BAK=%%x"

IF NOT EXIST "%CONFDIR%%NEWEST_BAK%" (ECHO STEP 2 BAD: no backup file was found >> MDexchange.log & goto badoutput)
ECHO STEP 2 OK, last backup: "%CONFDIR%%NEWEST_BAK%"  >> MDexchange.log
:: :: ================= STEP 3: confirm popup:  undo or abort
del "%TMP%\input.vbs"  2>> MDexchange.log & set YesNo=
:: :: +++++ Internationalization: edit next line to change the message texts +++++
echo wscript.echo msgbox("Restore SyMenuItem.zip using %NEWEST_BAK%." ^& vbcrlf ^& "     Are you sure?",4,"Confirm Undo Menu") > "%TMP%\input.vbs"
for /f "tokens=* delims=" %%a in ('cscript //nologo "%TMP%\input.vbs"') do set YesNo=%%a

if "%YesNo%" neq "6" ( ECHO ++++++ MenuUndo ABORT: User does not confirm the Undo. >> MDexchange.log & goto abort )
del /Q "%CONFIGFILE%"    2>> MDexchange.log
ren "%CONFDIR%%NEWEST_BAK%"  SyMenuItem.zip  2>> MDexchange.log

IF EXIST "%CONFDIR%%NEWEST_BAK%"  goto badoutput
:: checks also the file size
FOR /F "delims=" %%F IN ("%CONFIGFILE%") DO SET "OUTSIZE=%%~zF"
ECHO STEP 3 CHK: restored file size: %OUTSIZE% >> MDexchange.log
IF %OUTSIZE% LSS 40  goto badoutput
:: :: =================== quit 
popd
ECHO ++++++ MenuUndo DONE. Restart SyMenu or use 'Reload'. >> MDexchange.log
goto :EOF
:: ============== bad EXIT
:badoutput
ECHO ++++++ unexpected SYSTEM ERROR: run aborted. >> MDexchange.log
:abort
popd
start "notepad.exe" "%BATPATH%\MDexchange.log"
goto :EOF

