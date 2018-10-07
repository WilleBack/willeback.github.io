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
				float: left;
				display: block;
				margin-top: 0.5em;
				margin-bottom: 0.5em;
				margin-left: auto;
				margin-right: auto;
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
					column-gap:0.6em; 
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
	
	<xsl:apply-templates select="rule">
		<xsl:sort select="title" />
	</xsl:apply-templates>
	
</xsl:template>

<xsl:template match="rule">
	
	<div class="rule">
		<xsl:choose>
			<xsl:when test="rarity = 'Common'">
				<xsl:call-template name="createheader">
					<xsl:with-param name="bgcolor">Black</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="rarity = 'Uncommon'">
				<xsl:call-template name="createheader">
					<xsl:with-param name="bgcolor">FireBrick</xsl:with-param> 
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="rarity = 'Rare'">
				<xsl:call-template name="createheader">
					<xsl:with-param name="bgcolor">Orange</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="rarity = 'Unique'">
				<xsl:call-template name="createheader">
					<xsl:with-param name="bgcolor">MediumBlue</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose> 
		
		<div id="traits" style="width: 10em; background-color: Gainsboro; float: left; font-weight:bold; text-align: center; ">
			<xsl:for-each select="trait">
				<xsl:value-of select="." />
				<xsl:if test="position()!=last()">
					<br />
				</xsl:if>  
			</xsl:for-each>
			
		</div>
		
		<xsl:apply-templates select="part" />
	
	</div> 

</xsl:template>

<xsl:template name="createheader">
	<xsl:param name="bgcolor">Purple</xsl:param>
	
	<div id="header" style="width:100%; float:left; font-size:1.2em; font-variant: small-caps; ">
		<div id="title" style="float:left; margin:0.5em; vertical-align:middle; font-weight:bold; letter-spacing:1px; width:calc(100% - 8.5em);"> 
			<xsl:if test="action">
				<xsl:call-template name="actionicon" />
			</xsl:if>
			<xsl:value-of select="title"/>
		</div>
		<div id="type" style="width: 8em; float:right; color:{$bgcolor}; text-align:right; font-size: 0.8em; margin:0.5em;">
			<xsl:value-of select="type"/>
			<xsl:if test="level">
				<div id="levelbox" style="width:1.5em; color:white; background-color:{$bgcolor}; margin:0.5em;">
					<xsl:text> </xsl:text><xsl:value-of select="level"/>
				</div>
			</xsl:if>
		</div>
		
		<hr />
	</div> 
	
</xsl:template> 

<xsl:template match="part">
		
	<xsl:apply-templates select="section" />
	
	<hr />
	
</xsl:template> 

<xsl:template match="section">

	<p style="padding:0.2em 0.3em; text-indent:-1em; padding-left:1.2em;">
	
	<xsl:choose>
		<xsl:when test="name = 'casting'">
			<b><xsl:text>Casting </xsl:text></b>
			<xsl:for-each select="action">
				<xsl:call-template name="actionicon" />
				<xsl:value-of select="type" />
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if> 
			</xsl:for-each>
		</xsl:when>
		<xsl:when test="name = 'spelltarget'">
			<xsl:if test="range">
				<b><xsl:text>Range </xsl:text></b> <xsl:value-of select="range" /> <xsl:text> </xsl:text>
			</xsl:if>
			<xsl:if test="area">
				<b><xsl:text>Area </xsl:text></b> <xsl:value-of select="area" /> <xsl:text> </xsl:text>
			</xsl:if>
			<xsl:if test="targets">
				<b><xsl:text>Targets </xsl:text></b> <xsl:value-of select="targets" /> <xsl:text> </xsl:text>
			</xsl:if>
		</xsl:when>
		<xsl:when test="name">
			<b><xsl:value-of select="name" /> </b> <xsl:value-of select="text" />
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="text" />
		</xsl:otherwise>
	</xsl:choose>
	
	</p>
	
</xsl:template>

<xsl:template name="actionicon">
	 <xsl:choose>
		<xsl:when test="cost = 'free'">
			<i><xsl:text>[[F]] </xsl:text></i>
		</xsl:when>
		<xsl:when test="cost = 'reaction'">
			<i><xsl:text>[[R]] </xsl:text></i>
		</xsl:when>
		<xsl:when test="cost = '3'">
			<i><xsl:text>[[AAA]] </xsl:text></i>
		</xsl:when>
		<xsl:when test="cost = '2'">
			<i><xsl:text>[[AA]] </xsl:text></i>
		</xsl:when>
		<xsl:when test="cost = '1'">
			<i><xsl:text>[[A]] </xsl:text></i>
		</xsl:when>
		<xsl:otherwise>
			<i><xsl:text>[[error]] </xsl:text></i>
		</xsl:otherwise>
	</xsl:choose>
	
</xsl:template>
	
</xsl:stylesheet>
