<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- relative path, from 'current directory', ie engine class -->
	<xsl:import href="..\..\ms-symtools\xslt\libPrintCol2.xsl"/>
	<!-- Adds headers, caller set true only for first call in a page -->
	<xsl:param name="INLINE_HEADER">true</xsl:param>
	<!-- XML created tree status: open|close
        override value in libPrintCol          -->
	<xsl:param name="status">open</xsl:param>
	<xsl:output method="xml" omit-xml-declaration='yes' indent="yes"/>
	<!--
/** @file
 *  @brief Pretty-prints XML/XHTML files/fragments.
 *  @details This XSLT file completes the library libPrintCol.xsl, for processing XML nodes.
 *  - Puts the required tags &lt;style> and &gt;script> (only if INLINE_HEADER parameter = 'true').
 *  - Initial tree status open or close (status parameter, external)
 *
 * @post
 *    The output is valid XHTML 1.1
 * @param
 *    INLINE_HEADER  adds the required tags &lt;style> and &gt;script> .
 * @param
 *    status  controls the starting tree look.
 * @see
 *    Original used by xslt2doxfilter.java  (filter for Doxygen).
 */ -->
	<!--
 /** 
 * @var INLINE_HEADER 
 * @details Controls the output of tags  &lt;style> and &gt;script>, to make a stand-alone page.
 * @var Param status 
 * @details Controls the default initial look of the XML tree: accepts 'open'|'close'.
 *
 */ -->
	<!-- 
/** @file
 * @version 28/11/2021 modified for SyMenu from filters_dox\bin\xslt\nodePrintCol.xsl.
 * @author Copyright &copy;2021 Marco Sillano.
 */ -->
	<!--
 /**
 *  main template. 
 *  It process a XML node and produces a HTML fragment htmlonly with the tree.
 */ -->
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<!--       <xsl:output
            method="html"
            doctype-public="-//W3C//DTD XHTML 1.1//EN"
			doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
            omit-xml-declaration="yes"
            encoding="UTF-8"
            indent="no" />
			-->
		<html xmlns="http://www.w3.org/1999/xhtml" lang="EN">
			<head>
				<title>My SyMenu tree</title>
				<xsl:if test="$INLINE_HEADER='true'">
					<xsl:call-template name="embeddedHeader"/>
				</xsl:if>
				<style>
				          body {font-size:10pt; font-family: 'DejaVu Sans Mono', 'Courier New', Courier, monospace;}
				         .node {style="border: 1px solid #CCCCCC; background-color: #f8f8f8;}
		        </style>
			</head>
			<body>
				<div class="node">
					<br/>
					<xsl:apply-templates select="." mode="printCol"/>
					<br/>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
