<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <!-- two external files: the old and the new. note: %TMP% = "C:\Users\User\AppData\Local\Temp" -->
    <xsl:param name="VERBOSE">YES</xsl:param>
    <xsl:param name="HASHTAG">USER</xsl:param>
    <xsl:param name="oldfile">SyMenuItem.xml</xsl:param>
    <xsl:param name="newfile">SyMenuMerged.xml</xsl:param>
    <xsl:param name="today">2022-01-01</xsl:param>
    <!-- locals -->
    <xsl:variable name="original" select="document($oldfile)"/>
    <xsl:variable name="update" select="document($newfile)"/>
    <xsl:output method="xml" encoding="UTF-8" indent="yes" omit-xml-declaration="yes"/>
    <!--
/** @file
 *  @brief Adds to the new menu the missed items (orphans) from the SyMenu configuration file (import).
 *  @details
 *   This transformation requires the <code>MDE.empty.xml</code> file to start the process (XSLT 1).
 *   If required, append to  <code>newfile</code> a new SyContainer with all orphans items.
 *
 * @post
 *    The output is a valid symenuitem.xml file (with some SAXON quirks, it requires cleanup with 'regexfilter' and MDE.import_xml.rgx ) 
 */ -->
    <!--
 /*
 * @var Param oldfile
 * @details
 *  The path of SyMenuItem.xml, the original SyMenu configuration.
 *
 * @var Param newfile
 * @details
 *  The path of the output XML file produced by MDE.merge_menu.xslt.
 */ -->
    <!--
/** @file
 * @version 18/12/2021 for MDEchange.
 * @author Copyright 2021 Marco Sillano.
 */ -->
    <!--
 /**
 *  main template.
 *  1. Copy  <code>newfile</code> to output.
 *  2. If orphans are present:
 *     - Creates the 'Orphans' SyContainer
 *     - Add the Oprphans, i.e. all items in <code>oldfile</code> but not in <code>newfile</code>.
 */ -->
    <xsl:template match="/">
        <xsl:variable name="orphanlist">
            <xsl:call-template name="getOphans"/>
        </xsl:variable>
        <SyRoot>
            <xsl:if test="$VERBOSE = 'YES'">
                <xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
                <xsl:comment>
                    <xsl:text disable-output-escaping="yes">&#xD;&#xA;Tree Branches: </xsl:text>
                    <xsl:value-of select="count($update//SyContainer)"/>
                    <xsl:text disable-output-escaping="yes">&#xD;&#xA;  Total Items: </xsl:text>
                    <xsl:value-of select="count($update//*[guid])"/>
                    <xsl:text disable-output-escaping="yes">&#xD;&#xA;           Programs: </xsl:text>
                    <xsl:value-of select="count($update//SyProgramCmd)"/>
                    <xsl:text disable-output-escaping="yes">&#xD;&#xA;       Win commands: </xsl:text>
                    <xsl:value-of select="count($update//SyWinCmd)"/>
                    <xsl:text disable-output-escaping="yes">&#xD;&#xA;          Documents: </xsl:text>
                    <xsl:value-of select="count($update//SyDocument)"/>
                    <xsl:text disable-output-escaping="yes">&#xD;&#xA;         Folder ref: </xsl:text>
                    <xsl:value-of select="count($update//SyFolder)"/>
                    <xsl:text disable-output-escaping="yes">&#xD;&#xA;              Links: </xsl:text>
                    <xsl:value-of select="count($update//SyLink)"/>
                    <xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
                    <xsl:if test="count($orphanlist//guid) &gt; 0">
                        <xsl:text disable-output-escaping="yes">            Orphans: </xsl:text>
                        <xsl:value-of select="count($orphanlist//guid)"/>
                        <xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
                    </xsl:if>
                </xsl:comment>
            </xsl:if>
            <xsl:apply-templates select="$update/SyRoot/*" mode='copy'/>
            <!--  orphan process -->
            <xsl:if test="count($orphanlist//guid) &gt; 0">
                <SyContainer defaultIcon="10" description="Items not in the SyMenu update.&#xD;&#xA;#SyMenu.Orphans.branch">
                    <xsl:attribute name="name">
                        <xsl:text>Orphans </xsl:text>
                        <xsl:value-of select="$today"/>
                    </xsl:attribute>
                    <xsl:if test="$VERBOSE='YES'">
                        <xsl:text disable-output-escaping="yes">&#xD;&#xA;</xsl:text>
                        <xsl:comment>
                            <xsl:text>Auto SyContainer for orphan items, by MD2SyMenuImport.</xsl:text>
                        </xsl:comment>
                    </xsl:if>
                    <xsl:for-each select="$orphanlist/*">
                        <xsl:choose>
                            <xsl:when test="$HASHTAG='AUTO'">
                                <xsl:element name="{name(.)}">
                                    <xsl:element name="description">
                                        <xsl:value-of select="./description"/>
                                        <xsl:value-of select="concat('&#xA;#','SyMenu.Orphans ',$today,'.', position())"/>
                                    </xsl:element>
                                    <xsl:apply-templates  select="./*[not(self::description)]"  mode="copy" />
                                </xsl:element>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:apply-templates select="." mode='copy'/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:if test="$VERBOSE='YES'">
                            <xsl:comment>
                                <xsl:text>Item from original, orphan:copy </xsl:text>
                            </xsl:comment>
                        </xsl:if>
                    </xsl:for-each>
                    
                </SyContainer>
            </xsl:if>
        </SyRoot>
        <xsl:if test="$VERBOSE = 'YES'">
            <xsl:comment>
                <xsl:text disable-output-escaping="yes">&#xA;by MD2SyMenuImport.add_orphans v. 2.1 (beta)</xsl:text>
                <xsl:text disable-output-escaping="yes">   ©2021 Marco Sillano &#xA;</xsl:text>
                <xsl:value-of select="concat('Run options (hashtag: ',$HASHTAG, ', verbose: ',$VERBOSE,')&#xA;')" disable-output-escaping="yes"/>
            </xsl:comment>
        </xsl:if>
    </xsl:template>
    <!--
 /**
 *  Auxiliary template for get the orphan list.
 */ -->
    <xsl:template name="getOphans">
        <xsl:for-each select="$original//*[guid]">
            <xsl:variable name="thisguid" select="guid"/>
            <xsl:if test="not($update//guid[.=$thisguid])">
                <xsl:copy-of select="."/>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    <!--
 /**
 *  null template for comments: if NOT VERBOSE destroy.
 */ -->
    <xsl:template match="comment()[$VERBOSE='NO']" mode='copy'/>
    <!--
 /**
 *  identity template: copy, recursive
 */ -->
    <xsl:template match="@*|node()" mode='copy'>
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode='copy'/>
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
