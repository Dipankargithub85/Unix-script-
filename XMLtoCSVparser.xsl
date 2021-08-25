<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text"/>

<xsl:template match="/">
  <xsl:apply-templates select="/log/log-entry"/>
</xsl:template>

<!-- write out comma separated file -->
<xsl:template match="/log/log-entry">
   <xsl:value-of select="translate(date-time, '*\:-;', '')"/><xsl:value-of select="'Z'"/>
   <xsl:value-of select="','"/>
   <xsl:if test="not(@domain)">
            <xsl:value-of select="'default'"/>
            <xsl:value-of select="','"/>
   </xsl:if>
    <xsl:if test="@domain">
            <xsl:value-of select="@domain"/>
            <xsl:value-of select="','"/>
   </xsl:if>
   <xsl:value-of select="type"/>
   <xsl:value-of select="','"/>
   <xsl:value-of select="level"/>
   <xsl:value-of select="','"/>
   <xsl:value-of select="class"/>
   <xsl:value-of select="','"/>
   <xsl:value-of select="object"/>
   <xsl:value-of select="','"/>
   <xsl:value-of select="transaction"/>
   <xsl:value-of select="','"/>
   <xsl:value-of select="client"/>
   <xsl:value-of select="','"/>
   <xsl:value-of select="code"/>
   <xsl:value-of select="','"/>
   <xsl:value-of select="transaction-type"/>
   <xsl:value-of select="','"/>
   <xsl:value-of select="file"/>
   <xsl:value-of select="','"/>
   <xsl:value-of select="message"/>
   <xsl:value-of select="','"/>
   <xsl:value-of select="@serial"/>
   <xsl:text>
</xsl:text>
</xsl:template>
</xsl:stylesheet>
