The **ms_symtool** project was born to provide **SyMenu** with a series of advanced features, to facilitate the maintenance of complex menus. Of course portables.

>  *[**SyMenu**](https://www.ugmfree.it "SyMenu Home") is an advanced portable alternative to* Windows 'Start Menu'. *Extremely flexible and easily    customizable, it allows you to create multiple dedicated menus (e.g. MMedia, CAD, etc.) with all programs, documents, and workspaces relating to a single  area, well organized and specialized according to the interests and needs of the user.*

*Of course, the **ms_symtool** tools have been created based on my needs and are often not quite 'user-friendly', but I think they can also be useful for other experienced users with similar problems. For this, they are Open Source and the latest version is available on [GitHub](https://github.com/msillano/ms_symtools "Public repository").*

-------------------------------
[**PrettyPrint Items**](https://github.com/msillano/ms_symtools/tree/main/PrettyPrintItems  "Download from GitHub") is a tool that extracts a snapshot from the file <code>SyMenuItem.zip</code>, with all the data of the nodes currently present in the **SyMenu** menu and presents them, in the form of a complete tree, in a dynamic HTML page. This allows you to easily handle menus of any size and complexity. Example:

![a SyMenu tree fragment](./img/symenyppout.png?raw=true)

 note: the <tt>tagfilter</tt> [extension used](https://github.github.com/gfm/#disallowed-raw-html-extension-) by GitHub doesn't allow the inclusion of required tags to have a dynamic page. For a live example see [here](http://o2xdl.org/storage/outputpage.html) and click on the red plus (+) to open the tree.
 
The **PrettyPrintItems** output document is useful documentation per itself,  but you can also cut a branch and insert it in any of your pages: HTML, markdown (not GitHub flavor), Doxygen, etc.. keeping colors and dynamicity. 

--------------------------------------
**Installation** (same for all ms-symtools)

 - Unzip the distribution file in dir <code>[SyMenu]\Programfile</code>, so you get: <code>[SyMenu]\Programfile\sm-symtools\xxx.xxx</code>
 - Look at the help file <code>tool-name.chm</code> for specific preconditions,  instructions, etc..  
 Start from the main file: <a class="el" href="pretty_print_items_8bat.html#details" target="_self">prettyPrintItems.bat</a>


