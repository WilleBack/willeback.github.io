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
			
			.item {
				background:linear-gradient(to right, #f8e9d5, #fcf4eb);
				margin:0.2cm; 
				width:97%;
				float:left;
				page-break-inside:avoid;
			}
			
			.pricetable {
				box-sizing:border-box;
				width: 100%;
				column-count: 2;
				column-gap:.3em;
			}
			
			.priceline {
				width:100%;
				box-sizing:border-box;
				float:left;
				page-break-inside:avoid;
				margin:0.2em;
			}
			
			.line {
				width:100%; 
				box-sizing:border-box; 
				padding:0.2em 0.3em; 
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
		<div class="listcontainer">
			<div class="groupholder">
				<div class="grouptitle">Feat Groups</div>
				<xsl:for-each select="catalog/level"> 
					<xsl:call-template name="listgroup" />
				</xsl:for-each>
			</div>
		</div>
			
		<div class="container">
				 
				<xsl:apply-templates match="item">
					<xsl:sort select="title" />
				</xsl:apply-templates>
			
			
		</div> <!-- container -->
	</body>
	</html>
</xsl:template>

<xsl:template match="item">
	
	<div class="item">
		<xsl:call-template name="createheader">
			<xsl:with-param name="bgcolor">#DA9722</xsl:with-param>
		</xsl:call-template>
		
		
		<div id="fluff" style="background:linear-gradient(to right, #EFD09F, #f4debc); width:100%; box-sizing:border-box; padding:0.3em; float:left;"> 
			<i><xsl:value-of select="fluff"/></i>
		</div>
		<xsl:choose>
			<xsl:when test="count(level)>1">
				<div class="pricetable">
					<xsl:for-each select="level">
						<div class="priceline">
							<div id="lvl" style="width: 4em; float: left;"><xsl:text>Lvl </xsl:text><xsl:value-of select="value" /></div>
							<div id="enh" style="width: 3em; float:left;"><xsl:value-of select="enhancement" /></div>
							<div id="price" style="width:calc(100% - 8em); float: left; text-align:right;"><xsl:value-of select="price" /><xsl:text>gp</xsl:text></div>
						</div>
					</xsl:for-each>
				</div>
				<div class="line">
					<b><xsl:value-of select="type" /></b>
					<xsl:if test="subtype">
						<b><xsl:text>: </xsl:text></b>
						<xsl:for-each select="subtype">
							<xsl:value-of select="." disable-output-escaping="yes"/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if> 
						</xsl:for-each>
					</xsl:if>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div class="line">
				     <b><xsl:value-of select="type" /></b>
					<xsl:if test="subtype">
						<b><xsl:text>: </xsl:text></b>
						<xsl:for-each select="subtype">
							<xsl:value-of select="." disable-output-escaping="yes"/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if> 
						</xsl:for-each>
					</xsl:if>
					<xsl:text> </xsl:text> <xsl:value-of select="level/price" /><xsl:text>gp</xsl:text>
				</div>
			</xsl:otherwise>
		</xsl:choose>
		
		<xsl:for-each select="headline">
			<div class="line">
				<b><xsl:value-of select="name" /> <xsl:text>: </xsl:text></b>
				<xsl:value-of select="text" disable-output-escaping="yes" />
			</div>
		</xsl:for-each>
		
		<xsl:for-each select="block">
			<div id="blockhead" style="background:linear-gradient(to right, #EFD09F, #f4debc); width:100%; box-sizing:border-box; padding:0.3em; float:left; ">
				<div style="float:left; width: max-content; max-width: calc(100% - 14em);">
					<b><xsl:value-of select="name" /> </b>
					<xsl:if test="keyword">
						<xsl:text> (</xsl:text>
						<xsl:for-each select="keyword">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if> 
						</xsl:for-each>
						<xsl:text>)</xsl:text>
					</xsl:if>
				</div>
				<xsl:if test="action">
					<div id="blob" style="width: 1.2em; float: left; text-align:center; ">
						<xsl:text disable-output-escaping="yes">&#x25C6;</xsl:text>
					</div>
					<div style="float:left; max-width:21em; "><b><xsl:value-of select="frequency" /></b> <xsl:text> (</xsl:text><b><xsl:value-of select="action" /></b>&#160;<xsl:value-of select="subaction" /><xsl:text>)</xsl:text></div>
				</xsl:if>
			</div>
			<xsl:for-each select="line">
				<xsl:choose>
					<xsl:when test="@indent='1'">
						<div class="line" style="padding-left:2.3em;">
							<xsl:value-of select="." disable-output-escaping="yes"/>
						</div>
					</xsl:when>
					<xsl:when test="@indent='2'">
						<div class="line" style="padding-left:3.3em;">
							<xsl:value-of select="." disable-output-escaping="yes"/>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="line">
							<xsl:value-of select="." disable-output-escaping="yes"/>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
		</xsl:for-each>
	
	</div> 

</xsl:template>

<xsl:template name="createheader">
	<xsl:param name="bgcolor">Purple</xsl:param>
	
	<div id="header" style="background-color:{$bgcolor}; width:100%; float:left; color:white; ">
		<div id="title" style="float:left; margin:0.5em; vertical-align:middle; font-size:1.2em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; width:calc(100% - 9em);"> 
			<xsl:value-of select="title"/>
		</div>
		<div id="classcat" style="width: 10em; float:right; text-align:right; font-size: 0.8em; margin:0.5em;">
			<xsl:value-of select="category"/><br />
			<xsl:text>Level </xsl:text><xsl:value-of select="level[1]/value"/>
			<xsl:if test="count(level)>1">
				<xsl:text>+</xsl:text>
			</xsl:if>
		</div>
	</div> 
	
</xsl:template>
	
<xsl:template name="listgroup">
	
	<xsl:if test="count(//catalog/item[level/value=current()/@counter])>0">
		<div class="list">
			<div class="groupname"> <xsl:text>Level </xsl:text> <xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
			<xsl:for-each select="//catalog/item[level/value=current()/@counter and category='Common']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>
	
	<xsl:if test="count(//catalog/feat[group=current()/@selection and tier='Paragon'])>0">
		<div class="list">
			<div class="groupname"> <xsl:value-of select="@selection" /> <xsl:text> - Paragon</xsl:text></div>
			<xsl:for-each select="//catalog/feat[group=current()/@selection and tier='Paragon']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>
	
	<xsl:if test="count(//catalog/feat[group=current()/@selection and tier='Epic'])>0">
		<div class="list">
			<div class="groupname"> <xsl:value-of select="@selection" /> <xsl:text> - Epic</xsl:text></div>
			<xsl:for-each select="//catalog/feat[group=current()/@selection and tier='Epic']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>

</xsl:template>
	
<xsl:template name="line">
	
	<xsl:choose>
		<xsl:when test="position() mod 2 = 1">
			<div id="line" style="width:100%; float:left; background:linear-gradient(to right, LightGrey, LightGrey, Gainsboro);">
				<xsl:call-template name="linecontent" />
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div id="line" style="width:100%; float:left; background:linear-gradient(to right, WhiteSmoke, WhiteSmoke, Snow);">
				<xsl:call-template name="linecontent" />
			</div>
		</xsl:otherwise>
	</xsl:choose>
	
</xsl:template>

<xsl:template name="linecontent">
	
	<div class="title"><xsl:value-of select="title"/></div>
		<div class="subtype"> 
			<i><xsl:for-each select="subtype">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if> 
			</xsl:for-each>
			&#160;</i> 
		</div>
		<div class="price">
			<xsl:value-of select="level[value=current()/@counter]/price"/>
		</div>
	
</xsl:template>
	
</xsl:stylesheet>
