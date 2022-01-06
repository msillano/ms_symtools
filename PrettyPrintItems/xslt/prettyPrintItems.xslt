<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!-- relative path, for SAXON: from caller path
     note: here the only difference between  local/SAXON   -->
	<xsl:import href="libPrintCol2.xsl"/>
	<!-- Controls HEAD include options, default enbedded (true) -->
	<xsl:param name="INLINE_HEADER">true</xsl:param>
	<!-- XML created tree STATUS: open|close
        replace the value in libPrintCol          -->
	<xsl:param name="STATUS">open</xsl:param>
	<xsl:param name="today">2022-01-01</xsl:param>
	<xsl:output method="html" omit-xml-declaration='yes' indent="yes" encoding="UTF-8" />
	<!--
/** @file
 *  @brief Pretty-prints XML/XHTML files/fragments for prettyPrints Items tool.
 *  @details This XSLT file is a wrapper for the library libPrintCol2.xsl.
 *   This version for SyMenu generates a complete HTML page, accepting the parameters:
 *      - INLINE_HEADER 
 *      - STATUS 
 *      - today
 * @post
 *    The output is valid XHTML 1.1, UTF-8
 * @see
 *    Original used by xslt2doxfilter.java  (filter for Doxygen).
 */ -->
	<!--
 /** 
 * @var Param INLINE_HEADER 
 * @details
 *  Controls the output of tags  &lt;style> and &gt;script> in HTML page:
 *       @li  none:    puts nothing (not used in <i>prettyPrint SyMenu</i>).
 *       @li  true:    tags and full code are included in HEAD (or BODY), to make a stand-alone page (default)
 *       @li  false:   puts in HEAD the relative default includes for local files in  <tt>.\\include</tt>
 *       @li  BaseURL: used for external (local or remote) files anywhere. @n   note: You can use here the files in http://www.o2xdl.org that I put in public domain for users convenience.
 *         
 * @var Param STATUS 
 * @details 
 * Controls the default initial look of the HTML tree
 *    Accepts two walues: 'open'|'close'.
 *
 */ -->
	<!-- 
/** @file
 * @version 04/01/2022 modified for SyMenu, from filters_dox\bin\xslt\nodePrintCol.xsl.
 * @author Copyright 2021 Marco Sillano.
 */ -->
<!--
 /**
 *  main template. 
 *  It process a XML node and produces a HTML fragment htmlonly with the tree.
 */ -->
	<xsl:template match="/">
		<!--     
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt; &#x0D;&#x0A;</xsl:text>
        <xsl:output
            method="html"
            doctype-public="-//W3C//DTD XHTML 1.1//EN"
			doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"
            omit-xml-declaration="yes"
            encoding="UTF-8"
            indent="no" />
			-->
		<html xmlns="http://www.w3.org/1999/xhtml" lang="EN">
			<head>
				<title>My SyMenu tree  </title>
<!-- processing <style> and <script> sections, in all allowed ways -->
				<xsl:choose>
					<xsl:when test="$INLINE_HEADER='none'">
<!-- Case of many calls for the same HTML page: only on first call you must add the includes (not used in prettyPrint SyMenu) -->					
					</xsl:when>				  
					<xsl:when test="$INLINE_HEADER='true'">
<!-- Case enbedded: the full code is included in HEAD or BODY -->					
						<xsl:call-template name="embeddedHeader"/>	      
					</xsl:when>
					<xsl:when test="$INLINE_HEADER='false'">
<!-- Case of standard local relitive files, e.g. in [SyMenu]\ProgramFiles\ms-symtools\result\include -->
   						<xsl:call-template name="includedHeader"/> 
					</xsl:when>
					<xsl:otherwise>
<!-- Case of BaseURL, any local (file:///...) or remote (htpp://...) URL: e.g. http://www.o2xdl.org -->			
					    <xsl:call-template name="includedHeader"> 
							<xsl:with-param name="baseURL" ><xsl:value-of select="$INLINE_HEADER"/>
</xsl:with-param>
				        </xsl:call-template>
					</xsl:otherwise>
			   </xsl:choose>
			   <!-- local CSS for the full page -->
				<style>
				   body {font-size:10pt; font-family: 'DejaVu Sans Mono', 'Courier New', Courier, monospace;}
				   .node {border: 1px solid #CCCCCC; background-color: #f8f8f0;}
		        </style>
			</head>
			<body>
			    <H2><xsl:value-of select="$today"/> &#xa0;&#xa0; SyMenu tree </H2>
				<div class="node">
					<br/>
					<xsl:apply-templates select="." mode="printCol"/>
					<br/>
				</div><br />
				<small>by <b>prettyPrint SyMenu v.2.2 (beta)</b>&#xa0;&#xa0;&#xa0;&#169;2021-2022 <i>Marco Sillano</i></small>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
