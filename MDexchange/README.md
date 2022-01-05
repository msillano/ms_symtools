**My SyMenu tools**  project (*ms_symtool*) was born with to provide **SyMenu** with a series of advanced features, to facilitate the maintenance of complex menus. Of course portables.

>  *[**SyMenu**](https://www.ugmfree.it "SyMenu Home") is an advanced portable alternative to* Windows 'Start Menu'. *Extremely flexible and easy    customizable, it allows you to create multiple dedicated menus (e.g. MMedia, CAD, etc.) with all programs, documents and workspaces relating to a single  area, well organized and specialized according to the interests and needs of the user.*

*Of course, the **ms_symtool** tools have been created based on my needs and are often not quite 'user-friendly', but I think they can also be useful for other experienced users with similar problems. For this, they are Open Source and the latest version is available on [GitHub](https://github.com/msillano/ms_symtools "Public repository").*

-------------------------------
[**SyMenu MD Exchange**](https://github.com/msillano/ms_symtools/tree/main/MDexchange  "Download from GitHub") is a tool that export and import the SyMenu structure to/from *markdown* files. This allows for easily management of large menus. By editing an *MD* file you can update and reorganize the menu tree, change names and edit tooltips for all items. 

The origin of this solution bemes from away. I like *SyMenu* for the *tooltips*: between the *'Start Menu'* replacements this is an unique feature. Why I like tooltips? Because I use many programs, but not in regular basis, so the tooltips are an useful help to remeber info about programs and features, documentations and workflows.

How to edit SyMenu Configuration? SyMenu offers a tree for managing the menu structure and 'ad hoc' forms for configuring items. Faster, a file can be drag&drop onto the SyMenu Icon and a new item is added to menu. You can also do a 'Batch Import' whitch scans a folder and adds all executables files. Enough? Yes... and not. I have also the esigence of a way more global, not so detailed as the forms, but not so simple as the SyMenu Tree. 

L'option to edit directly the SyMenuItem in XML, with a specializzated editor is too verbose and full of details: not viable. The XML is useful for documentation: see prettyPrintMenu.

The baisic idea is to use the Markdown, very less verbose than XML, to define only some important (for me) aspects of SyMenu: the buildig of large tree, the tuning of tootips, in general the visible parts of a menu, in a fast and economical way.

In any case this is a new option for power users: now you can also use this way to edit and tuning the SyMenu structures, one more alternative. Use it if and when you find it useful and advantageous.

A simple example, using the branch ['This PC[DESKTOP-LFGU1S1]'](https://www.ugmfree.it/Forum/messages.aspx?TopicID=830) can help: 

![Menu branch](https://github.com/msillano/ms_symtools/blob/main/img/fig101.jpg?raw=true)
   
This structure was created using the SyMenu features.

![SyMenu form](https://github.com/msillano/ms_symtools/blob/main/img/fig010.jpg?raw=true)

The alternative I propose is based on 3 steps:

### Export to MD ##
The `SyMenu2MDexport` tool transforms the SyMenu info in a *Markdown file*, easy manageable by MarkdownPad2.

![Markdown edit](https://github.com/msillano/ms_symtools/blob/main/img/fig011.jpg?raw=true)

The MD format was chosen to achieve 2 goals:

- Easy to modify by the user
- Produce a HTML good visual feedback, further customizable using CSS.

### Edit MD
Now the user can reorganize the menu tree, with a cut&paste in MD. Can add Containers, Separators and Labels and update the Items name or description.

If descriptions are used as tooltip content, as I do with my menus, it helps to keep then not too big. Since the description is seachable from SyMenu, you need to choose the included keywords carefully.

The details of MD editing rules are in the file `MD-for-SyMenu.md.` 

### Import MD to SyMenu
Once the edit phase is complete, the user must save the updated file. In MarkdownPad2: *file|Export|Export HTML*.

The `MD2SyMenuImport` tool keeps the file HTML exported by *MarkdownPad2* and merge it into the existing `SyMenuItem.zip` file, updating all changed menu items  in one step.

One feature is that you can update the full menu or just a branch. Delete all lines before and after the area of interest, to obtain the required branch as root node: the 'import' will replace the old menu branch with the new version. 

*Perhaps the best use of this tool is the creation of big classification tree, in the case of reorganizations of your SyMenu. In case of large menus it is mandatory to have a robust tree hierarchy, which can be updated gradually, even before reaching Drakkn's [more than 3'000+ programs](https://www.ugmfree.it/Forum/messages.aspx?TopicID=817)* :).

Done.

notes:

 - The use of MarkdownPad2 is mandatory: I have tested many MD editors, and the transformation MD->HTML is handled in different ways by different programs. As an extra, MarkdownPad2 offers an easy CSS management, even in the free version, which is useful for changing the look of the HTML output.


--------------------------------------
**Installation** (same for all ms-symtools)

 - Unzip the distribution file in dir <code>[SyMenu]/Programfile</code>, so you get: <code>[SyMenu]/Programfile/sm-symtools/xxx.xxx</code>
 - Look at the help file <code>tool-name.chm</code> for specific preconditions,  istructions, etc..  
 Start from the main file: <a class="el" href="pretty_print_items_8bat.html#details" target="_self">prettyPrintItems.bat</a>

