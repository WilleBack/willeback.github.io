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
				width:calc(100% - 1.4em);
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

	<div id="categoryname" style="width:100%; float:left; font-size:1.4em; padding:0.5em 0.4em 0.2em; font-weight:bold; font-variant:small-caps; color:#321001; text-decoration:underline;">
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
		
		<div id="description" style="float:left; margin:0.1em; padding-top:0.5em;">
			
			<p style="padding:0.2em 0.3em; margin:0; ">
	  			<xsl:value-of select="section[1]" disable-output-escaping="yes"/>
			</p>
		
			<xsl:for-each select="section[position()>1]">
				<xsl:choose>
					<xsl:when test="@style='bullet'">
						<p style="padding:0.2em 0.2em; padding-left:1.35em; text-indent:-1.2em; margin:0;">
							<xsl:text>&#8226; </xsl:text><xsl:value-of select="." disable-output-escaping="yes"/>
						</p>
					</xsl:when>
					<xsl:otherwise>
						<p style="padding:0.2em 0.3em; text-indent:1em; margin:0;">
							<xsl:value-of select="." disable-output-escaping="yes"/>
						</p>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>

			<xsl:if test="heighten">
				<p style="padding:0.2em 0.3em; text-indent:1em; margin:0;">
					<b>At Higher Levels. </b>
					<xsl:value-of select="heighten" disable-output-escaping="yes"/>
				</p>
			</xsl:if>
			
		</div>
	
	</div> 

</xsl:template>

<xsl:template name="createheader">
	<xsl:param name="bgcolor">Purple</xsl:param>
	
	<div id="header" style="width:100%; float:left; font-variant: small-caps; ">
		<div id="title" style="float:left; font-size:1.2em; margin:0.2em; margin-bottom:0em; vertical-align:middle; font-weight:bold; letter-spacing:1px; width:calc(100% - 1.5em);"> 
			<xsl:value-of select="title"/>
		</div>
		<div id="school" style="float:left; margin:0.1em; margin-bottom:0.5em; padding-left:0.3em; vertical align:middle; width:calc(100% - 1.1em);">
			<xsl:text>(</xsl:text><xsl:value-of select="school"/><xsl:text>)</xsl:text>
			<xsl:if test="reverse">
				<br/><xsl:text>Reversible</xsl:text>
			</xsl:if>
		</div>
		
	</div>
  <div id="info" style="width:100%; float:left; padding: 0.0em 0.5em;">
  	<xsl:if test="sphere">
  		<div style="width:calc(100% - 1.3em); float:left; padding-left:1em; text-indent:-1em;"><b><xsl:text>Sphere: </xsl:text></b><xsl:value-of select="sphere" /></div>
  	</xsl:if>
  	<div style="width:100%; column-count:2; column-gap:0.3em;">
  		<div style="width:calc(100% - 1.3em); float:left; padding-left:1em; text-indent:-1em;"><b><xsl:text>Range: </xsl:text></b> <xsl:value-of select="range" disable-output-escaping="yes" /></div>
  		<div style="width:calc(100% - 1.3em); float:left; padding-left:1em; text-indent:-1em;"><b><xsl:text>Duration: </xsl:text></b> <xsl:value-of select="duration" disable-output-escaping="yes" /></div>
  		<div style="width:calc(100% - 1.3em); float:left; padding-left:1em; text-indent:-1em;"><b><xsl:text>Area of Effect: </xsl:text></b> <xsl:value-of select="area" disable-output-escaping="yes" /></div>
  		<div style="width:calc(100% - 1.3em); float:left; padding-left:1em; text-indent:-1em;"><b><xsl:text>Components: </xsl:text></b> <xsl:value-of select="components" disable-output-escaping="yes" /></div>
  		<div style="width:calc(100% - 1.3em); float:left; padding-left:1em; text-indent:-1em;"><b><xsl:text>Casting Time: </xsl:text></b> <xsl:value-of select="casting" disable-output-escaping="yes" /></div>
  		<div style="width:calc(100% - 1.3em); float:left; padding-left:1em; text-indent:-1em;"><b><xsl:text>Saving Throw: </xsl:text></b> <xsl:value-of select="save" disable-output-escaping="yes" /></div>
  	</div>
   </div>
	
</xsl:template> 
	
</xsl:stylesheet>
