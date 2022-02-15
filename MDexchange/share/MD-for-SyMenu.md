MD rules    v 1.1        20220116-13h51m10s
-----------
-----------------------------
&lt;!--
*This document (MD-for-SyMenu.md) is a 'valid' template for MD menus (it can be imported into SyMenu), and contains comments on the rules to follow to **edit MD files for SyMenu in MarkdownPad2**. Here's how it looks when imported into SyMenu:* 
<img src="https://github.com/msillano/ms_symtools/blob/main/img/fig013.jpg?raw=true" alt="SyMenu tree" /> The pdf version is  easier to read, but you MUST see it in MD as well, to view the control characters (#, >, \*) and the HTML tags (&lt;dfn>).
*In  **MarkdownPad2** you can take advantage of the LivePreview to get a
immediate feedback on the corretcness of your files: **vertical guides** (visibles using
'markdown.css' in MarkdownPad2|Tools|Options|Stylesheets|Custom CSS) helps you
to maintain the right level of nesting.
To export the HTML file (MarkdownPad2|File|Export|Export HTML) use the 'Markdown' processor (MarkdownPad2|Tools|Options|Markdown)* -->

&lt;!--
*- For a full SyMenu tree, **'SyRoot'** MUST be the root node (level 0). 
 - For a partial tree, Item list etc. any root is OK* -->


#SyRoot

>&lt;!--
*Next is a program entry: 'Level 1 Program 1 name'.
The **&lt;dfn /> + &lt;BR />** tags are required by the Items:
  SyProgramCmd, SyWinCmd, SyDocument, SyLink, SyFolder.
This structure is build by the **SyMenu2MDexport** program,
 and you **NEVER have to change it**.
You can change the **'name'** and **'description'**, or **move**
 or **delete** the Items.*--> 

><dfn id="2345-12-1234-12340101" type="SyProgramCmd">Level 1 Program 1 name</dfn><br />
>*description for Level1 Program1* 

><dfn id="1234-12-1234-12340102" type="SyWinCmd">Level 1 WinCmd 2 name</dfn><br />
*Here the 'description' (optional), used as tooltip*

>&lt;!--
>*To use the 'description' as tooltip see 
><A href="https://www.ugmfree.it/SyMenuManual.aspx#Advanced_menu_Options_Menu" target="_blank" > Show tooltip on item entries</A> in SyMenu.
Always put the **Description** in MD italic (\*...\*) marks,  just after the
 &lt;BR /> tag, **without blank lines** (important!)* -->

>&lt;!--
 ***Containers Rules:**
1. You can **add** or **delete** a container as you like.
2. The container 'name' is used as a key: 
    changing the name creates a new container.
3. Care to **keep the level (N) updated**: 
   Next Container is on level 1, so:
     just one **(N) block mark (&gt;)** 
     and two **(N + 1) number signs (\#\#).***  -->

>##Container name (level 1)
*Here Container description* 

>>&lt;!--
***Rules for Items (SyProgramCmd, SyWinCmd, SyDocument, SyLink, SyFolder)**: 
1. You CAN: 
      a) to change the <b>position</b> of the Item in the menu (cut&paste):
         Allways care to **keep the level updated.**
      b) to change the dfn content ( **name** or menu choice), 
      c) to change the **description** (tooltip).
2. Keep **one or more blank lines** between items.
3. If you **delete** an Item in MD, it will be not deleted in SyMenu,  but moved into the **'orphans'** container at the end.
4. If you **ADD a new Item** (as we do in this file), it is added 
   'FAKE' to the name and it will appear <A href="https://www.ugmfree.it/SyMenuManual.aspx#UnlinkedItem" target="_black">unlinked</A>. You MUST edit it (SyMenu|Configuration).
   note: use an uniques 'id' for "new items", e.g. use a timestamp or a <A href="https://www.tenforums.com/tutorials/130522-generate-globally-unique-identifier-guid-windows.html"  target="_blank">new GUID</A>.
5. For Items, **Level N** requires **N block mark**:
   See the next Item at Level 2: (&gt;&gt;)* -->

>><dfn id="3456-12-1234-12340201" type="SyFolder">Level 2 Folder 1 name</dfn><br />
*description for the Item.*

>>&lt;!--
***Labels rules**
 - Labels have only a name, no description.
 - The tag **'&lt;label>xxxxxxxxxxx&lt;label />'** is mandatory.
note: To highlight labels in HTML add to CSS
(in MarkdownPad2|Tools|Options|Stylesheets|Edit):
     <span style="font-style: normal">label { 
           font-style: italic;
           font-weight: 600; 
           }</span>* -->

>><label>label name</label>

>>&lt;!--
***Separator rules**: 
The **'&lt;hr class="SySeparator" />'** tag is required.
Only the **'separator name' as description.**
note: To control the separator look in HTML, add some like this to CSS  (in MarkdownPad2|Tools|Options|Stylesheets|Edit): 
    <span style="font-style: normal">hr.syseparator  { 
       width: 350px;
       border-top: 8px solid lightgrey;
       margin-bottom: -15px; 
       margin-right:auto;
       margin-left: 0;
       }</span>* -->

>><hr class="syseparator" />
*separator name*
 
>><dfn id="4567-12-1234-12340202" type="SyLink">Level 2 Link 2 name</dfn><br />
>>*Test languages in descriptions:
- (IT): Sarà più hot così o colà? (it will be hotter like this or that?)
- (Taj): เชื่อถือได้  (reliable)
- Special char test: < % &  "  # @  '  * >   WYSIWYG in SyMenu Configuration form
- Special char test: < % &  "  # @  '  * >   WYSIWYG in MarkdownPad2
- Escaped by user (or by SyMenu2MDexport):
     \# starting number sign,  \*\*asterisks\* near text, and ~~~ in next line:
>~~~~~~~~~*

>>&lt;!--
***Description rules:**
    1 The block marks (&gt;&gt; here two because at level 2) may or may not be repeated in each line of the description.
    2 Descriptions are always included in **'italics' MD marks (\*...\*).**
        note: spaces not allowed between description text and marks (\*).
    3 SyMenu restrictions: tooltips are pure text, without any tag: 
       a) **do not use** any MD features: bold, images, links, lists (1.), etc. 
       b) **do not use** any HTML tags like &lt;b&gt; etc.
       c) the CRLF (newLine) are repected in tooltips, MD and HTML (with updated CSS).
    4 XML restrictions: The five chars **[&amp;, &lt;, &gt;, &quot;, &apos;]** MUST be replaced by entities: [&amp;amp;, &amp;lt;, &amp;gt;, &amp;quot;, &amp;apos;]. Fortunately the  editors used (SyMenu and MarkdownPad2) are WYSIWYG and they do it for you.
    5 Markdowm restrictions: following chars:**[# (at the beginning of the line) and * (not alone)]** MUST be escaped: [\\\#, \\\*]: but it is rare to use it in names or descriptions. And hashtags are handled by tools.
    6 Markdowm restriction: the sequence '~~~' at the beginning of the line has a special meaning: to escape it add a **block mark** (&gt;) before.
    7 This tool restrictions: do not insert blank lines into the description. Leading and trailing spaces are cut off.
    8 **important!** To have descriptions that respect the newLines in HTML you must add to the CSS (in MarkdownPad2|Tools|Options|Stylesheets|Edit):
         <span style="font-style: normal">em { white-space: pre-wrap; }
         em { display: block;
             font-style: italic;
             }</span>
     alternatively:
         <span style="font-style: normal"> em { display: none; }</span>   to hide the descriptions in the HTML preview.*  -->

><dfn id="5678-12-1234-12340203" type="SyWinCmd">BAD Level 2: becomes Level 1</dfn><br />
*ERROR: missing a 'block mark' (&gt; in place of &gt;&gt;)
IMPORTANT!: Any error in 'block mark' (&gt;) breaks the levels 
(see vertical guides in preview) and following items MAY be missing*

>><dfn id="4567-12-1234-12340204"  type="SyDocument">Level 2 Item 4</dfn><br />
*This is fine. But it will be missed!
\#hashtag #second hashtag*

>>&lt;!--
***Hashtag rules:**
 1: Only if you have chosen 'USER' option (on MDexchange) you CAN manage hashtags.
   Hashtags are in the last description line, without leading spaces: the first begins with an escaped number sign (\\#).
 2: With the 'NONE' option, existing hashtag are deleted.
 3: On the 'AUTO' option, hashtags are added by **MDexchange,** reflecting the actual position of the Item in the menu.* -->

>>><dfn id="5678-12-1234-12340205"  type="SyLink">Level 2 Item 5</dfn><br />
*ERROR: extra 'block mark' (&gt;&gt;&gt; in place of &gt;&gt;)*

>><dfn id="4567-12-1234-12340206"  type="SyProgramCmd">Level 2 Item 6</dfn><br />
*This is OK, but it is missed too.*

>## Container level 1 bis  
*noting to say about this container*

>>&lt;!--
***Comment rules:**
  1: Standard HTML comments (&lt;!--   comment -->) are visible in MD but invisible in the HTML output.
  2: Escaped comments (&amp;lt;!--  comment -->) are visible in HTML.
   Only on these comments you can use MD and HTML tags to enhance the text.
   IMPORTANT: Avoid any block tags that break the Level!.*
   &#160;&#160;Here I have used this style to get a good looking pdf rule page.
  *3: Comments are NOT processed. 
  4: In VERBOSE mode, "SyMenu2MDexport.bat" adds its own comments to the MD output: the comments are visibles on an MD editor.
  5: In VERBOSE mode, "MD2SyMenuImport.bat" adds its own comments to the XML/ZIP output: the comment are visible in the SyMenuItem.xml file or in the SyMenu-prettyPrinter output.
  6: IMPORTANT! put **'block marks' (&gt;)** in front of comments as required by the current level* -->

>>### Container level 2
*Container at level 2: only two  block mark (&gt;&gt;) 
and three (2+1) number sigs (###).* 

>>>#### Container level 3 

>>>><dfn id="7891-12-1234-12340401"  type="SyProgramCmd">Level 4 program 1</dfn><br />
*test long line test long line test long line test long line test long line test long line test long line test long line test long line test long line*

>>>><!-- comment level 4: hidden in HTML -->

>>><dfn id="8910-12-1234-12340301"   type="SyProgramCmd">Level 3 program 1</dfn><br />
*program comment*

><dfn id="9101-12-1234-12340103" type="SyProgramCmd">Level 1 program 3</dfn><br />
*program comment*

--------------------------------
<small>by  SyMenu2MDexport v. 1.0 (alpha)&#160;&#160;&#160; &#169;2021 Marco Sillano</small>
