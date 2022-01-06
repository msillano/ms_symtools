[**SyMenu MD Exchange**](https://github.com/msillano/ms_symtools/tree/main/MDexchange  "Download from GitHub") is a tool that export and import the SyMenu structure to/from *markdown* files. This allows for easily management of large menus. By editing an *MD* file you can update and reorganize the menu tree, change names and edit tooltips for all items. 

The origin of this solution bemes from afar. I like *SyMenu* for the *tooltips*: between the *'Start Menu'* replacements this is a unique feature. Why do I like tooltips? Because I use many programs, but not in a regular basis, the tooltips are an useful aid in remebering information about programs and features, documentation, and workflows.

How to edit the SyMenu Configuration? SyMenu offers a tree for managing the menu structure and 'ad hoc' forms for configuring items. Faster, a file can be 'drag&drop' onto the SyMenu Icon and a new item is added to menu. You can also do a 'Batch Import' which scans a folder and adds all executables files. Quite? Yes... and not. I also need a more global way, not so detailed and punctual as the forms, but not so simple and skeletal as the SyMenu Tree view. 

L'option to directly edit the SyMenuItem in XML, perhaps with a specializzated editor is too verbose and full of details: not praticable. XML is useful for documentation pourposes: see prettyPrintMenu.

The basic idea here is to use the Markdown, much less verbose than XML, to define just a few important (to me) aspects of SyMenu: building large trees, fine-tuning tootips, in generally speaking visible parts of the menu, in a fast, easy and avantageous way. (e.g. to define a new menu structure of 60-100 branchs, or rewrite some SPS descriptions, ofthen too big to fit into a tooltip).

In any case this is a new option for advanced users: now you can also use this way to edit and maintain SyMenu structures, one more alternative. Use it if and when you find useful and beneficial.

A simple example, using the branch ['This PC[DESKTOP-LFGU1S1]'](https://www.ugmfree.it/Forum/messages.aspx?TopicID=830) can help: 

![Menu branch](https://github.com/msillano/ms_symtools/blob/main/img/fig101.jpg?raw=true)
   
This structure was created using the SyMenu features.

![SyMenu form](https://github.com/msillano/ms_symtools/blob/main/img/fig010.jpg?raw=true)

The alternative I propose is based on 3 steps:

### Export to MD ##
The `SyMenu2MDexport` tool transforms the SyMenu configuration structure in a *Markdown file*, easy manageable by MarkdownPad2.

![Markdown edit](https://github.com/msillano/ms_symtools/blob/main/img/fig011.jpg?raw=true)

The MD format was chosen to achieve 2 goals:

- Easy to modify by the user
- It produces a good HTML visual feedback, further customizable using CSS.

### Edit MD
Now the user can rearrange the menu tree, with a cut&paste in MD. It can add Containers, Separators and Labels and update the name or description of the Items.

If descriptions are used as tooltip content, as I do with my menus, it helps to keep then not too big. Since the description is seachable from SyMenu, you need to choose the included keywords carefully.

The details of MD editing rules are in the file `MD-for-SyMenu.md.` 

### Import MD to SyMenu
Once the edit phase is complete, the user must save the updated file. In MarkdownPad2: *file|Export|Export HTML*.

The `MD2SyMenuImport` tool keeps the HTML file exported by *MarkdownPad2* and merges it back into the existing `SyMenuItem.zip` file, updating all changed menu items,  in one step.

One feature is that you can update the full menu or just a branch. Delete all lines before and after the area of interest, to get the required branch as the root node: the 'import' will replace the old menu branch with the new version. 

Or you can export just items, in a flat list. After modification, the 'import' replaces all updated items in the correct location in the tree.

*Perhaps the best use of this tool is the creation of large classification tree, in the case of reorganizations of your SyMenu. (e.g. creation of a SyMenu specialozed in Multimedia). In case of large menus it is mandatory to have a robust tree hierarchy, which then can be updated gradually, even before reaching the [more than 3'000+](https://www.ugmfree.it/Forum/messages.aspx?TopicID=817) Drakkn Items :).*

Done.

**notes:**

- *Using **MDexchange** is safe, as it makes a backup before any changes to SyMenuItem.zip. The simple **SyMenuUndo.bat** tool can restore SyMenuItem.zip from the last backup.*

- *Using **MarkdownPad2** is mandatory: I have tested many MD editors, and the MD->HTML  transformation is handled in different ways by different programs. As an extra, MarkdownPad2 offers visible feedback with easy CSS handling, even in the free version, useful for changing the look of HTML output. If you like, you can use a multi-featured editor to edit the MD file (e.g. Notepad++) but it is mandatory to load  the edited file in MarkdownPad2 for export to (X)HTML.*
