<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<style>
			.container {
				
				box-sizing:border-box;
				float:left;
			}
			
			.weapongroup {
				margin:0.2cm; 
				width:98%;
				float:left;
				page-break-inside:avoid;
			}
			
			.power {
				margin:0.2cm; 
				width:98%;
				float:left;
				page-break-inside:avoid;
			}
			
			.listcontainer {
				box-sizing:border-box;
				float:left;
				margin-bottom: 1em;
				
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
				width:10.5em; 
				float:left;
			}
			
			.prof {
				width:3em;
				float:left;
			}
			
			.damage {
				width:3.5em;
				float:left;
			}
			
			.range {
				width:5em;
				float:left;
				text-align:center;
			}
			
			.price {
				width:4em;
				float:left;
			}
			
			.weight {
				width:3.5em;
				float:left;
			}
			
			.property {
				width:calc(50% - 15em);
				min-width: 8em;
				float:right;
				margin-right: 0.5em;
			}
			
			.category {
				width:calc(50% - 15.5em);
				min-width: 8em;
				float:right;
				margin-left: 0.5em;
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
				
				.listcontainer {
					column-count: 2;
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
    
        	<xsl:for-each select="catalog/category">
			<div class="groupholder">
				<div class="grouptitle"><xsl:value-of select="@selection" /> Weapons</div>
				<xsl:call-template name="list" />
			</div>
		</xsl:for-each>
		
	</div> <!-- list container -->
	
	<div class="container">
		<div class="grouptitle">Weapons by Group</div>
		<xsl:for-each select="catalog/group">
			<div class="weapongroup">
				<b><xsl:value-of select="@selection" />: </b>
				<xsl:for-each select="//catalog/weapon[group=current()/@selection or secondary/group=current()/@selection]">
					<xsl:value-of select="./title" />
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</div>
		</xsl:for-each>
	</div>
	</body>
	</html>
</xsl:template>

<xsl:template name="list">
	
	<xsl:if test="count(//catalog/weapon[category=current()/@selection and hand='one-handed' and type='melee'])>0">
		<div class="list">
			<div class="groupname"><xsl:text>One-handed Melee</xsl:text></div>
			<xsl:for-each select="//catalog/weapon[category=current()/@selection and hand='one-handed' and type='melee']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>
	
	<xsl:if test="count(//catalog/weapon[category=current()/@selection and hand='two-handed' and type='melee'])>0">
		<div class="list">
			<div class="groupname"><xsl:text>Two-handed Melee</xsl:text></div>
			<xsl:for-each select="//catalog/weapon[category=current()/@selection and hand='two-handed' and type='melee']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>
	
	<xsl:if test="count(//catalog/weapon[category=current()/@selection and hand='double' and type='melee'])>0">
		<div class="list">
			<div class="groupname"><xsl:text>Double Melee</xsl:text></div>
			<xsl:for-each select="//catalog/weapon[category=current()/@selection and hand='double' and type='melee']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>
	
	<xsl:if test="count(//catalog/weapon[category=current()/@selection and hand='one-handed' and type='ranged'])>0">
		<div class="list">
			<div class="groupname"><xsl:text>One-handed Ranged</xsl:text></div>
			<xsl:for-each select="//catalog/weapon[category=current()/@selection and hand='one-handed' and type='ranged']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>
	
	<xsl:if test="count(//catalog/weapon[category=current()/@selection and hand='two-handed' and type='ranged'])>0">
		<div class="list">
			<div class="groupname"><xsl:text>Two-handed Ranged</xsl:text></div>
			<xsl:for-each select="//catalog/weapon[category=current()/@selection and hand='two-handed' and type='ranged']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>

</xsl:template>

<xsl:template name="line">
	<xsl:choose>
		<xsl:when test="position() mod 2 = 1">
			<div id="line" style="width:100%; float:left; margin-top:0.2em; margin-bottom:0.2em; background:linear-gradient(to right, LightGrey, LightGrey, Gainsboro);">
				<xsl:call-template name="linecontent" />
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div id="line" style="width:100%; float:left; margin-top:0.2em; margin-bottom:0.2em; background:linear-gradient(to right, WhiteSmoke, WhiteSmoke, Snow);">
				<xsl:call-template name="linecontent" />
			</div>
		</xsl:otherwise>
	</xsl:choose>
	
</xsl:template>

<xsl:template name="linecontent">
	
	<div class="title"><xsl:value-of select="title"/></div>
	<div class="prof"><xsl:text>+</xsl:text><xsl:value-of select="proficient"/></div>
	<div class="damage"><xsl:value-of select="damage"/></div>
	<div class="range"><xsl:value-of select="range"/></div>
	<div class="price"><xsl:value-of select="cost"/><xsl:text> gp</xsl:text></div>
	<div class="weight"><xsl:value-of select="weight"/><xsl:text> lb</xsl:text></div>
	<div class="category"> 
		<i><xsl:for-each select="group">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if> 
		</xsl:for-each>
		&#160;</i> 
	</div>
	<div class="property">
		<xsl:for-each select="property">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if> 
		</xsl:for-each>
	</div>
	
	<xsl:for-each select="secondary">
		<div class="linecontainer" style="width:100%; float:left;">
			<div class="title"><xsl:value-of select="title"/></div>
			<div class="prof"><xsl:text>+</xsl:text><xsl:value-of select="proficient"/></div>
			<div class="damage"><xsl:value-of select="damage"/></div>
			<div class="range"><xsl:value-of select="range"/></div>
			<div class="price"><xsl:value-of select="cost"/></div>
			<div class="weight"><xsl:value-of select="weight"/></div>
			<div class="category"> 
				<i><xsl:for-each select="group">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if> 
				</xsl:for-each>
				&#160;</i> 
			</div>
			<div class="property">
				<xsl:for-each select="property">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if> 
				</xsl:for-each>
			</div>
		</div>
		
	</xsl:for-each>
	
</xsl:template>
	
</xsl:stylesheet>
