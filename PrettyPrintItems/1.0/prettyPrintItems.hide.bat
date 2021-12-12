rem @ECHO off
rem file doc (for doxygen)
::/**  
:: *  @file 
:: *  Wrapper to run hidden the prettyPrintItems.bat program.
:: *  Thist file can be run alone (click on it using e.g. file explorer) or can be used in SyMenu (ver. 6.16).
:: * @par add to SyMenu
:: *  To update SyMenu, just drag and drop it to the floating icon of SyMenu.
:: * @version 1.0 29/11/21 tested on Windows 11 Pro (21H2), java  17.0.1 and SyMenu  6.16.7962 [2021.10.19]
:: * @author Copyright &copy;2021 Marco Sillano.
:: */
rem code doc
::/**
:: *  Pseudo-function with actual BAT script code.
:: *
:: *  This implementation is portable and works inside SyMenu.
:: *  @par Preconditions
:: *  MUST stay in same dir as "prettyPrintItems.bat", i.e in xxx\SyMenu\ProgramFiles\ms-symtools\"
:: *  MUST exist "xxx\SyMenu\ProgramFiles\SPSSuite\NirSoftSuite\NirCmd_x64_sps\nircmd.exe" 
:: *  @note
:: *     <center><tt>nircmd exec hide &lt;my_file></tt></center>@n
:: *  is a general purpose solution. Here is added some stuff to make it portable in SyMenu.
:: */
rem  can start using any 'current dir' or disk:
for %%i in ("%~dp0.") do SET "startpath=%%~fi"
pushd .
  cd /D "%startpath%"
  "..\SPSSuite\NirSoftSuite\NirCmd_x64_sps\nircmd.exe" exec hide prettyPrintItems.bat
popd
