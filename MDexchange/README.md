[**SyMenu MD Exchange**](https://github.com/msillano/ms_symtools/tree/main/MDexchange  "Download from GitHub")  allows you to document and 'share' partial or full SyMenu trees with other users. 
The Markdown format enables for easily management of large menus: by editing comfortably an MD file, in a featured editor, you can update and reorganize the menu tree, change names and edit tooltips for all items.

The origin of this solution bemes from afar. I like *SyMenu* for the *tooltips*: between the *'Start Menu'* replacements this is a unique feature. Why do I like tooltips? Because I use many programs, but not in a regular basis, the tooltips are an useful aid in remebering information about programs and features, documentation, workflows.

How to edit the SyMenu Configuration? SyMenu offers a tree for managing the menu structure and 'ad hoc' forms for configuring items. Faster, a file can be 'drag&drop' onto the SyMenu Icon and a new item is added to menu. You can also do a 'Batch Import' which scans a folder and adds all executables files. Quite? Yes... and not. I also need a more global way, not so detailed and punctual as the forms, but not so simple and skeletal as the SyMenu Tree view. 

The option to directly edit the SyMenuItem in XML, perhaps with a specializzated editor, is too verbose and full of details: not praticable in my option. XML is useful for documentation pourposes: see prettyPrintMenu.

Using Markdown, you can import, export and edit menus for SyMenu: this is a new option for advanced users, you can use it use it if and when you find useful and beneficial.

The branch ['This PC[DESKTOP-LFGU1S1]'](https://www.ugmfree.it/Forum/messages.aspx?TopicID=830) look so in SyMenu:

![Menu branch](https://github.com/msillano/ms_symtools/blob/main/img/fig101.jpg?raw=true)
   
This structure was created using the SyMenu forms:

![SyMenu form](https://github.com/msillano/ms_symtools/blob/main/img/fig010.jpg?raw=true)

The **MDexport offerts** menu processing in three steps:

### Export SyMenu to MD ###
The `SyMenu2MDexport` tool transforms the SyMenu configuration structure in a *Markdown file*, easy manageable by MarkdownPad2 and other editors.

![Markdown edit](https://github.com/msillano/ms_symtools/blob/main/img/fig011.jpg?raw=true)

The MD format was chosen to achieve the goals:

- Easy to modify by the user
- It produces a good HTML visual feedback, further customizable using CSS.
- It allows 2 kinds of comments: visible  and rich in HTML, and invisible: only in MD.

### Edit MD
Now the user can rearrange the menu tree, with a cut&paste in MD. It can add Containers, Separators and Labels and update the name or description of the Items.

If descriptions are used as tooltip content, as I do with my menus, it helps to keep then not too big. Since the description is seachable from SyMenu, you need to choose the included keywords carefully, comparing between similar applications.

Editing, you can also add your comments, without interference with the SyMenu strucuture.

The details of MD editing rules are in the file `share\MD-for-SyMenu.pdf.` 

### Import MD to SyMenu
Once the edit phase is complete, the user must export the updated file. In MarkdownPad2: *file|Export|Export HTML*.

The `MD2SyMenuImport` tool keeps the HTML file saved by *MarkdownPad2* and smart merges it back into the existing `SyMenuItem.zip` file, updating all changed menu items, in one step.

One feature is that you can *update the full menu* or *just a branch*. Delete all lines before and after the area of interest, to get the required branch as the root node: the 'import' will replace the old menu branch with the new version. 

Or you can *export just items*, in a flat list. After modification, the 'import' replaces all updated items in the correct location in the tree.

You can also export *only the tree*, without Items. This mode allows the 'sharing' of SyMenu tree between users, because the tree is portable. Importing an 'empty' tree places all existing Items in one 'orphans' container: using 'drag&drop', on SyMenu Configuration tree, it is easy to re-populate the new tree. 

*Perhaps the best use of this tool is the creation of large classification tree, in the case of reorganizations of your SyMenu. (e.g. creation of a SyMenu specialozed in Multimedia). In case of large menus it is mandatory to have a robust tree hierarchy, which then can be updated gradually, even before reaching the [more than 3'000+](https://www.ugmfree.it/Forum/messages.aspx?TopicID=817) Drakkn Items :).*

Done.

**notes:**

- *Using **MDexchange** is safe, as it makes a backup before any changes to SyMenuItem.zip. The simple **SyMenuUndo.bat** tool can restore SyMenuItem.zip from the last backup.*
- *Using **MDexchange** is safe, because it never delete one Item: all Items from the original menu, but not present in the updated output are grouped in an ad hoc container named 'orphans'.*
- *Using **MarkdownPad2** is mandatory: I have tested many MD editors, and the MD->HTML  transformation is handled in different ways by different programs. As an extra, MarkdownPad2 offers visible feedback with easy CSS handling, even in the free version, useful for changing the look of HTML output. If you like, you can use a more featured editor to edit the MD file (e.g. MarkdownPad2 has no "find and replace" function) but it is mandatory to load  the edited file in MarkdownPad2 for export to (X)HTML.*

### Share menus

A menu Exported in 'TREE' mode does no contains any local references. Then you can 'share' the MD file because it is portable, and you can also insert 'howto' informations. 
- Any user can 'Import' it into their SyMenu, as template for a reorganization of the menu. All the items (SyProgramCmd, SyFolder, etc.) are grouped, in the original order, in an 'Orphans' SyContainer placed at the end of the menu: no program is lost!.

- The user can export now the new menu to MD, and edit the MD file: move programs to right place and update descriptions. Once finished he has to import the file back into SyMenu.

*Actually Items can be shared too, but Items require some extra editing in SyMenu, to add the local path (if it exist in target symenu or host PC!). New menu entries are marked as 'FAKE' by MD2SyMenuImport as a reminder. See MDrules.md, it contains Items.*

For more info you can download the **MDexchange** help (file *MDexchange.chm*).

###Download

You can download the zip file with the last version in the [ms_symtools main page](https://github.com/msillano/ms_symtools)

**Versions:**

2.1 beta

  Initial version.
