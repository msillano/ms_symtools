**My SyMenu tools**  project (**ms_symtool**) was born with to provide **SyMenu** with a series of advanced features, to facilitate the maintenance of complex menus. Of course portables.

>  <A href="https://www.ugmfree.it" target="_blank">SyMenu</A> is an advanced portable alternative to Windows 'Start Menu'. Extremely flexible and easy    customizable, it allows you to create multiple dedicated menus (e.g. MMedia, CAD, etc.) with all programs, documents and workspaces relating to a single  area, well organized and specialized according to the interests and needs of the user.

*Of course, the **ms_symtool** tools have been created based on my needs and are often not quite 'user-friendly', but I think they can also be useful for other experienced users with similar problems. For this, they are Open Source and the latest version is available on <A href="https://github.com/msillano/ms_symtools" target="_blank">GitHub</A>.*
 
--------------------------------------

 <A href="https://github.com/msillano/ms_symtools/tree/main/MDexchange" target="_blank">**SyMenu MD Exchange**</A> consist of two tools to **export** and **import** SyMenu structure to/from **markdown files**: <tt>SyMenu2MDexport.bat</tt> and <tt> MD2SyMenuimport.bat</tt> , plus the extra <tt>SyMenuUndo.bat</tt>, to revert the SyMenu changes.

**MDExchange** allows you to document and 'share' partial or full SyMenu trees with other users. This can be done as a discussion topic in the SyMenu <A href="https://www.ugmfree.it/Forum/" target="_blank">Forum</A>.

The Markdown format allows for easily management of large menus: by editing comfortably an MD file, in a featured editor,  you can update and reorganize the menu tree, change names and edit tooltips for all items. 

*This tool offers new options for advanced users: now you can also use this way to modify and maintain SyMenu structures, in addition to the methods already available in SyMenu: use it if and when you find it useful and beneficial.*

It works in 3 steps:

**1 - Export SyMenu to MD**

The `SyMenu2MDexport.bat` tool transforms the actual SyMenu configuration structure in a **Markdown file**, for the **MarkdownPad2** editor:

<img src="https://github.com/msillano/ms_symtools/blob/main/img/fig011.jpg?raw=true"  width="900">

**important**
<blockquote>*Using **MarkdownPad2** is mandatory: I have tested many MD editors, and the MD->HTML  transformation is handled in different ways by different programs. As an extra, MarkdownPad2 offers visible feedback with easy CSS handling, even in the free version, useful for changing the look of HTML output. (MarkdownPad2 is present in SPS SyMenu suite).<br />If you like, you can use a more featured editor to edit the MD file (e.g. MarkdownPad2 has no "find and replace" function), but you need to do a 'blind' editingt, without feedback. <br /> In any case you MUST use **MarkdownPad2 to export an MD2SyMenuimport compatible file.***</blockquote>


This MD format (see  `share/MD-for-SyMenu.pdf`) was chosen to achieve three goals:

- Easy to modify by the user
- It produces an immadiate HTML visual feedback.
- Ability to add comments

*Easy to Modify:* no MD or HTML skill required. The user edits only some fields in pure text, in green in the image, and manages a few simple tags (red).

*HTML visual feedback:* As you see, the HTML preview is clean, with vertical bars to highlight the structure. Any MD errors are immediately visible. In addition, the CSS, easy editable in MarkdownPad2, allows for coarse control of the HTML output.

*Add comments:* User can add rich comments, also with images. See  <A href="https://github.com/msillano/ms_symtools/blob/main/MDexchange/share/MD-for-SyMenu.pdf" target="_blank">share/MD-for-SyMenu.pdf</A> as an example.
 
See `SyMenu2MDexport.bat` for more details.

**2 - Editing**

You can start from a 'shared menu' (md) or from your SyMenu exported with SyMenu2MDexport.

***You can rearrange the menu tree, with a cut&paste. You can add Containers, Separators and Labels and update the name or description of the Items.***

The details of MD editing rules are in the file `share/MD-for-SyMenu.pdf`. <i> It is an example of 'correct' MD file for SyMenu (i.e. the file `MD-for-SyMenu.md` can be imported in SyMenu) and it contains, as comments, **all the rules** required for editing.</i>  

**3 - Import MD to SyMenu**

Once the edit phase is complete, the user must save the file as (X)HTML. In MarkdownPad2: <tt>file|Export|Export HTML</tt>.

The 'Import' tool, MD2SyMenuImport.bat, keeps the HTML file exported by <tt>MarkdownPad2</tt> and smart merges it back into the existing `SyMenuItem.zip` file, updating all changed menu items, in one step.

- One feature is that you can <i>update the full menu</i> or <i>just a branch</i>. Delete all lines before and after the area of interest, to get the required branch as the root node: the 'import' will replace the old menu branch with the new version. 

- Or you can <i>export just items</i>, in a flat list. After modification, the 'import' replaces all updated items in the correct location in the tree. This can be useful, e.g., for a global revision of descriptions and keywords.

- You can also export <i>tree only</i>, without Items. This mode allows the SyMenu tree to be **shared** among users.<br />
Importing an 'empty' tree places all existing Items in an extra **orphans** SyContainer: using 'drag&drop', in the SyMenu Configuration tree, it is easy to re-populate the new tree. 
Quik and useful for a radical reorganization of SyMenu.


See `MD2SyMenuImport.bat`  for details.

<blockquote><i>Perhaps the best use of this tool is the menu sharing and the creation of large classification tree, in the case of reorganizations of your SyMenu. (e.g. creation of a SyMenu specialozed in Multimedia). In case of large menus it is mandatory to have a robust tree hierarchy, which then can be updated gradually, even before reaching the <A href="https://www.ugmfree.it/Forum/messages.aspx?TopicID=817" target="_blank">more than 3'000</A> Drakkn's Items :).</i></blockquote>

**notes:**

- *Using **MDExchange** is safe, as it makes a backup before any changes to SyMenuItem.zip.*
- *Using **MDExchange** is safe, because it never delete one Item: all Items from the original menu, but not present in the updated output, are grouped in an ad hoc 'orphans' SyContainer.*

**share menus**

A menu Exported in 'TREE' mode does no contains any local reference and may contain comments. Then you can <i>share</i> the **MD file** because it is portable, and you can also insert <i>howto</i> information. <br />Any user can **import** it into their **SyMenu**, as template for a total or partial menu reorganization.

<blockquote>*Actually Items can be shared too, but Items require some extra editing in SyMenu, to add the local path (if it exist in the target!) and all options. New menu entries are marked as 'FAKE' by MD2SyMenuImport as a reminder. See MD-for-SyMenu.md, it contains Items (as example).*</blockquote>


**4 - SyMenu Undo** (SyMenuUndo.bat) is a simple tool to restore the **SyMenuItem.zip** from the newest backup.
Every run of SyMenuUndo consumes a backup, so you can go back how many steps you like. 

See  `SyMenuUndo.bat` for details.

--------------------------------------
**Installation** (same for all ms-symtools)

 Unzip the distribution file in dir <code>[SyMenu]/Programfile</code>, so you get:

  <pre>
    ms-symtools\
         MDExchange.config.bat
         SyMenu2MDexport.bat
         MD2SyMenuImport.bat
         SyMenuUndo.bat
         MDExchange.chm
         regexfilter.jar

         ico\
             ms_symtools.ico
             tools.ico

         lib\
             7z.dll
             7z.exe
             IKVM.OpenJDK.Charsets.dll
             IKVM.OpenJDK.Core.dll
             IKVM.OpenJDK.Text.dll
             IKVM.OpenJDK.Util.dll
             IKVM.OpenJDK.XML.API.dll
             IKVM.Runtime.dll
             saxon-he-10.5.dll
             saxon-he-api-10.5.dll
             Transform.exe

         xslt\
             MDE.add_orphans.xslt
             MDE.convert_md_to_xml.xslt
             MDE.empty.xml
             MDE.export.xslt
             MDE.merge_menu.xslt

         rgx\
             MDE.clean_hashtag.rgx
             MDE.clean_md.rgx
             MDE.clean_xml.rgx
             MDE.import_md.rgx
             MDE.import_xml.rgx

         share\
             MD-for-SyMenu.md
             MD-for-SyMenu.pdf
	
         result\ 
             dummy </pre>

 See `MDExchange.config.bat`  for configuration defaults.


-



