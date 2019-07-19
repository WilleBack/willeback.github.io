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
			}
			
			.rule {
				margin:0.2cm; 
				width:97%;
				float:left;
				page-break-inside:avoid;
			}
			
			hr { 
				display: block;
				margin-top: 0.2em;
				margin-bottom: 0.2em;
				margin-left: -1em;
				margin-right: 0;
				border-style: inset;
				border-width: 1px;
			}
			
			@media only screen and (min-width:600px) {
				.container { 
					column-count: 2; 
					column-gap:.4em; 
				}
			
			}
			
			@media only screen and (min-width:1000px) {
				.container { 
					column-count: 3; 
					column-gap:0.5em; 
				}
			}
			
			@media only screen and (min-width:1300px) {
				.container { 
					column-count: 4; 
					column-gap:0.6em; 
				}
				
			}
			@page {
				size: auto;
				margin: 0.85cm 0.7cm 1.1cm;
			}
				
			@media print {
				.container { 
					column-count: 2; 
					column-gap:0.8em; 
					margin:0cm;
				}
				
			}
			
			
		</style>
	</head>
	<body style="font-family:Verdana; font-size:8pt;margin:0cm; ">
		<div class="container">
				 
				<xsl:apply-templates select="category" />
			
		</div> <!-- container -->
	</body>
	</html>
</xsl:template>

<xsl:template match="category" >

	<div id="categoryname" style="width:100%; float:left; font-size:1.4em; padding:0.5em 0.4em 0.2em; font-weight:bold; font-variant:small-caps; color:#321001;">
		<xsl:value-of select="catename" />	
	</div>
	
	<xsl:apply-templates select="spell">
		<xsl:sort select="title" />
	</xsl:apply-templates>
	
</xsl:template>

<xsl:template match="spell">
	
	<div class="rule">
		<xsl:call-template name="createheader">
			<xsl:with-param name="bgcolor">Black</xsl:with-param>
		</xsl:call-template>
		
		<div id="description" style="float:left; margin:0.2em;">
		
			<xsl:apply-templates select="section" />
			
		</div>
	
	</div> 

</xsl:template>

<xsl:template name="createheader">
	<xsl:param name="bgcolor">Purple</xsl:param>
	
	<div id="header" style="width:100%; float:left; font-size:1.2em; font-variant: small-caps; ">
		<div id="title" style="float:left; margin:0.2em; vertical-align:middle; font-weight:bold; letter-spacing:1px; width:calc(100% - 1.5em);"> 
			<xsl:value-of select="title"/>
		</div>
		
	</div>
  <div id="info" style="width:100%; float:left; ">
    <i><xsl:value-of select="level" /><xsl:text>-level </xsl:text> <xsl:value-of select="school" /></i><br />
    <b><xsl:text>Casting Time: </xsl:text></b> <xsl:value-of select="casting" /><br />
    <b><xsl:text>Range: </xsl:text></b> <xsl:value-of select="range" /><br />
    <b><xsl:text>Components: </xsl:text></b> <xsl:value-of select="components" /><br />
    <b><xsl:text>Duration: </xsl:text></b> <xsl:value-of select="duration" />
    
   </div>
	
</xsl:template> 

<xsl:template match="section">

	<p style="padding:0.2em 0.3em; text-indent:-1em; padding-left:1.2em; margin:0; ">
	
	  <xsl:value-of select="." disable-output-escaping="yes"/>
	
	</p>
	
</xsl:template>
	
</xsl:stylesheet>
