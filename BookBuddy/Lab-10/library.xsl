<!-- XSLT Transformation -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
        <body>
            <h2>Library Books</h2>
            <table border="1">
                <tr>
                    <th>Title</th>
                    <th>Author</th>
                    <th>ISBN</th>
                    <th>Year</th>
                    <th>Genre</th>
                </tr>
                <xsl:for-each select="Library/Book">
                    <tr>
                        <td><xsl:value-of select="Title"/></td>
                        <td><xsl:value-of select="Author"/></td>
                        <td><xsl:value-of select="ISBN"/></td>
                        <td><xsl:value-of select="Year"/></td>
                        <td><xsl:value-of select="Genre"/></td>
                    </tr>
                </xsl:for-each>
            </table>
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
