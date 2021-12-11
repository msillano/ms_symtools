The **ms_symtool** project was born with to provide **SyMenu** with a series of advanced features, to facilitate the maintenance of complex menus. Of course portables.

>  *[**SyMenu**](https://www.ugmfree.it "SyMenu Home") is an advanced portable alternative to* Windows 'Start Menu'. *Extremely flexible and easy    customizable, it allows you to create multiple dedicated menus (e.g. MMedia, CAD, etc.) with all programs, documents and workspaces relating to a single  area, well organized and specialized according to the interests and needs of the user.*

*Of course, the **ms_symtool** tools have been created based on my needs and are often not quite 'user-friendly', but I think they can also be useful for other experienced users with similar problems. For this, they are Open Source and the latest version is available on [GitHub](https://github.com/msillano/ms_symtools "Public repository").*

-------------------------------
[**PrettyPrint Items**](https://github.com/msillano/ms_symtools/tree/main/PrettyPrintItems  "Download from GitHub") is a tool that extracts a snapshot from the file <code>SyMenuItem.zip</code>, with all the data of the nodes currently present in the **SyMenu** menu and presents them, in the form of a complete tree, in a dynamic HTML page. This allows you to easily handle menus of any size and complexity. Example:


@htmlonly
<!-- start include -->
             <style type="text/css" xmlns="http://www.w3.org/1999/xhtml">
                body  {background-color: white; color: black; }
                .b  {cursor:pointer; color:red; font-weight:bold; text-decoration:none; padding-right: 2px;}
                .e  {border: 0px; margin: 0px 0px 0px 2em; text-indent:-1em;}
                .en {color:#0000FF}
                .an {color:#C00000}
                .av {color:#888888}
                .c  {color:#008800}
                .t  {color:#008800}
                .u  {color: #EE82EE}
                .m  {color:navy}
                .n  {color:black}
                .pi {color:red}
                pre {margin:0px;}
                div {border:0; padding:0; margin:0;}
                .lpc_fragment {font-size:9pt; font-family: Courier, "Courier New", monospace;
                    }

            </style><script type="text/javascript"><!--

function doClick(event) {

    var mark = window.event ?  window.event.srcElement:  event.target;

    while ((mark.className != "b") && (mark.nodeName != "body")) {
        mark = mark.parentNode
    }

    var e = mark;
    while ((e.className != "e") && (e.nodeName != "body")) {
        e = e.parentNode
    }

 // var msg = '0:'+ e.childNodes[0].nodeName+'.'+e.childNodes[0].className+'\n';
 // msg    += '1:'+ e.childNodes[1].nodeName+'.'+e.childNodes[1].className+'\n';
  var s =  ( e.childNodes.length > 2)? 2 : 1;
  if (mark.childNodes[0].nodeValue == "+") {
        mark.childNodes[0].nodeValue = "-";
         for ( var i = s; i < e.childNodes.length; i++) {
    //        msg += i+':'+ e.childNodes[i].nodeName+'.'+e.childNodes[i].className+'\n';
            var name = e.childNodes[i].nodeName;
            if (name != "#text") {
                if (name == "pre" || name == "span") {
                   window.status = "inline";
                   e.childNodes[i].style.display = "inline";
                } else {
                   e.childNodes[i].style.display = "block";
                }
            }
        }
    } else if (mark.childNodes[0].nodeValue == "-") {
        mark.childNodes[0].nodeValue = "+";
         for (var i = s; i < e.childNodes.length; i++) {
   //      msg += i+':'+ e.childNodes[i].nodeName+'.'+e.childNodes[i].className+'\n';
          if (e.childNodes[i].nodeName != "#text" ) {
                 e.childNodes[i].style.display = "none";
            }
         }
     }
//  alert(msg);
     
}
--></script>
<!-- end include -->

<div class="node" style="border: 1px solid #CCCCCC; background-color: #f8f8f8;" xmlns=""><br>
<!-- start html tree --!>

                    <div class="e">
                        <div>
                            <span class="b" onclick="doClick(event)">+</span><span class="m">&lt;</span><span class="en">SyContainer</span> <span class="an">name</span><span class="m">="</span><span class="n">This PC [DESKTOP-LFGU1S1]</span><span class="m">"</span> <span class="an">defaultIcon</span><span class="m">="</span><span class="av">10</span><span class="m">"</span> <span class="an">icon</span><span class="m">="</span><span class="av">.\Icons\imageres_109.ico</span><span class="m">"</span><span class="m">&gt;</span>
                        </div>
                        <div style="display:none">
                            <div class="e">
                                <span class="t">
    </span>
                            </div>
                            <div class="e">
                                <div>
                                    <span class="b" onclick="doClick(event)">+</span><span class="m">&lt;</span><span class="en">SyFolder</span> <span class="an">searchable</span><span class="m">="</span><span class="av">false</span><span class="m">"</span> <span class="an">link</span><span class="m">="</span><span class="av">true</span><span class="m">"</span><span class="m">&gt;</span>
                                </div>
                                <div style="display:none">
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">name</span><span class="m">&gt;</span><span class="n">Explore recents</span><span class="m">&lt;/</span><span class="en">name</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">guid</span><span class="m">&gt;</span><span class="t">9b428a8e-901f-4df8-b355-b7f812949a86</span><span class="m">&lt;/</span><span class="en">guid</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">icon</span><span class="m">&gt;</span><span class="t">.\Icons\imageres_117.ico</span><span class="m">&lt;/</span><span class="en">icon</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">path</span><span class="m">&gt;</span><span class="t">%APPDATA%\Microsoft\Windows\Recent</span><span class="m">&lt;/</span><span class="en">path</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
    </span>
                                    </div>
                                    <div>
                                        <span class="m">&lt;/</span><span class="en">SyFolder</span><span class="m">&gt;</span>
                                    </div>
                                </div>
                            </div>
                            <div class="e">
                                <span class="t">
    </span>
                            </div>
                            <div class="e">
                                <div>
                                    <span class="b" onclick="doClick(event)">+</span><span class="m">&lt;</span><span class="en">SyProgramCmd</span><span class="m">&gt;</span>
                                </div>
                                <div style="display:none">
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">name</span><span class="m">&gt;</span><span class="n">Programs</span><span class="m">&lt;/</span><span class="en">name</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">guid</span><span class="m">&gt;</span><span class="t">b08bdc54-d635-4502-bfcb-1d66dcb808df</span><span class="m">&lt;/</span><span class="en">guid</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">icon</span><span class="m">&gt;</span><span class="t">.\Icons\imageres_5308.ico</span><span class="m">&lt;/</span><span class="en">icon</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">path</span><span class="m">&gt;</span><span class="t">%SystemRoot%\explorer.exe</span><span class="m">&lt;/</span><span class="en">path</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">param</span><span class="m">&gt;</span><span class="t">shell:::{4234d49b-0245-4df3-b780-3893943456e1}</span><span class="m">&lt;/</span><span class="en">param</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
    </span>
                                    </div>
                                    <div>
                                        <span class="m">&lt;/</span><span class="en">SyProgramCmd</span><span class="m">&gt;</span>
                                    </div>
                                </div>
                            </div>
                            <div class="e">
                                <span class="t">
    </span>
                            </div>
                            <div class="e">
                                <div>
                                    <span class="b" onclick="doClick(event)">+</span><span class="m">&lt;</span><span class="en">SyProgramCmd</span><span class="m">&gt;</span>
                                </div>
                                <div style="display:none">
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">name</span><span class="m">&gt;</span><span class="n">God mode</span><span class="m">&lt;/</span><span class="en">name</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">guid</span><span class="m">&gt;</span><span class="t">efc5d68d-d6c7-47d2-b051-527a1517a785</span><span class="m">&lt;/</span><span class="en">guid</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">icon</span><span class="m">&gt;</span><span class="t">.\Icons\imageres_5203.ico</span><span class="m">&lt;/</span><span class="en">icon</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">description</span><span class="m">&gt;</span><span class="t"><i>
                                                <pre>Control Panel items in a list view and organized by their categories. 
Test accents: Sar&agrave; pi&ugrave; hot cos&igrave; o col&agrave; ?</pre>
                                            </i></span><span class="m">&lt;/</span><span class="en">description</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">path</span><span class="m">&gt;</span><span class="t">%SystemRoot%\explorer.exe</span><span class="m">&lt;/</span><span class="en">path</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">param</span><span class="m">&gt;</span><span class="t">shell:::{ED7BA470-8E54-465E-825C-99712043E01C}</span><span class="m">&lt;/</span><span class="en">param</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">url</span><span class="m">&gt;</span><span class="t">https://www.mirazon.com/shell-commands-for-windows-10-navigating-common-folders-in-windows/</span><span class="m">&lt;/</span><span class="en">url</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
    </span>
                                    </div>
                                    <div>
                                        <span class="m">&lt;/</span><span class="en">SyProgramCmd</span><span class="m">&gt;</span>
                                    </div>
                                </div>
                            </div>
                            <div class="e">
                                <span class="t">
    </span>
                            </div>
                            <div class="e">
                                <div>
                                    <span class="b" onclick="doClick(event)">+</span><span class="m">&lt;</span><span class="en">SyFolder</span> <span class="an">searchable</span><span class="m">="</span><span class="av">false</span><span class="m">"</span> <span class="an">link</span><span class="m">="</span><span class="av">true</span><span class="m">"</span><span class="m">&gt;</span>
                                </div>
                                <div style="display:none">
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">name</span><span class="m">&gt;</span><span class="n">C:  [windows]</span><span class="m">&lt;/</span><span class="en">name</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">guid</span><span class="m">&gt;</span><span class="t">74b4679f-1bf9-48ff-9ea7-c912c05988ea</span><span class="m">&lt;/</span><span class="en">guid</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">description</span><span class="m">&gt;</span><span class="t"><i>
                                                <pre>Explore C drive</pre>
                                            </i></span><span class="m">&lt;/</span><span class="en">description</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">path</span><span class="m">&gt;</span><span class="t">C:</span><span class="m">&lt;/</span><span class="en">path</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
    </span>
                                    </div>
                                    <div>
                                        <span class="m">&lt;/</span><span class="en">SyFolder</span><span class="m">&gt;</span>
                                    </div>
                                </div>
                            </div>
                            <div class="e">
                                <span class="t">
    </span>
                            </div>
                            <div class="e">
                                <div>
                                    <span class="b" onclick="doClick(event)">+</span><span class="m">&lt;</span><span class="en">SyFolder</span> <span class="an">searchable</span><span class="m">="</span><span class="av">false</span><span class="m">"</span> <span class="an">link</span><span class="m">="</span><span class="av">true</span><span class="m">"</span><span class="m">&gt;</span>
                                </div>
                                <div style="display:none">
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">name</span><span class="m">&gt;</span><span class="n">D:  [documents]</span><span class="m">&lt;/</span><span class="en">name</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">guid</span><span class="m">&gt;</span><span class="t">a06eab87-0ace-45fc-ad9b-be9359473f39</span><span class="m">&lt;/</span><span class="en">guid</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">description</span><span class="m">&gt;</span><span class="t"><i>
                                                <pre>Explore documents folder (in D:)</pre>
                                            </i></span><span class="m">&lt;/</span><span class="en">description</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">path</span><span class="m">&gt;</span><span class="t">..\documenti</span><span class="m">&lt;/</span><span class="en">path</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
    </span>
                                    </div>
                                    <div>
                                        <span class="m">&lt;/</span><span class="en">SyFolder</span><span class="m">&gt;</span>
                                    </div>
                                </div>
                            </div>
                            <div class="e">
                                <span class="t">
    </span>
                            </div>
                            <div class="e">
                                <div>
                                    <span class="b" onclick="doClick(event)">+</span><span class="m">&lt;</span><span class="en">SyFolder</span> <span class="an">searchable</span><span class="m">="</span><span class="av">false</span><span class="m">"</span> <span class="an">link</span><span class="m">="</span><span class="av">true</span><span class="m">"</span><span class="m">&gt;</span>
                                </div>
                                <div style="display:none">
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">name</span><span class="m">&gt;</span><span class="n">Z:  [multimedia]</span><span class="m">&lt;/</span><span class="en">name</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">guid</span><span class="m">&gt;</span><span class="t">f436ef85-401f-4be6-b03e-247d3456f38c</span><span class="m">&lt;/</span><span class="en">guid</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">icon</span><span class="m">&gt;</span><span class="t">.\Icons\MediaInfo.exe.ico</span><span class="m">&lt;/</span><span class="en">icon</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">description</span><span class="m">&gt;</span><span class="t"><i>
                                                <pre>Explore Z: net drive
MMedia repository for Kody

 </pre>
                                            </i></span><span class="m">&lt;/</span><span class="en">description</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">path</span><span class="m">&gt;</span><span class="n">Z:\MMEDIA</span><span class="m">&lt;/</span><span class="en">path</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
    </span>
                                    </div>
                                    <div>
                                        <span class="m">&lt;/</span><span class="en">SyFolder</span><span class="m">&gt;</span>
                                    </div>
                                </div>
                            </div>
                            <div class="e">
                                <span class="t">
    </span>
                            </div>
                            <div class="e">
                                <div>
                                    <span class="b" onclick="doClick(event)">+</span><span class="m">&lt;</span><span class="en">SyContainer</span> <span class="an">name</span><span class="m">="</span><span class="n">PROJECTS</span><span class="m">"</span> <span class="an">defaultIcon</span><span class="m">="</span><span class="av">10</span><span class="m">"</span><span class="m">&gt;</span>
                                </div>
                                <div style="display:none">
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">SyContainer</span> <span class="an">name</span><span class="m">="</span><span class="n">last project </span><span class="m">"</span> <span class="an">defaultIcon</span><span class="m">="</span><span class="av">10</span><span class="m">"</span><span class="m">/&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <div>
                                            <span class="b" onclick="doClick(event)">+</span><span class="m">&lt;</span><span class="en">SyFolder</span> <span class="an">searchable</span><span class="m">="</span><span class="av">false</span><span class="m">"</span> <span class="an">link</span><span class="m">="</span><span class="av">true</span><span class="m">"</span><span class="m">&gt;</span>
                                        </div>
                                        <div style="display:none">
                                            <div class="e">
                                                <span class="t">
        </span>
                                            </div>
                                            <div class="e">
                                                <span class="m">&lt;</span><span class="en">name</span><span class="m">&gt;</span><span class="n">2021 workarea</span><span class="m">&lt;/</span><span class="en">name</span><span class="m">&gt;</span>
                                            </div>
                                            <div class="e">
                                                <span class="t">
        </span>
                                            </div>
                                            <div class="e">
                                                <span class="m">&lt;</span><span class="en">guid</span><span class="m">&gt;</span><span class="t">4c35ef43-7dcf-4400-b490-ed4ca1941c5a</span><span class="m">&lt;/</span><span class="en">guid</span><span class="m">&gt;</span>
                                            </div>
                                            <div class="e">
                                                <span class="t">
        </span>
                                            </div>
                                            <div class="e">
                                                <span class="m">&lt;</span><span class="en">description</span><span class="m">&gt;</span><span class="t"><i>
                                                        <pre>Work area for actual projects [D:\documenti\PROGETTI\2021}</pre>
                                                    </i></span><span class="m">&lt;/</span><span class="en">description</span><span class="m">&gt;</span>
                                            </div>
                                            <div class="e">
                                                <span class="t">
        </span>
                                            </div>
                                            <div class="e">
                                                <span class="m">&lt;</span><span class="en">path</span><span class="m">&gt;</span><span class="t">..\documenti\PROGETTI\2021</span><span class="m">&lt;/</span><span class="en">path</span><span class="m">&gt;</span>
                                            </div>
                                            <div class="e">
                                                <span class="t">
      </span>
                                            </div>
                                            <div>
                                                <span class="m">&lt;/</span><span class="en">SyFolder</span><span class="m">&gt;</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <div>
                                            <span class="b" onclick="doClick(event)">+</span><span class="m">&lt;</span><span class="en">SyFolder</span> <span class="an">searchable</span><span class="m">="</span><span class="av">false</span><span class="m">"</span> <span class="an">link</span><span class="m">="</span><span class="av">true</span><span class="m">"</span><span class="m">&gt;</span>
                                        </div>
                                        <div style="display:none">
                                            <div class="e">
                                                <span class="t">
        </span>
                                            </div>
                                            <div class="e">
                                                <span class="m">&lt;</span><span class="en">name</span><span class="m">&gt;</span><span class="n">archive RO</span><span class="m">&lt;/</span><span class="en">name</span><span class="m">&gt;</span>
                                            </div>
                                            <div class="e">
                                                <span class="t">
        </span>
                                            </div>
                                            <div class="e">
                                                <span class="m">&lt;</span><span class="en">guid</span><span class="m">&gt;</span><span class="t">410668ec-a5e6-44b8-a801-fb3d5d71bde9</span><span class="m">&lt;/</span><span class="en">guid</span><span class="m">&gt;</span>
                                            </div>
                                            <div class="e">
                                                <span class="t">
        </span>
                                            </div>
                                            <div class="e">
                                                <span class="m">&lt;</span><span class="en">description</span><span class="m">&gt;</span><span class="t"><i>
                                                        <pre>Old projects local repository [E:\RO PROGETTI]</pre>
                                                    </i></span><span class="m">&lt;/</span><span class="en">description</span><span class="m">&gt;</span>
                                            </div>
                                            <div class="e">
                                                <span class="t">
        </span>
                                            </div>
                                            <div class="e">
                                                <span class="m">&lt;</span><span class="en">path</span><span class="m">&gt;</span><span class="t">"E:\RO PROGETTI"</span><span class="m">&lt;/</span><span class="en">path</span><span class="m">&gt;</span>
                                            </div>
                                            <div class="e">
                                                <span class="t">
      </span>
                                            </div>
                                            <div>
                                                <span class="m">&lt;/</span><span class="en">SyFolder</span><span class="m">&gt;</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <div>
                                            <span class="b" onclick="doClick(event)">+</span><span class="m">&lt;</span><span class="en">SyLink</span><span class="m">&gt;</span>
                                        </div>
                                        <div style="display:none">
                                            <div class="e">
                                                <span class="t">
        </span>
                                            </div>
                                            <div class="e">
                                                <span class="m">&lt;</span><span class="en">name</span><span class="m">&gt;</span><span class="t">GitHub</span><span class="m">&lt;/</span><span class="en">name</span><span class="m">&gt;</span>
                                            </div>
                                            <div class="e">
                                                <span class="t">
        </span>
                                            </div>
                                            <div class="e">
                                                <span class="m">&lt;</span><span class="en">guid</span><span class="m">&gt;</span><span class="t">e561b5ca-9a2e-44f7-bb59-0fff36d02cc7</span><span class="m">&lt;/</span><span class="en">guid</span><span class="m">&gt;</span>
                                            </div>
                                            <div class="e">
                                                <span class="t">
        </span>
                                            </div>
                                            <div class="e">
                                                <span class="m">&lt;</span><span class="en">description</span><span class="m">&gt;</span><span class="t"><i>
                                                        <pre>Online main repository</pre>
                                                    </i></span><span class="m">&lt;/</span><span class="en">description</span><span class="m">&gt;</span>
                                            </div>
                                            <div class="e">
                                                <span class="t">
        </span>
                                            </div>
                                            <div class="e">
                                                <span class="m">&lt;</span><span class="en">url</span><span class="m">&gt;</span><span class="t">https://github.com/msillano</span><span class="m">&lt;/</span><span class="en">url</span><span class="m">&gt;</span>
                                            </div>
                                            <div class="e">
                                                <span class="t">
      </span>
                                            </div>
                                            <div>
                                                <span class="m">&lt;/</span><span class="en">SyLink</span><span class="m">&gt;</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="e">
                                        <span class="t">
    </span>
                                    </div>
                                    <div>
                                        <span class="m">&lt;/</span><span class="en">SyContainer</span><span class="m">&gt;</span>
                                    </div>
                                </div>
                            </div>
                            <div class="e">
                                <span class="t">
    </span>
                            </div>
                            <div class="e">
                                <span class="m">&lt;</span><span class="en">SySeparator</span> <span class="an">name</span><span class="m">="</span><span class="av">&lt;Separatore&gt;</span><span class="m">"</span><span class="m">/&gt;</span>
                            </div>
                            <div class="e">
                                <span class="t">
    </span>
                            </div>
                            <div class="e">
                                <div>
                                    <span class="b" onclick="doClick(event)">+</span><span class="m">&lt;</span><span class="en">SyFolder</span> <span class="an">searchable</span><span class="m">="</span><span class="av">false</span><span class="m">"</span> <span class="an">link</span><span class="m">="</span><span class="av">true</span><span class="m">"</span><span class="m">&gt;</span>
                                </div>
                                <div style="display:none">
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">name</span><span class="m">&gt;</span><span class="n">Download</span><span class="m">&lt;/</span><span class="en">name</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">guid</span><span class="m">&gt;</span><span class="t">e48fbe89-cfa7-4a91-a20b-5ef64b0f0d92</span><span class="m">&lt;/</span><span class="en">guid</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">description</span><span class="m">&gt;</span><span class="t"><i>
                                                <pre>Explore new file from NET (in D:)</pre>
                                            </i></span><span class="m">&lt;/</span><span class="en">description</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">path</span><span class="m">&gt;</span><span class="t">..\Download</span><span class="m">&lt;/</span><span class="en">path</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
    </span>
                                    </div>
                                    <div>
                                        <span class="m">&lt;/</span><span class="en">SyFolder</span><span class="m">&gt;</span>
                                    </div>
                                </div>
                            </div>
                            <div class="e">
                                <span class="t">
    </span>
                            </div>
                            <div class="e">
                                <div>
                                    <span class="b" onclick="doClick(event)">+</span><span class="m">&lt;</span><span class="en">SyFolder</span> <span class="an">searchable</span><span class="m">="</span><span class="av">false</span><span class="m">"</span> <span class="an">link</span><span class="m">="</span><span class="av">true</span><span class="m">"</span><span class="m">&gt;</span>
                                </div>
                                <div style="display:none">
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">name</span><span class="m">&gt;</span><span class="n">Backup</span><span class="m">&lt;/</span><span class="en">name</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">guid</span><span class="m">&gt;</span><span class="t">fc240337-5dfb-4054-a2f2-794038c1dce5</span><span class="m">&lt;/</span><span class="en">guid</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">description</span><span class="m">&gt;</span><span class="t"><i>
                                                <pre>Explore E drive, used as backup and repository</pre>
                                            </i></span><span class="m">&lt;/</span><span class="en">description</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">path</span><span class="m">&gt;</span><span class="t">E:</span><span class="m">&lt;/</span><span class="en">path</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
    </span>
                                    </div>
                                    <div>
                                        <span class="m">&lt;/</span><span class="en">SyFolder</span><span class="m">&gt;</span>
                                    </div>
                                </div>
                            </div>
                            <div class="e">
                                <span class="t">
    </span>
                            </div>
                            <div class="e">
                                <div>
                                    <span class="b" onclick="doClick(event)">+</span><span class="m">&lt;</span><span class="en">SyProgramCmd</span><span class="m">&gt;</span>
                                </div>
                                <div style="display:none">
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">name</span><span class="m">&gt;</span><span class="n">IObitUninstaler</span><span class="m">&lt;/</span><span class="en">name</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">guid</span><span class="m">&gt;</span><span class="t">b3a342b2-d16c-439b-b34d-4ce38dda8543</span><span class="m">&lt;/</span><span class="en">guid</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">icon</span><span class="m">&gt;</span><span class="t">.\Icons\IObitUninstaler.exe_2.ico</span><span class="m">&lt;/</span><span class="en">icon</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">description</span><span class="m">&gt;</span><span class="t"><i>
                                                <pre>IObit Uninstall Tool</pre>
                                            </i></span><span class="m">&lt;/</span><span class="en">description</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">path</span><span class="m">&gt;</span><span class="t">C:\Program Files (x86)\IObit\IObit Uninstaller\IObitUninstaler.exe</span><span class="m">&lt;/</span><span class="en">path</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">version</span><span class="m">&gt;</span><span class="t">11.1.0.18</span><span class="m">&lt;/</span><span class="en">version</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="t">
    </span>
                                    </div>
                                    <div>
                                        <span class="m">&lt;/</span><span class="en">SyProgramCmd</span><span class="m">&gt;</span>
                                    </div>
                                </div>
                            </div>
                            <div class="e">
                                <span class="t">
    </span>
                            </div>
                            <div class="e">
                                <div>
                                    <span class="b" onclick="doClick(event)">+</span><span class="m">&lt;</span><span class="en">SyProgramCmd</span><span class="m">&gt;</span>
                                </div>
                                <div style="display:none">
                                    <div class="e">
                                        <span class="t">
      </span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">name</span><span class="m">&gt;</span><span class="n">WinUninstaler</span><span class="m">&lt;/</span><span class="en">name</span><span class="m">&gt;</span>
                                     </div>
                                     <div class="e">
                                        <span class="m">&lt;</span><span class="en">guid</span><span class="m">&gt;</span><span class="t">5c71a9c4-b5b7-4fd9-a093-b052959016d1</span><span class="m">&lt;/</span><span class="en">guid</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">icon</span><span class="m">&gt;</span><span class="t">.\Icons\nircmd.exe_2.ico</span><span class="m">&lt;/</span><span class="en">icon</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">description</span><span class="m">&gt;</span><span class="t"><i>
                                                <pre>Uninstall programs (Windows)</pre>
                                            </i></span><span class="m">&lt;/</span><span class="en">description</span><span class="m">&gt;</span>
                                    </div>
                                    <div class="e">
                                        <span class="m">&lt;</span><span class="en">path</span><span class="m">&gt;</span><span class="t">%SystemRoot%\explorer.exe</span><span class="m">&lt;/</span><span class="en">path</span><span class="m">&gt;</span>
                                     </div>
                                      <div class="e">
                                        <span class="m">&lt;</span><span class="en">param</span><span class="m">&gt;</span><span class="t">shell:::{7b81be6a-ce2b-4676-a29e-eb907a5126c5}</span><span class="m">&lt;/</span><span class="en">param</span><span class="m">&gt;</span>
                                    </div>
                                       <div>
                                        <span class="m">&lt;/</span><span class="en">SyProgramCmd</span><span class="m">&gt;</span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <span class="m">&lt;/</span><span class="en">SyContainer</span><span class="m">&gt;</span>
                            </div>
                        </div>
                    </div>


<!-- end html tree -->

   <br></div>
    @endhtmlonly
             
*Click on the red plus (<span class="b">+</span>) to open.* (from <A href="https://www.ugmfree.it/Forum/messages.aspx?TopicID=830">SyMenu forum</A>)
   
The **PrettyPrintItems** output document is useful as is, but you can also cut a branch and insert it in any of your page: HTML, markdown, o Doxygen, keeping colors and dynamicity. This page, e.g., is a *markdown* page, imported by *Doxygen* to build the *chm* documentation of the entire project.

--------------------------------------
**Installation** (same for all ms-symtools)

 - Unzip the distribution file in dir <code>[SyMenu]\Programfile</code>, so you get: <code>[SyMenu]\Programfile\sm-symtools\xxx.xxx</code>
 - Look at the help file <code>tool-name.chm</code> for specific preconditions,  istructions, etc..  
 Start from the main file: <a class="el" href="pretty_print_items_8bat.html#details" target="_self">prettyPrintItems.bat</a>


