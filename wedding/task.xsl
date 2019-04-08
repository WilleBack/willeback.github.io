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
			}
			
			.blockdiv {
			
				width:100%; 
				box-sizing:border-box; 
				padding:0.3em; 
				text-indent:-1em; 
				padding-left:1.3em; 
				float:left;"
			}
			
			.feature {
				margin:0.2cm; 
				width:98%;
				float:left;
				page-break-inside:avoid;
			}
			
			.power {
				margin:0.2cm; 
				width:95%;
				float:left;
				page-break-inside:avoid;
			}
			
			.text {
				width:100%; 
				box-sizing:border-box; 
				padding:0.3em; 
				text-indent:-1em; 
				padding-left:1.3em; 
				float:left;
			}
			
			.listcontainer {
				box-sizing:border-box;
				float:left;
				
			}
			
			.groupholder {
				width:100%;
				float:left;
			}
			
			.grouptitle {
				width:100%; 
				font-size:1.4em;
				font-weight:bold;
			}
			
			.list {
				margin:0.4em;
				width:97%;
				float:left;
				page-break-inside: avoid;
			}
			
			.groupname {
				width:100%; 
				font-size:1.2em;
				font-weight:bold;
			}
			
			.title {
				width:16.5em; 
				float:left;
			}
			
			.category {
				width: 8em; 
				float:left;
			}
			
			.groups{ 
				width:calc(97% - 25em); 
				min-width: 16.5em;
				float:right;
			}
			
			
			}
			
			
		</style>
	</head>
	<body style="font-family:Verdana; font-size:12pt;margin:0cm; ">

	<div class="container">
		<xsl:for-each select="task">
			<div id="task" style="width:100%; height: 3cm; box-sizing:border-box; margin: 0.5cm; float:left; page-break-inside:avoid; vertical-align:middle; text-align:center;">
				<xsl:value-of select="finnish" /> <br />
        <xsl:value-of select="english" />
			</div>
		</xsl:for-each>
		
	</div>  <!-- container --> 
	</body>
	</html>
	
</xsl:template>
	
</xsl:stylesheet>
