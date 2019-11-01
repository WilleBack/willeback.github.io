<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/catalog">
	<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<style>
			.container {
				box-sizing:border-box;
				float:left;
				column-count: 2;
				column-gap:0cm;
			}
			
			.task {
				box-sizing: border-box;
				width: 100%; 
				height: 2.95cm;
				float: left;
				page-break-inside: avoid;
				text-align: center;
				padding: 0.9cm 0.6cm;
			}
			
		</style>
	</head>
	<body style="font-family:Verdana; font-size:12pt;margin:0cm; ">

	<div class="container">
		<xsl:for-each select="task">
			<div class="task">
				<xsl:value-of select="finnish" /> <br />
        <xsl:value-of select="english" />
			</div>
		</xsl:for-each>
		
	</div>  <!-- container --> 
	</body>
	</html>
	
</xsl:template>
	
</xsl:stylesheet>
