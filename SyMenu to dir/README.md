**My SyMenu tools**  project (*ms_symtool*) was born with to provide **SyMenu** with a series of advanced features, to facilitate the maintenance of complex menus. Of course portables.

>  *[**SyMenu**](https://www.ugmfree.it "SyMenu Home") is an advanced portable alternative to* Windows 'Start Menu'. *Extremely flexible and easy    customizable, it allows you to create multiple dedicated menus (e.g. MMedia, CAD, etc.) with all programs, documents and workspaces relating to a single  area, well organized and specialized according to the interests and needs of the user.*

*Of course, the **ms_symtool** tools have been created based on my needs and are often not quite 'user-friendly', but I think they can also be useful for other experienced users with similar problems. For this, they are Open Source and the latest version is available on [GitHub](https://github.com/msillano/ms_symtools "Public repository").*

-------------------------------
[**SyMenu to dir**](https://github.com/msillano/ms_symtools/blob/main/SyMenu.toDir.2.1.zip?raw=true  "Download from GitHub") (SyMenu2dir.bat) is a simple utility that creates a BAT file to get a folder structure isomorphic to the SyMenu's tree. I use this tool to create a tree to store the local documentation.

This program reads SyMenuItem.zip configuration file and creates a BAT file for the entire menu: only with the tree, or, optionally, with all items. The fact that it creates a BAT file, instead of creating dirs directly, makes it easy to delete some branches to suit your needs.

![BAT output file](https://github.com/msillano/ms_symtools/blob/main/img/fig103.jpg?raw=true)

 
###use
 
Running the output BAT file will make all required folders.

*Of course you can delete some lines in BAT file, if you don't need that dirs. As help, comments marks START and END of any branch.<br /> 
Or you can mix: some branches with more detailed directories and some without items: runs two times the tool, one time with ONLYTREE=NO and one time with ONLYTREE=YES then cut and mix the BAT files.* 

Look at the help file <code>SyMenu2dir.chm</code> for specific preconditions,  istructions, etc..  
 
###Download

You can download the zip file with the last version in the [ms_symtools main page](https://github.com/msillano/ms_symtools)

**Versions:**

2.1 beta

  Initial version.


