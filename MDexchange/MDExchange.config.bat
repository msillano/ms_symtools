:: ********************** DEFAULTS AND OPTIONS ***************** 
:: Here are defined the defaults for MDexchange tools: some can be changed by a CL parameter at runtime:
:: Command line> <TT>SyMenu2MDexport.bat  [path-SyMenuItem.zip] [path-ItemNew.md]   [HASHTAG=NONE|AUTO|USER] [MODE=FLAT|TREE|FULL] </TT> 
:: Command line> <TT>MD2SyMenuImport.bat  [path-SyMenuItem.zip] [path-ItemNew.html] [HASHTAG=NONE|AUTO|USER] [REPLACE=YES|NO] </TT>
:: Command line> <TT>menuUndo.bat         [path-SyMenuItem.zip] </TT>
:: --------------------------------- USER CAN CHANGE THIS DEFAULTS 
rem file doc (for doxygen)
::/**  
:: *  @file 
:: *  <b>MDExchange configuration</b> defines some default settings used by all MDExchange tools.
:: *   Then the user can update this file and all tools share the new values.
:: *  @par defaults
:: *   Following defaults values can be overridden by the CLI parameters at runtime:
:: *
:: *   - <tt>DEFAULTCONFIG</tt> the path to the default  <tt>SyMenuItem.zip</tt>: Absolute or relative to this dir. Used by all tools.
:: *   - <tt>HASHTAG</tt> global hashtag policy, one of NONE|AUTO|USER. Used by SyMenu2MDexport.bat and MD2SyMenuImport.bat. 
:: *   - <tt>NEWPATH</tt> the default path of the Exported MD file: Absolute or relative to this dir. Used by SyMenu2MDexport.bat.
:: *   - <tt>MODE</tt> controls the structure of the Exported MD file. One of FLAT|TREE|FULL. Used only by SyMenu2MDexport.bat.
:: *   - <tt>INPATH</tt> the default path of the imported (X)HTML file: Absolute or relative to this dir. Used by MD2SyMenuImport.bat. 
:: *   - <tt>REPLACE</tt> controls the replacement of the  <tt>SyMenuItem.zip</tt> file. One of YES|NO. Used by MD2SyMenuImport.bat.
:: *
:: * <i>Next options cannot be changed at runtime (not in the CLI):

:: *   - <tt>MDEDITOR</tt> <b>MarkdownPad2</b> is required. Here you MUST set the path:
:: *              -  <tt>relative</tt>: If both MDExchange and MarkdownPad2 are in SyMenu, the path can be relative (portable).
:: *              -  "": Uses the Windows host binding to '.md': MUST exist and MUST be MarkdownPad2.exe
:: *              -  <tt>absolute</tt>: Otherwise the path can be absolute (not portable).
:: *   - <tt>XMLEDITOR</tt> A <b>text editor for XML</b> is required: e.g. Notepad++ (or your favorite XML editor):
:: *              -  <tt>relative</tt>: If both MDExchange and Notepad++ are in SyMenu, the path can be relative (portable).
:: *              -  "": Uses the Windows host binding to '.xml'.
:: *              -  <tt>absolute</tt>: Otherwise the path can be absolute (not portable).
:: *   - <tt>VERBOSE</tt> adds comments on statistics and processing. One of YES|NO. Used by SyMenu2MDexport.bat and MD2SyMenuImport.bat.
:: *          You can see these comments in MarkdownPad2 (export) or in the XML output file or using PrettyPrintSymenu (import).@n
:: *          Warning: Any change via SyMenu 'configuration' destroys the comments because it updates the SyMenuItem.zip.       
:: */
::/** @file
:: * @version 2.1 19/12/21 (beta)
:: * @author Copyright 2021 Marco Sillano.
:: */

rem code doc
::/**
:: *  Actual definitions, for standard SyMenu installation:
:: */
:: :: **********************  START DEFAULTS (CLI)

rem DEFAULTCONFIG: global, the SyMenu configuration zip file (path-SyMenuItem.zip), absolute or relative to this dir. 
rem  CLI param: [path-SyMenuItem.zip].
SET DEFAULTCONFIG="..\..\Config\SyMenuItem.zip"

rem NEWPATH: for SyMenu2MDexport, the Markdown output file (path-newMenu.md):  A fixed known name is more simple to handle by the user and by the two steps.
rem  CLI param: [path-ItemNew.md].
SET NEWPATH="result\SyMenuItemNew.md"

rem INPATH: for MD2SyMenuImport, path to new HTML file imported (path-newMenu.html): better to use here same path and filename as NEWPATH.
rem CLI param: [path-ItemNew.html]
SET INPATH="result\SyMenuItemNew.html"
rem to test some imports:
:: SET INPATH="share\MD-for-SyMenu.html"
:: SET INPATH="share\Windows_and_Me.1.0_en.SyMenu.html"

rem MODE: for SyMenu2MDexport, the resulting Markdown structure. One of FLAT|TREE|FULL  
rem  CLI param: [MODE=FLAT|TREE|FULL]
SET MODE=FULL

rem HASHTAG: global policy about hashtags, one of NONE|AUTO|USER.
rem CLI param:  [HASHTAG=NONE|AUTO|USER].
SET HASHTAG=AUTO

rem REPLACE:for MD2SyMenuImport, one of YES|NO. 
rem  - "YES": MD2SyMenuImport replaces the SyMenuItem.zip file used by SyMenu (you need do a SyMenu 'refresh'). note: a backup is always done, so symenuUndo.bat can restore previous state.
rem  -  "NO": save result as  SyMenuItem.new.zip
rem CLI param: [REPLACE=YES|NO]
SET REPLACE=YES

:: :: **********************  MORE DEFAULTS AND OPTIONS 
:: This values can't be changed at runtime

rem MDEDITOR the path to MarkdownPad2.exe  *** Important! Mandatory *** Examples:
SET MDEDITOR=".\..\SPSSuite\SyMenuSuite\MarkdownPad_2_sps\MarkdownPad2.exe"
rem SET MDEDITOR=""
rem SET MDEDITOR="C:\Program Files (x86)\MarkdownPad 2\MarkdownPad2.exe"

rem XMLEDITOR the path to an XML editor (e.g. Notepad++, or your editor) Examples:
SET XMLEDITOR=".\..\SPSSuite\SyMenuSuite\Notepad++_(x64)_sps\notepad++.exe"
rem SET XMLEDITOR=""
rem SET XMLEDITOR="C:\Program Files\Notepad++\notepad++.exe"

rem VERBOSE: one of YES|NO. 
rem "YES" MDExchange adds statistics and info about the items process, as comment. 
rem You can see this comments in MarkdownPad2 (export) or in the XML output file or using PrettyPrintSymenu (import). 
SET VERBOSE=YES

:: :: **********************  ENVIRONMENT TEMPORARY 
:: You can remove "rem" from following two lines, if you'd like to use a specific java jre or jdk (example):
rem set JAVA_HOME=C:/j2sdk1.4.2_10
rem set PATH=%JAVA_HOME%/bin
:: You can remove "rem" from following line, to change the default 'TMP' path used (example):
rem set TMP=%USERPROFILE%\Desktop
:: :: **********************  END DEFAULTS 
