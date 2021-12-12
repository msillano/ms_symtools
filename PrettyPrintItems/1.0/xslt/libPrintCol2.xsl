<?xml version="1.0" encoding="utf-8"?>
<!--
  Copyright 1999-2004 The Apache Software Foundation

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<!--+
    | XSLT REC Compliant Version of IE5 Default Stylesheet
    |
    | Original version by Jonathan Marsh (jmarsh@microsoft.com)
    | Conversion to XSLT 1.0 REC Syntax by Steve Muench (smuench@oracle.com)
    | Added script support by Andrew Timberlake (andrew@timberlake.co.za)
    | Cleaned up and ported to standard DOM by Stefano Mazzocchi (stefano@apache.org)
    |
    | CVS $Id: xml2html.xslt,v 1.10 2004/05/01 13:20:55 joerg Exp $
    +-->
<!--
    modified 28/11/21 by M. Sillano for SyMenu (CSS)
 -->

<xsl:stylesheet version="1.0"
            xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
            xmlns="http://www.w3.org/1999/xhtml">

   <!-- 
     Controls the default initial status of the XML tree
                       status='open'|'close' -->
    <xsl:param name="status">open</xsl:param>
 <!--
 /** @file
 *  This is a XSLT library (template collection). 
 *  Pretty-prints XML/XHTML files/nodes as collapsible tree with syntax color highlighting.
 *  This library can be "imported", so it is possible to overwrite
 *  some rules, to get the desired behaviour.
 *
 * @note The output is valid XHTML 1.1
 * @note This file is a version with CSS modified of filters_dox\bin\xslt\libPrintCol.xsl.
 *
 */ -->
 
 <!--
 /** 
 * @var status  *
 * @details Controls the default initial look of the XML tree: accepts 'open'|'close' 
 */ --> 
 <!--
 /** @file
 * @version 28/11/2021 for SyMenu
 * @author   Copyright 1999-2004 The Apache Software Foundation @n
 *           Modified by Marco Sillano (marco.sillano(at)gmail.com).
 */  -->

 <!--
 /**
 * Pretty-prints XML as colorful tree, entry point.
 * Function (named template) to process a  XML (XSLT/XHTML) fragment. It produces in output an HTML lpc_fragment showing the code.@n
 * Great sample of "data-driven" style in XSLT transformation.
 *
 * @par Use:
 *       <tt>&lt;xsl:call-template  name="printCol" /&gt;</tt>
 *
 */ -->

    <xsl:template name="printCol">
        <div class="lpc_fragment">
            <xsl:apply-templates select="."
                                 mode="printCol" />
        </div>
    </xsl:template>

 <!--
 /**
 * Generates tags with embedded css and Javascript.
 * Function (named template) to create <tt>&lt;style&gt;</tt> and <tt>&lt;script&gt;</tt> XHTML tags,
 * as required by HTML fragments build by xslt_libprintcol_template_01().<BR/>
 * Usually in <tt>&lt;HEAD></tt> tag, but works also in <tt>&lt;BODY></tt>.
 * @par Use:
 *      <tt> &lt;xsl:call-template  name="embeddedHeader" /&gt;</tt>
 *
 * @see xslt_libprintcol_template_03 for the use of external files.
 */  -->
   <xsl:template name="embeddedHeader">
            <style>
    	  <!--
      .lpc_fragment {font-size:10pt; font-family: "DejaVu Sans Mono", Courier, monospace;}
	      -->
                .b  {cursor:pointer; color:red; font-weight:bold; text-decoration:none; padding-right: 2px;}
                .e  {border: 0px; margin: 0px 0px 0px 2em; text-indent:-1em;}
                .en {color:#001a33} 
                .an {color:#606060}
                .av {color:#00264d}
                .c  {color:#808080}
                .t  {color:#004d99}
			    .u  {color:#EE82EE}
                .m  {color:navy}
                .pi {color:#808080}
                pre {margin:0px;}
                div {border:0; padding:0; margin:0;}
            </style>
            <script ><xsl:comment><![CDATA[

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
]]></xsl:comment>
      </script>
   </xsl:template>

<!--
 /**
 * Generates tags including local/remote css and Javascript files.
 *
 * Function (named template) to ceate <tt>&lt;style&gt;</tt> and <tt>&lt;script&gt;</tt> HTML tags in header,
 * as required by HTML fragments build by libprintcol_template_01().@n
 *
 * Includes local or remote files: @n
 *   - {$baseURL}include/colCode.js
 *   - {$baseURL}css/colCode.css
 *
 * @param name
 *      the template name, for direct call.
 * @param baseURL
 *  - If absent, generates relative URI, using "css/colCode.css" and "include/colCode.js".
 *  - Local baseURL for included css and Javascript (for IDE)@n
 *        <tt>file:///c:/o2xdl-30/HTML/</tt> @n
 *  - Remote baseURL for included css and Javascript (from web)):@n
 *        <tt>http://www.o2xdl.org/3.0/HTML/</tt>
 *
 * @par Use:
 *    <tt>   &lt;xsl:call-template  name="includedHeader" &gt;@n
 *        &nbsp;&nbsp; &lt;xsl:with-param name="baseURL"&gt; http://www.o2xdl.org/3.0/HTML/ &lt;/xsl:with-param&gt;
 *       &lt;/xsl:call-template &gt;@n </tt>
 *
 * @see xslt_libprintcol_template_02 for standalone HTML.
 *
 */ -->

   <xsl:template name="includedHeader">
      <xsl:param name="baseURL">relative</xsl:param>
      <xsl:if test="$baseURL != 'relative'">
          <base href="{$baseURL}" />
      </xsl:if>
          <!-- uses URL relatives to baseURL (using base tag)-->
      <link href="css/colCode.css"
                      type="text/css"
                      rel="StyleSheet" />
      <script src="include/colCode.js"
                      type="text/javascript" ></script>
   </xsl:template>


 <!--
 /**
 * Formats processing instructions.
 */  -->
    <xsl:template match="processing-instruction()"
                  mode="printCol">
        <div class="e">
            <span class="m">&lt;?</span>
            <span class="pi">
                <xsl:value-of select="name(.)" />
                <xsl:text> </xsl:text>
                <xsl:value-of select="." />
            </span>
            <span class="m">?&gt;</span>
        </div>
    </xsl:template>

<!--
 /**
 * Formats text nodes.
 */ -->
    <xsl:template match="text()"
                  mode="printCol">
        <div class="e">
            <span class="t">
                <xsl:value-of select="." />
            </span>
        </div>
    </xsl:template>
<!--
 /**
 * Formats comment nodes.
 */  -->
    <xsl:template match="comment()"
                  mode="printCol">
        <div class="e">
           <xsl:if test="$status='close'">
            <span>
             <span class="b"
                  onclick="doClick(event)">+</span>
             <span class="m">&lt;!--</span>
            </span>
            <div class="c" style="display:none" >
                <pre><xsl:value-of select="." /></pre>
                <span class="m">--&gt;</span>
             </div>
          </xsl:if>
          <xsl:if test="$status='open'">
           <span>
             <span class="b"
                  onclick="doClick(event)">-</span>
             <span class="m">&lt;!--</span>
           </span>
           <div class="c">
                <pre><xsl:value-of select="." /></pre>
                <span class="m">--&gt;</span>
             </div>
            </xsl:if>
          
        </div>
    </xsl:template>
<!--
 /**
 * Formats attributes.
 * Added 'pre' only to documentation attribute.
 */  -->
    <xsl:template match="@*"
                  mode="printCol">
        <span class="an">
            <xsl:value-of select="name(.)" />
        </span>
        <span class="m">="</span>
        <span class="av">
		    <xsl:if test="'description'= name(.)">
                <i><pre><xsl:value-of select="." /></pre></i>
		    </xsl:if>
		    <xsl:if test="'description'!= name(.)">
                <xsl:value-of select="." />
		    </xsl:if>
        </span>
        <span class="m">"</span>
        <xsl:if test="position()!=last()">
            <xsl:text> </xsl:text>
        </xsl:if>
    </xsl:template>
     <!-- match empty elements -->
 <!--
 /**
 * Formats empty nodes.
 *
 */ -->
    <xsl:template match="*[not(node())]"
                  mode="printCol">
        <div class="e">
            <span class="m">&lt;</span>
            <span class="en">
                <xsl:value-of select="name(.)" />
            </span>
            <xsl:if test="@*">
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:apply-templates select="@*"
                                 mode="printCol" />
            <xsl:apply-templates select="."
                                 mode="namespace" />
            <span class="m">/&gt;</span>
        </div>
    </xsl:template>
     <!-- match elements with only text(), they are not closeable -->
  <!--
/**
 * Formats elements with only text(), they are not closeable.
 * Added 'pre' only to documentation elements.
 *
 */  -->
    <xsl:template match="*[text() and not(./*)]"
                  mode="printCol">
        <div class="e">
            <span class="m">&lt;</span>
            <span class="en">
                 <xsl:value-of select="name(.)" />
            </span>
            <xsl:if test="@*">
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:apply-templates select="@*"
                                 mode="printCol" />
            <xsl:apply-templates select="."
                                 mode="namespace" />
            <span class="m">
                <xsl:text>&gt;</xsl:text>
            </span>
            <span class="t">
			   <xsl:if test="name(.)='description'">
                 <i><pre><xsl:value-of select="." /></pre></i>
		      </xsl:if>
		      <xsl:if test="not(name(.)='description')">
                  <xsl:value-of select="." />
		      </xsl:if>
            </span>
            <span class="m">&lt;/</span>
            <span class="en">
                <xsl:value-of select="name(.)" />
            </span>
            <span class="m">
                <xsl:text>&gt;</xsl:text>
            </span>
        </div>
    </xsl:template>
 <!--
 /**
 * Formats not empty nodes.
 *
 */  -->
    <xsl:template match="*[*]"
                  mode="printCol">
        <div class="e">
            <div>
                <xsl:if test="$status='close'">
                   <span class="b"
                      onclick="doClick(event)">+</span>
                </xsl:if>
                <xsl:if test="$status='open'">
                   <span class="b"
                      onclick="doClick(event)">-</span>
                </xsl:if>
                <span class="m">&lt;</span>
                <span class="en">
                     <xsl:value-of select="name(.)" />
                </span>
                <xsl:if test="@*">
                    <xsl:text> </xsl:text>
                </xsl:if>
                <xsl:apply-templates select="@*"
                                     mode="printCol" />
                <xsl:apply-templates select="."
                                     mode="namespace" />
                <span class="m">
                    <xsl:text>&gt;</xsl:text>
                </span>
            </div>
            <xsl:if test="$status='open'">
              <div style="display:block">
              <!-- children nodes processing -->
                  <xsl:apply-templates mode="printCol" />
                  <div>
                      <span class="m">&lt;/</span>
                      <span class="en">
                          <xsl:value-of select="name(.)" />
                      </span>
                      <span class="m">
                          <xsl:text>&gt;</xsl:text>
                      </span>
                  </div>
              </div>
            </xsl:if>
           <xsl:if test="$status='close'">
              <div style="display:none">
              <!-- children nodes processing -->
                  <xsl:apply-templates mode="printCol" />
                  <div>
                      <span class="m">&lt;/</span>
                      <span class="en">
                          <xsl:value-of select="name(.)" />
                      </span>
                      <span class="m">
                          <xsl:text>&gt;</xsl:text>
                      </span>
                  </div>
              </div>
            </xsl:if>
 
        </div>
    </xsl:template>
   <!--
 /**
 * Formats namespaces.
 *
 */  -->
    <xsl:template match="*"
                  mode="namespace">
        <xsl:variable name="context"
                      select="." />
        <xsl:for-each select="namespace::node()">
            <xsl:variable name="nsuri"
                          select="." />
            <xsl:variable name="nsprefix"
                          select="name()" />
            <xsl:choose>
                <xsl:when test="$nsprefix = 'xml'">
                     <!-- skip: xml namespace -->
                </xsl:when>
                <xsl:when test="$context/../namespace::node()[name() = $nsprefix and . = $nsuri]">
                    <!-- skip: namespace already declared on the parent -->
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text> </xsl:text>
                    <span class="an">
                        <xsl:text>xmlns</xsl:text>
                        <xsl:if test="$nsprefix">
                            <xsl:text>:</xsl:text>
                            <xsl:value-of select="$nsprefix" />
                        </xsl:if>
                    </span>
                    <span class="m">="</span>
                    <span class="av">
                        <xsl:value-of select="." />
                    </span>
                    <span class="m">"</span>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

 <!--
 /**
 * This catchs errors.
 * for debug only.
 */  -->
   <xsl:template match="*"
                  mode="printCol">
          <xsl:comment> using ERROR template for <xsl:value-of select="name(.)" />=<xsl:value-of select="." /></xsl:comment>

   </xsl:template>

 </xsl:stylesheet>
