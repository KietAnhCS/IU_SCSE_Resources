<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <body>
  <h2>List of Books</h2>
    <table border="1">
      <tr bgcolor="#9acd32">
        <th>ISBN-10</th>
        <th>TITLE</th>
        <th>AUTHOR</th>
        <th>PUBLISHER</th>
        <th>DATE</th>
        <th>PRICE</th>
      </tr>
      <xsl:for-each select="books/book">
      <tr>
        <td><xsl:value-of select="isbn-10"/></td>
        <td><xsl:value-of select="title"/></td>
        <td><xsl:value-of select="author"/></td>
        <td><xsl:value-of select="publisher"/></td>
        <td><xsl:value-of select="publication-date"/></td>
        <td><xsl:value-of select="price"/></td>
      </tr>
      </xsl:for-each>
    </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>