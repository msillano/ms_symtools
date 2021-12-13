[**prettyPrint SyMenu**](https://github.com/msillano/ms_symtools/tree/main/PrettyPrintItems  "Download from GitHub") (<tt>prettyPrintItems.bat</tt>) is a tool that extracts a snapshot from the file <code>SyMenuItem.zip</code>, with all the data of the nodes currently present in the **SyMenu** menu and presents them, in the form of a complete tree, in a dynamic HTML page. This allows you to easily handle menus of any size and complexity. Example:

![a SyMenu tree fragment](./../img/symenyppout.png?raw=true)

 note: the <tt>tagfilter</tt> [extension used](https://github.github.com/gfm/#disallowed-raw-html-extension-) by GitHub doesn't allow the inclusion of required tags to have a dynamic page. For a live example see [here](http://o2xdl.org/storage/outputpage.html) and click on the red plus (+) to open the tree. 
 
The **prettyPrint SyMenu** output document is useful documentation per itself,  but you can also cut a branch and insert it in any of your pages: HTML, markdown (not GitHub flavor), Doxygen, etc.. keeping colors and dynamicity. 

For more info you can download the **prettyPrimt SyMenu** help (file *prettyPrintItems.chm*).


**Versions:**

2.1 beta
 - renamed prettyPrintItems.hide.vbs to more general: runtools.hide.vbs
 - updated help

2.0 beta
 - removed dependencies by including all required files
 - compatibility with all customized Sy_Menu installations (using -fc or -fp)
 - branch extraction guides added to HTML
 - open CSS and js files policy: standalone, local, remote.

1.0  alfa
 - initial version
