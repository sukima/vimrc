<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output method="xml" indent="yes" omit-xml-declaration="yes"
		media-type="application/xhtml+xml" encoding="iso-8859-1"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="/title"/></title>
				<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1"/>
				<meta http-equiv="Content-Language" content="en-us"/>
				<!-- <link href="site.css" rel="StyleSheet" type="text/css" media="screen"/> -->
			</head>

			<body>
				<xsl:apply-templates/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
<!-- Modeline for ViM {{{
vim:set ts=4:
vim600:fdm=marker fdl=0 fdc=3:
}}} -->
