<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" omit-xml-declaration='no' indent="yes"/>
    <!--
/** @file
 *  @brief Transforms an exported MD file into a xml file (import).
 * @post
 *    The output is like a SyMenu tree,  but all items are with partial information: only 'name', 'description' and 'guid'. 
 *    After this step, and the optional filter MDE.clean_hashtag.rgx, is required the SAXON transformation MDE.merge_menu.xslt.@n
 *    In case of malformed MD can help the informative 'Catch-all' template.
 */ -->
    <!--
/** @file
 * @version 18/12/2021 for MDEchange.
 * @author Copyright 2021 Marco Sillano.
 */ -->
    <!--
 /**
 *  start template.
 */ -->
    <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    <!--
 /**
 *  skips body.
 */ -->
    <xsl:template match="/*">
        <xsl:apply-templates select="body/*"/>
    </xsl:template>
    <!--
  /**
 *  processes SyRoot node
 */ -->
    <xsl:template match="h1[.='SyRoot']" priority='5'>
        <SyRoot>
            <xsl:apply-templates select="following-sibling::*[name()='blockquote'][1]/*"/>
        </SyRoot>
    </xsl:template>
    <!--
  /**
 *  processes flatList node
 */ -->
    <xsl:template match="h1[.='flatList']">
        <flatList>
            <xsl:apply-templates select="following-sibling::*[name()='blockquote'][1]/*"/>
        </flatList>
    </xsl:template>
    <!--
  /**
 *  for this until xslt_mde_template_10 the default is kill:
 */ -->
    <xsl:template match="CR"/>
    <xsl:template match="img"/>
    <xsl:template match="blockquote"/>
    <!--- kill title -->
    <xsl:template match="/*/body/h2"/>
    <!--- kill vanilla hr -->
    <xsl:template match="hr[not(@*)]"/>
    <!--
  /**
 *  kill 'p' tags, already processed by SyContainer processing
 */ -->
   <xsl:template match="p"/>
    <!--
  /**
 *  Copy comment
 */ -->
    <xsl:template match="comment()">
        <xsl:copy/>
    </xsl:template>
    <!--
  /**
 *  SySeparator process
 */ -->
    <xsl:template match="hr[@class='syseparator']">
        <SySeparator name="{following-sibling::p[1]}"/>
    </xsl:template>
    <!--
  /**
 *  SyLabel process
 */ -->
    <xsl:template match="p[label]">
        <SyLabel name="{./label}"/>
    </xsl:template>
    <!--
  /**
 * process all items
 */ -->
    <xsl:template match="p[dfn]">
        <xsl:element name="{./dfn/@type}">
            <name>
                <xsl:value-of select="./dfn"/>
            </name>
            <description>
                <!--
  <xsl:value-of select="./em" disable-output-escaping="yes" />
  -->
                <xsl:value-of select="./em"/>
            </description>
            <guid>
                <xsl:value-of select="./dfn/@id"/>
            </guid>
        </xsl:element>
    </xsl:template>
    <!--
  /**
 *  Special process for SyContainer sibling/child: ( mode="sycontainer")
 *  Found a new SyContaner: 
 *  - nothing to do, end sibling/child: processing.
 */ -->
    <xsl:template match="h1|h2|h3|h4|h5|h6|H1|H2|H3|H4|H5|H6" mode="sycontainer"/>
    <!--
  /**
 *  Special process for SyContainer sibling/child: ( mode="sycontainer")
 *   - add documentation to current container.
 *   - extra "p" tags causes warning message on log.
 *   - apply to following-sibling.
 */ -->
    <xsl:template match="p" mode="sycontainer">
        <xsl:choose>
            <xsl:when test="./em">
                <xsl:attribute name="description">
                    <xsl:value-of select="./em" disable-output-escaping="yes" />
                </xsl:attribute>
                <xsl:apply-templates select="following-sibling::*[1]" mode="sycontainer"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:message terminate="no">
                    <xsl:text>STEP 4 *** WARNING: Maybe malformed MD ? Found unexpected tag "p"</xsl:text>
                    <xsl:text> with the value: </xsl:text>
                    <xsl:value-of select="."/>
                </xsl:message>
                <xsl:apply-templates select="following-sibling::*[1]" mode="sycontainer"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--
  /**
 *  Special process for SyContainer sibling/child: ( mode="sycontainer")
 *   - A blockquote can contain items: process
 *   - done: do not apply to following-sibling (only zero/one blockquote for Sycontainer).
 */ -->
    <!-- SyContainer processing: content -->
    <xsl:template match="blockquote" mode="sycontainer">
        <xsl:apply-templates select="*"/>
    </xsl:template>
    <!--
   /**
 *  Special process for SyContainer sibling/child: ( mode="sycontainer")
 *   - Copy comment
 *   - apply to following-sibling.
 */ -->
    <xsl:template match="comment()" mode="sycontainer">
        <xsl:copy>.</xsl:copy>
        <xsl:apply-templates select="following-sibling::*[1]" mode="sycontainer"/>
    </xsl:template>
    <!-- SyContainer processing: comment 'b' type: nothing to do, because already filtered by regexfilter -->
    <!-- <xsl:template match="p" mode="sycontainer">
        <xsl:if test="starts-with(.,'&lt;!-')">
            <xsl:apply-templates select="following-sibling::*[1]" mode="sycontainer"/>
        </xsl:if>
    </xsl:template> -->
    <!--
  /**
 *  SyContainer process
 * A container can have 0...N following-sibling/child:  requires ad hoc process
 */ -->
    <xsl:template match="h1|h2|h3|h4|h5|h6|H1|H2|H3|H4|H5|H6">
        <SyContainer name="{.}">
            <xsl:apply-templates select="following-sibling::*[1]" mode="sycontainer"/>
        </SyContainer>
    </xsl:template>
    <!--
 /**
 *  Catch-all template
 *  Terminate and send log message in case of error.
 */ -->
    <xsl:template match="*">
        <xsl:message terminate="yes">
            <xsl:text>STEP 4 *** ERROR: Maybe malformed MD ? Template 'catch all' for the tag: "</xsl:text>
            <xsl:value-of select="name(.)"/>
            <xsl:text>" with the value: </xsl:text>
            <xsl:value-of select="."/>
        </xsl:message>
        <xsl:text>
        </xsl:text>
    </xsl:template>
</xsl:stylesheet>
