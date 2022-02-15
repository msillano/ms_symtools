<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- two external files: the old and the new. note: %TMP% = "C:\Users\User\AppData\Local\Temp" -->
    <xsl:param name="oldfile">SyMenuItem8.xml</xsl:param>
    <xsl:param name="newfile">SyMenuPart.xml</xsl:param>
    <xsl:param name="HASHTAG">USER</xsl:param>
    <xsl:param name="VERBOSE">YES</xsl:param>
    <!-- locals -->
    <xsl:variable name="update" select="document($newfile)"/>
    <xsl:variable name="original" select="document($oldfile)"/>
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <!--
/** @file
 *  @brief Smart merge the new XML file with the old SyMenu tree: all items are updated (import).
 *  @details
 *   This transformation for MDEchange makes a smart merge:
 *   - If 'newfile' root is  'SyRoot', it is a full tree, so it uses 'newfile', and updates only the Items from 'oldfile' using 'guid' as key.
 *   - Otherwise updates 'oldfile' from Items in 'newfile'.
 *   - When the same branch is present in both 'newfile' and 'oldfile', the 'newfile' wins.
 *
 *    After merge step, is required one more transformation, MDE.add_orphans.xslt.
 *
 * @post
 *    The output is a valid symenuitem.xml file. 
 *    Requires update to add orphans (see MDE.add_orphans.xslt).
 */ -->
    <!--
 /**
 * @var Param oldfile
 * @details
 *  The path to SyMenuItem.xml, the original menu
 *
 * @var Param newfile
 * @details
 *  The path of the output XML file produced by MDE.convert_md_to_xml.xslt.
*/ -->
    <!--
/** @file
 * @version 18/12/2021 for MDEchange.
 * @author Copyright 2021 Marco Sillano.
 */ -->
    <!--
 /**
 *  main template.
 *  It tests the root node and sets the start 'mode'.
 *  The 'mode' controls the Items source:
 *    - 'update': the source is the new tree
 *    - 'original': the source is the old tree.
 *  'mode' can change only on SyContainer: 
  * 'mode' rule: If the same branch exists in both 'new' and 'old', the 'mode' is 'update' for that branch.
 */ -->
    <xsl:template match="/">
        <SyRoot>
            <xsl:if test="$update/SyRoot">
                <xsl:if test="$VERBOSE = 'YES'">
                    <xsl:comment>
                        <xsl:text>Update root is SyRoot, source:update</xsl:text>
                    </xsl:comment>
                </xsl:if>
                <xsl:apply-templates select="$update/SyRoot/*" mode='update'>
                    <xsl:with-param name="path">SyMenu</xsl:with-param>
                </xsl:apply-templates>
            </xsl:if>
            <xsl:if test="not($update/SyRoot)">
                <xsl:if test="$VERBOSE = 'YES'">
                    <xsl:comment>
                        <xsl:text>Update root is not SyRoot, source:original</xsl:text>
                    </xsl:comment>
                </xsl:if>
                <xsl:apply-templates select="$original/SyRoot/*" mode='original'>
                    <xsl:with-param name="path">SyMenu</xsl:with-param>
                </xsl:apply-templates>
            </xsl:if>
        </SyRoot>
        <xsl:if test="$VERBOSE = 'YES'">
            <xsl:comment>
                <xsl:text disable-output-escaping="yes">&#xA;by MD2SyMenuImport.merge_menu v. 2.1 (beta)</xsl:text>
                <xsl:text disable-output-escaping="yes">   ©2021 Marco Sillano &#xA;</xsl:text>
                <xsl:value-of select="concat('Run options (hashtag: ',$HASHTAG, ', verbose: ',$VERBOSE,')&#xA;')" disable-output-escaping="yes"/>
            </xsl:comment>
        </xsl:if>
    </xsl:template>
    <!--
/**
 *  Format the description, adding HASHTAG as required.
 *  newTag = 'none' for Containers (no tag)
 */ -->
    <xsl:template name="formatdescription">
        <xsl:param name="olddoc"/>
        <xsl:param name="newtag"/>
        <xsl:choose>
            <xsl:when test="string-length($olddoc) &gt; 5">
                <xsl:value-of select="$olddoc" disable-output-escaping="yes" />
                <xsl:if test="($HASHTAG ='AUTO') and ($newtag !='none')">
                    <xsl:value-of select="concat('&#xD;&#xA;#',$newtag)"/>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:if test="($HASHTAG ='AUTO') and ($newtag !='none')">
                    <xsl:value-of select="concat('#',$newtag)"/>
                </xsl:if>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!-- 
    /**
     * SyContainer process and test for switch mode.
     * The key is the name. From original copies attributes
     */     -->
    <xsl:template match="SyContainer" mode='original'>
        <xsl:param name="path"/>
        <xsl:variable name="cname" select="./@name"/>
        <xsl:variable name="newitem" select="$update//SyContainer[@name=$cname]"/>
        <SyContainer>
            <xsl:attribute name="name">
                <xsl:value-of select="$cname"/>
            </xsl:attribute>
            <xsl:attribute name="defaultIcon">
                <xsl:value-of select="10"/>
            </xsl:attribute>
            <xsl:copy-of select="./@icon"/>
            <xsl:copy-of select="./@separateLauncher"/>
            <xsl:if test="$newitem">
                <xsl:attribute name="description">
                    <xsl:call-template name="formatdescription">
                        <xsl:with-param name="olddoc">
                            <xsl:value-of select="$newitem/@description"  disable-output-escaping="yes" />
                        </xsl:with-param>
                        <xsl:with-param name="newtag">none</xsl:with-param>
                    </xsl:call-template>
                </xsl:attribute>
                <xsl:if test="$VERBOSE = 'YES'">
                    <xsl:text>&#xA;</xsl:text>
                    <xsl:comment>
                        <xsl:text>SyContainer from original, found in update:updated. source:update</xsl:text>
                    </xsl:comment>
                </xsl:if>
                <xsl:apply-templates select="$newitem/node()" mode='update'>
                    <xsl:with-param name="path">
                        <xsl:value-of select="concat($path,'.',$cname)"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </xsl:if>
            <xsl:if test="not($newitem)">
                <xsl:attribute name="description">
                    <xsl:call-template name="formatdescription">
                        <xsl:with-param name="olddoc">
                            <xsl:value-of select="./@description" disable-output-escaping="yes" />
                        </xsl:with-param>
                        <xsl:with-param name="newtag">none</xsl:with-param>
                    </xsl:call-template>
                </xsl:attribute>
                <xsl:if test="$VERBOSE = 'YES'">
                    <xsl:text>&#xA;</xsl:text>
                    <xsl:comment>
                        <xsl:text>SyContainer from original not in update:copy. source:original</xsl:text>
                    </xsl:comment>
                </xsl:if>
                <xsl:apply-templates select="node()" mode='original'>
                    <xsl:with-param name="path">
                        <xsl:value-of select="concat($path,'.',$cname)"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </xsl:if>
        </SyContainer>
    </xsl:template>
    <!--
    /**
     * Only SyContainer process and test for switch mode.
     * The key is the name. From update, copies attributes
     */     -->
    <xsl:template match="SyContainer" mode='update'>
        <xsl:param name="path"/>
        <xsl:variable name="cname" select="./@name"/>
        <xsl:variable name="olditem" select="$original//SyContainer[@name=$cname]"/>
        <SyContainer>
            <xsl:attribute name="name">
                <xsl:value-of select="$cname"/>
            </xsl:attribute>
            <xsl:attribute name="defaultIcon">
                <xsl:value-of select="10"/>
            </xsl:attribute>
            <xsl:attribute name="description">
                <xsl:call-template name="formatdescription">
                    <xsl:with-param name="olddoc">
                        <xsl:value-of select="./@description" disable-output-escaping="yes" />
                    </xsl:with-param>
                    <xsl:with-param name="newtag">none</xsl:with-param>
                </xsl:call-template>
            </xsl:attribute>
            <xsl:if test="$olditem">
                <xsl:copy-of select="$olditem/@icon"/>
                <xsl:copy-of select="$olditem/@separateLauncher"/>
                <xsl:if test="$VERBOSE = 'YES'">
                    <xsl:text>&#xA;</xsl:text>
                    <xsl:comment>
                        <xsl:text>SyContainer from update, found in original:updated. source:update</xsl:text>
                    </xsl:comment>
                </xsl:if>
                <xsl:apply-templates select="node()" mode='update'>
                    <xsl:with-param name="path">
                        <xsl:value-of select="concat($path,'.',$cname)"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </xsl:if>
            <xsl:if test="not($olditem)">
                <xsl:if test="$VERBOSE = 'YES'">
                    <xsl:text>&#xA;</xsl:text>
                    <xsl:comment>
                        <xsl:text>SyContainer from update, not found in original:new. source:update</xsl:text>
                    </xsl:comment>
                </xsl:if>
                <xsl:apply-templates select="node()" mode='update'>
                    <xsl:with-param name="path">
                        <xsl:value-of select="concat($path,'.',$cname)"/>
                    </xsl:with-param>
                </xsl:apply-templates>
            </xsl:if>
        </SyContainer>
    </xsl:template>
    <!--
    /**
     * All Items process.
     * The key is guid. From original, copies from original, optional update.
     */     -->
    <xsl:template match="*[guid]" mode='original'>
        <xsl:param name="path"/>
        <xsl:variable name="thisguid" select="./guid"/>
        <xsl:variable name="newitem" select="$update//guid[.=$thisguid]/parent::node()"/>
        <xsl:if test="$newitem">
            <xsl:element name="{name(.)}">
			    <xsl:copy-of select="./@*"/>
                <xsl:copy-of select="$newitem/name"/>
                <xsl:element name="description">
                    <xsl:call-template name="formatdescription">
                        <xsl:with-param name="olddoc">
                            <xsl:value-of select="$newitem/description" disable-output-escaping="yes" />
                        </xsl:with-param>
                        <xsl:with-param name="newtag">
                            <xsl:value-of select="concat($path,'.', count(preceding-sibling::*[guid])+1 )"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:element>
                <xsl:copy-of select="./*[not(self::name)][not(self::description)]"/>
            </xsl:element>
            <xsl:if test="$VERBOSE = 'YES'">
                <xsl:comment>
                    <xsl:text>Item from original,  found in update:update   source:original</xsl:text>
                </xsl:comment>
            </xsl:if>
        </xsl:if>
        <xsl:if test="not($newitem)">
            <xsl:element name="{name(.)}">
 			    <xsl:copy-of select="./@*"/>
                <xsl:element name="description">
                    <xsl:call-template name="formatdescription">
                        <xsl:with-param name="olddoc">
                            <xsl:value-of select="./description"  disable-output-escaping="yes"/>
                        </xsl:with-param>
                        <xsl:with-param name="newtag">
                            <xsl:value-of select="concat($path,'.', count(preceding-sibling::*[guid])+1 )"/>
                        </xsl:with-param>
                    </xsl:call-template>
                </xsl:element>
                <xsl:copy-of select="./*[not(self::description)]"/>
            </xsl:element>
            <xsl:if test="$VERBOSE = 'YES'">
                <xsl:comment>
                    <xsl:text>Item  from original,   not in update:copy.    source:original</xsl:text>
                </xsl:comment>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    <!--
    /**
     * All Items process.
     * The key is guid. From update, copies some attributes from original.
     */     -->
    <xsl:template match="*[guid]" mode='update'>
        <xsl:param name="path"/>
        <xsl:variable name="thisguid" select="./guid"/>
        <xsl:variable name="olditem" select="$original//guid[.=$thisguid]/.."/>
        <!--     <xsl:variable name="olditem" select="key('originalbyguid', $thisguid )"/>  -->
        <xsl:element name="{name(.)}">
		     <xsl:copy-of select="$olditem/@*"/>
             <xsl:element name="description">
                <xsl:call-template name="formatdescription">
                    <xsl:with-param name="olddoc">
                        <xsl:value-of select="./description" disable-output-escaping="yes"/>
                    </xsl:with-param>
                    <xsl:with-param name="newtag">
                        <xsl:value-of select="concat($path,'.', count(preceding-sibling::*[guid])+1 )"/>
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:element>
            <xsl:if test="$olditem">
                <xsl:copy-of select="name"/>
                <xsl:copy-of select="$olditem/*[not(self::name)][not(self::description)]"/>
                <xsl:if test="$VERBOSE = 'YES'">
                    <xsl:comment>
                        <xsl:text>Item from update, found in original:updated  source:update</xsl:text>
                    </xsl:comment>
                </xsl:if>
            </xsl:if>
            <xsl:if test="not($olditem)">
                <xsl:element name="path">.</xsl:element>
                <xsl:element name="name">
                    <xsl:value-of select="concat('FAKE: ', name)"/>
                </xsl:element>
                <xsl:if test="$VERBOSE = 'YES'">
                    <xsl:comment>
                        <xsl:text>FAKE: Item from update, not found in original: new item! source:update</xsl:text>
                    </xsl:comment>
                </xsl:if>
            </xsl:if>
        </xsl:element>
    </xsl:template>
    <!--
     /**
     *  generic 'original' copy
     */     -->
    <xsl:template match="@*|node()" mode='original'>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode='original'/>
        </xsl:copy>
    </xsl:template>
    <!--
     /**
     *  generic 'update' copy
     */     -->
    <xsl:template match="@*|node()" mode='update'>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode='update'/>
        </xsl:copy>
    </xsl:template>
    <!--   
 /**
 *  Catch-all template
 *  in case of error.
 */ -->
    <xsl:template match="*">
        <xsl:message terminate="no">
            <xsl:text> WARNING: using 'catch all' template for: </xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text>
        </xsl:text>
        </xsl:message>
    </xsl:template>
</xsl:stylesheet>
