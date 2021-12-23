**My SyMenu tools**  project (*ms_symtool*) was born with to provide **SyMenu** with a series of advanced features, to facilitate the maintenance of complex menus. Of course portables.

>  *[**SyMenu**](https://www.ugmfree.it "SyMenu Home") is an advanced portable alternative to* Windows 'Start Menu'. *Extremely flexible and easy    customizable, it allows you to create multiple dedicated menus (e.g. MMedia, CAD, etc.) with all programs, documents and workspaces relating to a single  area, well organized and specialized according to the interests and needs of the user.*

*Of course, the **ms_symtool** tools have been created based on my needs and are often not quite 'user-friendly', but I think they can also be useful for other experienced users with similar problems. For this, they are Open Source and the latest version is available on [GitHub](https://github.com/msillano/ms_symtools "Public repository").*

-------------------------------
[**SyMenu MD Exchange**](https://github.com/msillano/ms_symtools/tree/main/PrettyPrintItems  "Download from GitHub") is a tool that export and import the SyMenu structure to/from *markdown* files. This allows for easily management of large menus. By editing an *MD* file you can update and reorganize the menu tree, change names and edit tooltips for all items. 

A simple example, using the branch ['This PC[DESKTOP-LFGU1S1]'](https://www.ugmfree.it/Forum/messages.aspx?TopicID=830) can help: 

![Menu branch](https://github.com/msillano/ms_symtools/blob/main/img/fig101.jpg?raw=true)
   
This structure was created using the SyMenu features: it offers a tree for the menu management and 'ad hoc' forms for item configurations. More fast, a file can be drag&drop to SyMenu Icon and a new item is added to menu. You can also do a 'Batch Import' that scans a folder and adds all executables files.

![SyMenu form](https://github.com/msillano/ms_symtools/blob/main/img/fig010.jpg?raw=true)

This all works very well, but I fond an alternative way to handle the menu structure and Items descriptions that can help the user in some cases.

### Export to MD ##
The `SyMenu2MDexport` tool transforms the SyMenu info in a *Markdown file*, easy handled by MarkdownPad2.

![Markdown edit](https://github.com/msillano/ms_symtools/blob/main/img/fig011.jpg?raw=true)

The MD format as been chose to get 2 goals:

- Easy to edit by the user
- Innediate HTML feedback, more customizable using CSS.

### Edit MD
Now the user can reorganize the menu tree, with a cut&paste in MD. It can add Container, Separator and Labels and update the Items description.

If descriptions are used as tooltip content, as I do with my menus, it is useful to keep then not too big. Because the description is seachable by SyMenu, you must chose carefully the included keywords.

The details of MD editing rules are in the file `MD-for-SyMenu.md.` 

### Import MD to SyMenu
Done the edit phase, the user must save the updated file. In MarkdownPad2: *file|Export|Export HTML*.

The `MD2SyMenuImport` tool keeps the file HTML exported by *MarkdownPad2* and merge it into the existing `SyMenuItem.zip` file, updating in one step all changed menu items.

One feature is that you can update the full menu or only a branch. Delete all lines before and after the interesting zone, to get as root node the required branch: the 'import' will replace the old menu branch with the new version. 

*Maybe the best use of this tool is the creation of big classification tree, in the case of reorganizations of your SyMenu. In case of large menus it is mandatory to have a robust tree hierarchy, updatable by steps, also before to reach the 3'000+ programs of [Drakkn](https://www.ugmfree.it/Forum/messages.aspx?TopicID=817)* :).

Done.

notes:

 - The use of MarkdownPad2 is mandatory: I tested many MD editors, and the transformation MD->HTML is handled in different ways by different programs. As extra, MarkdownPad2 offers an easy management of CSS, also on free version, useful to change the look of the HTML output.
 - The default installation uses the locale windows char set. To have an 'international' version, that handle all Unicode chars in the same document, you must upgrade to SAXON XSLT engine.




--------------------------------------
**Installation** (same for all ms-symtools)

 - Unzip the distribution file in dir <code>[SyMenu]/Programfile</code>, so you get: <code>[SyMenu]/Programfile/sm-symtools/xxx.xxx</code>
 - Look at the help file <code>tool-name.chm</code> for specific preconditions,  istructions, etc..  
 Start from the main file: <a class="el" href="pretty_print_items_8bat.html#details" target="_self">prettyPrintItems.bat</a>


