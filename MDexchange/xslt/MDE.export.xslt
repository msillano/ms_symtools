<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--  HASTAG option, default USER -->
	<xsl:param name="HASHTAG">USER</xsl:param>
	<!-- MODE option, FLAT|TREE|MARK -->
	<xsl:param name="MODE">TREE</xsl:param>
	<xsl:param name="VERBOSE">YES</xsl:param>
	<xsl:param name="timestamp">2021-01-01</xsl:param>
	<xsl:variable name="Q">"</xsl:variable>
	<xsl:output omit-xml-declaration="yes"/>
	<!--
/** @file
 *  @brief Export a MD file from SyMenu configuration file (export).
 *  @details
 *   This transformation for SyMenu generates a complete MD page.
 *
 * @post
 *    The output is valid MD (markdown). Rules in "MD-for-SyMenu.md" file.@n
 *    After this step is required the filter MDE.clean_md.rgx
 *    note: the output is 'text': the format of this XSL file can modify the output! 
 */ -->
	<!--
 /** 
 * @var Param MODE 
 * @details
 *    Controls the MD output style:
 *       - FLAT:  All Items in a list.
 *       - TREE:  The SyMenu tree
 *       - FULL: Complete
 *
 * @var Param HASHTAG 
 * @details
 *    Hastag control:
 *       - NONE: Hashtag not used. Existing hashtags are deleted. So all tooltips are one line shorter.
 *       - USER: Existing hastags are respected, SyMenu and the user handle them.
 *       - AUTO: All hastag are automatically updated, reflecting the item actual position in the menu tree (dot notation). 
 *
 * @var Param VERBOSE 
 * @details
 *     Extra output control (defined in MDexchange.config.bat)
 *       - YES: Add some info as comments
 *       -  NO: Without comments
 */ -->
	<!-- 
/** @file
 * @version 18/12/2021 for MDEchange.
 * @author Copyright 2021 Marco Sillano.
 */ -->
	<!--
 /**
 *  main template. 
 *  It process a XML node and produces the first 3 lines (title) and footer.
 */ -->
	<xsl:template match="/">
		<xsl:value-of select="concat('My SyMenu  &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;',$timestamp)"/>
		<xsl:text disable-output-escaping="yes">&#xA;-----------&#xA;</xsl:text>
		<xsl:if test="$VERBOSE = 'YES'">
			<xsl:comment>
				<xsl:text disable-output-escaping="yes">&#xA;Tree Branches: </xsl:text>
				<xsl:value-of select="count(//SyContainer)"/>
				<xsl:text disable-output-escaping="yes">&#xA;  Total Items: </xsl:text>
				<xsl:value-of select="count(//*[guid])"/>
				<xsl:text disable-output-escaping="yes">&#xA;           Programs: </xsl:text>
				<xsl:value-of select="count(//SyProgramCmd)"/>
				<xsl:text disable-output-escaping="yes">&#xA;       Win commands: </xsl:text>
				<xsl:value-of select="count(//SyWinCmd)"/>
				<xsl:text disable-output-escaping="yes">&#xA;          Documents: </xsl:text>
				<xsl:value-of select="count(//SyDocument)"/>
				<xsl:text disable-output-escaping="yes">&#xA;         Folder ref: </xsl:text>
				<xsl:value-of select="count(//SyFolder)"/>
				<xsl:text disable-output-escaping="yes">&#xA;              Links: </xsl:text>
				<xsl:value-of select="count(//SyLink)"/>
				<xsl:text disable-output-escaping="yes">&#xA;</xsl:text>
			</xsl:comment>
		</xsl:if>
		<xsl:text disable-output-escaping="yes">&#xA;-----------------------------&#xA;</xsl:text>
		<xsl:apply-templates/>
		<xsl:text disable-output-escaping="yes">&#xA;-----------------------------&#xA;</xsl:text>
		<xsl:text disable-output-escaping="yes">by SyMenu2MDexport.export v. 2.2 (beta)</xsl:text>
		<xsl:text disable-output-escaping="yes">&#160;&#160;&#160;&#160;&#160;©2021 Marco Sillano &#xA;</xsl:text>
		<xsl:if test="$VERBOSE = 'YES'">
			<xsl:comment>
				<xsl:value-of select="concat('&#xA;Run options (mode: ',$MODE,', hashtag: ',$HASHTAG, ', verbose: ',$VERBOSE,')&#xA;')" disable-output-escaping="yes"/>
			</xsl:comment>
		</xsl:if>
	</xsl:template>
	<!--
 /**
 *  root template. 
 *  Initializes the internal params: <TT>deep</TT> and <tt>path</tt>
 */ -->
	<xsl:template match="SyRoot">
		<xsl:choose>
			<xsl:when test="$MODE = 'FLAT'">
				<xsl:text disable-output-escaping="yes">&#xA;#flatList&#xA;</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text disable-output-escaping="yes">&#xA;#SyRoot&#xA;</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:apply-templates>
			<xsl:with-param name="deep">1</xsl:with-param>
			<xsl:with-param name="path">SyMenu</xsl:with-param>
		</xsl:apply-templates>
	</xsl:template>
	<!--
 /**
 *  Separator processing:
 *  childless leaf.
 */ -->
	<xsl:template match="SySeparator">
		<xsl:param name="path"/>
		<xsl:param name="deep"/>
		<xsl:if test="($MODE = 'FULL') or ($MODE = 'TREE')">
			<xsl:value-of select="concat('&#xA;',substring('>>>>>>', 7 - $deep),'&lt;hr class=',$Q, 'syseparator',$Q,' /&gt;&#xA;')" disable-output-escaping="yes"/>
			<xsl:value-of select="concat('*',@name,'*' )" disable-output-escaping="no"/>
		</xsl:if>
	</xsl:template>
	<!--
 /**
 *  Label processing:
 *  childless leaf.
 */ -->
	<xsl:template match="SyLabel">
		<xsl:param name="path"/>
		<xsl:param name="deep"/>
		<xsl:if test="($MODE = 'FULL') or ($MODE = 'TREE')">
			<xsl:value-of select="concat('&#xA;',substring('>>>>>>', 7 - $deep),'&lt;label&gt;')" disable-output-escaping="yes"/>
			<xsl:value-of select="@name" disable-output-escaping="no"/>
			<xsl:value-of select="'&lt;/label&gt;'" disable-output-escaping="yes"/>
		</xsl:if>
	</xsl:template>
	<!--
 /**
 *  Container processing:
 *  recursive. @n
 *  - The  parameters MODE and HASHTAG control the output structure
 *  - The  parameter VERBOSE controls the output of extra comment. 
 */ -->
	<xsl:template match="SyContainer">
		<xsl:param name="path"/>
		<xsl:param name="deep"/>
		<xsl:if test="$VERBOSE = 'YES'">
			<xsl:value-of select="concat('&#xA;',substring('>>>>>>', 7 - $deep))" disable-output-escaping="yes"/>
			<xsl:comment>
				<xsl:text> === START BRANCH "</xsl:text>
				<xsl:value-of select="@name"/>" </xsl:comment>
		</xsl:if>
		<xsl:if test="$MODE = 'FLAT'">
			<xsl:apply-templates>
				<xsl:with-param name="deep">1</xsl:with-param>
				<xsl:with-param name="path">
					<xsl:value-of select="concat($path,'.',@name)"/>
				</xsl:with-param>
			</xsl:apply-templates>
		</xsl:if>
		<xsl:if test="not($MODE = 'FLAT')">
			<xsl:value-of select="concat('&#xA;',substring('>>>>>>', 7 - $deep), substring('#######', 7 - $deep))" disable-output-escaping="yes"/>
			<xsl:value-of select="@name"/>
			<!--  NO Hastag for Containers
			<xsl:if test="(string-length(@description) &gt; 1) and ($HASHTAG = 'AUTO')">
				<xsl:text>&#xA;*</xsl:text>
				<xsl:value-of select="@description" disable-output-escaping="yes"/>
				<xsl:text>&#xA;\#</xsl:text>
				<xsl:value-of select="concat($path,'.branch.', count(preceding-sibling::*[@defaultIcon])+1 )" disable-output-escaping="yes"/>
				<xsl:text>*</xsl:text>
			</xsl:if>
			
			<xsl:if test="(string-length(@description) &gt; 1) and not($HASHTAG = 'AUTO')">
				<xsl:text>&#xA;*</xsl:text>
				<xsl:value-of select="@description" disable-output-escaping="yes"/>
				<xsl:text>*</xsl:text>
			</xsl:if>
			<xsl:if test="not(string-length(@description) &gt; 1) and ($HASHTAG = 'AUTO')">
				<xsl:text>&#xA;*\#</xsl:text>
				<xsl:value-of select="concat($path,'.branch.', count(preceding-sibling::*[@defaultIcon])+1 )" disable-output-escaping="yes"/>
				<xsl:text>*</xsl:text>
			</xsl:if>
			-->
			<xsl:if test="string-length(@description) &gt; 1">
				<xsl:text>&#xA;*</xsl:text>
				<xsl:value-of select="@description" disable-output-escaping="yes"/>
				<xsl:text>*</xsl:text>
			</xsl:if>
			<xsl:apply-templates>
				<xsl:with-param name="deep">
					<xsl:value-of select="$deep + 1"/>
				</xsl:with-param>
				<xsl:with-param name="path">
					<xsl:value-of select="concat($path,'.',@name)"/>
				</xsl:with-param>
			</xsl:apply-templates>
			<xsl:if test="count(*) &lt; 1">
				<xsl:text>
        </xsl:text>
			</xsl:if>
		</xsl:if>
		<xsl:if test="$VERBOSE = 'YES'">
			<xsl:value-of select="concat('&#xA;',substring('>>>>>>>', 7 - $deep))" disable-output-escaping="yes"/>
			<xsl:comment>
				<xsl:text> === END BRANCH "</xsl:text>
				<xsl:value-of select="@name"/>" </xsl:comment>
		</xsl:if>
	</xsl:template>
	<!--
 /**
 *  All Items with guid processing.
 *
 *  childless leaf.@n
 *  The MODE, HASHTAG  parameters control some output details.
 */ -->
	<xsl:template match="*[./guid]">
		<xsl:param name="path"/>
		<xsl:param name="deep"/>
		<xsl:if test="not($MODE = 'TREE') ">
			<xsl:value-of select="concat('&#xA;',substring('>>>>>>', 7 - $deep),'&lt;dfn id=&quot;',./guid)" disable-output-escaping="yes"/>
			<xsl:text disable-output-escaping="yes">" type="</xsl:text>
			<xsl:value-of select="name(.)"/>
			<xsl:text disable-output-escaping="yes">"></xsl:text>
			<xsl:value-of select="./name"/>
			<xsl:text disable-output-escaping="yes">&lt;/dfn>&lt;BR /></xsl:text>
			<xsl:if test="(string-length(./description) &gt; 1) and ($HASHTAG = 'AUTO')">
				<xsl:text>&#xA;*</xsl:text>
				<xsl:value-of select="./description" disable-output-escaping="yes"/>
				<xsl:text>&#xA;\#</xsl:text>
				<xsl:value-of select="concat($path,'.', count(preceding-sibling::*[guid])+1 )" disable-output-escaping="yes"/>
				<xsl:text>*</xsl:text>
			</xsl:if>
			<xsl:if test="(string-length(./description) &gt; 1) and not($HASHTAG = 'AUTO')">
				<xsl:text>&#xA;*</xsl:text>
				<xsl:value-of select="./description" disable-output-escaping="yes"/>
				<xsl:text>*</xsl:text>
			</xsl:if>
			<xsl:if test="not(string-length(./description) &gt; 1) and ($HASHTAG = 'AUTO')">
				<xsl:text>&#xA;*\#</xsl:text>
				<xsl:value-of select="concat($path,'.', count(preceding-sibling::*[guid])+1 )" disable-output-escaping="yes"/>
				<xsl:text>*</xsl:text>
			</xsl:if>
		</xsl:if>
	</xsl:template>
	<!--
 /**
 *  Catch all template
 *  in case of error (for development).
 */ -->
	<xsl:template match="*">
		<xsl:message>
			<xsl:text> using 'catch all' template for: </xsl:text>
			<xsl:value-of select="name(.)"/>
			<xsl:text>
        </xsl:text>
		</xsl:message>
	</xsl:template>
</xsl:stylesheet>
