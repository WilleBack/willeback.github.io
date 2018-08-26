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
			
			.feat {
				margin:0.2cm; 
				width:98%;
				float:left;
				page-break-inside:avoid;
			}
			
			.listcontainer {
				box-sizing:border-box;
				float:left;
				
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
				width:15em; 
				float:left;
			}
			
			.category {
				width: 8em; 
				float:left;
			}
			
			.groups{ 
				width:calc(97% - 25em); 
				float:left;
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
		<div class="list">
		<div class="groupname">Armor</div>
		<xsl:for-each select="catalog/feat[group='Armor']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Attack Enhancement</div>
		<xsl:for-each select="catalog/feat[group='Attack Enhancement']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Attack Hindrance</div>
		<xsl:for-each select="catalog/feat[group='Attack Hindrance']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Acid Specialization</div>
		<xsl:for-each select="catalog/feat[group='Acid Specialization']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Action Point</div>
		<xsl:for-each select="catalog/feat[group='Action Point']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Background</div>
		<xsl:for-each select="catalog/feat[group='Background']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i>&#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i>&#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Bloodied</div>
		<xsl:for-each select="catalog/feat[group='Bloodied']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Bloodline</div>
		<xsl:for-each select="catalog/feat[category='Bloodline']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i>&#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>

					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Cold Specialization</div>
		<xsl:for-each select="catalog/feat[group='Cold Specialization']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>

					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Combat Advantage</div>
		<xsl:for-each select="catalog/feat[group='Combat Advantage']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>

					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Condition Negation</div>
		<xsl:for-each select="catalog/feat[group='Condition Negation']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Critical</div>
		<xsl:for-each select="catalog/feat[group='Critical']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Damage Enhancement</div>
		<xsl:for-each select="catalog/feat[group='Damage Enhancement']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Damage Resistance</div>
		<xsl:for-each select="catalog/feat[group='Damage Resistance']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Defense</div>
		<xsl:for-each select="catalog/feat[group='Defense']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Dragonmark</div>
		<xsl:for-each select="catalog/feat[category='Dragonmark']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Equipment</div>
		<xsl:for-each select="catalog/feat[group='Equipment']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Familiar</div>
		<xsl:for-each select="catalog/feat[group='Familiar']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>

					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Fear</div>
		<xsl:for-each select="catalog/feat[group='Fear']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Fire Specialization</div>
		<xsl:for-each select="catalog/feat[group='Fire Specialization']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Forced Movement</div>
		<xsl:for-each select="catalog/feat[group='Forced Movement']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Forgeborn Heritage</div>
		<xsl:for-each select="catalog/feat[group='Forgeborn Heritage']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Foulborn Heritage</div>
		<xsl:for-each select="catalog/feat[group='Foulborn Heritage']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Healing</div>
		<xsl:for-each select="catalog/feat[group='Healing']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<!-- <div class="list">
		<div class="groupname">Implement</div>
		<xsl:for-each select="catalog/feat[group='Implement']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div> -->
		<div class="list">
		<div class="groupname">Illumination</div>
		<xsl:for-each select="catalog/feat[group='Illumination']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Initiative</div>
		<xsl:for-each select="catalog/feat[group='Initiative']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Kill Effect</div>
		<xsl:for-each select="catalog/feat[group='Kill Effect']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Languages</div>
		<xsl:for-each select="catalog/feat[group='Languages']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Luck</div>
		<xsl:for-each select="catalog/feat[group='Luck']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Mark Punishment</div>
		<xsl:for-each select="catalog/feat[group='Mark Punishment']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Misfortune Bloodline</div>
		<xsl:for-each select="catalog/feat[group='Misfortune Bloodline']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Mobility</div>
		<xsl:for-each select="catalog/feat[group='Mobility']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Movement Hindrance</div>
		<xsl:for-each select="catalog/feat[group='Movement Hindrance']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Necrotic Specialization</div>
		<xsl:for-each select="catalog/feat[group='Necrotic Specialization']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Opportunity Attacks</div>
		<xsl:for-each select="catalog/feat[group='Opportunity Attacks']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Perception</div>
		<xsl:for-each select="catalog/feat[group='Perception']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Physical Change</div>
		<xsl:for-each select="catalog/feat[group='Physical Change']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Power Enhancement</div>
		<xsl:for-each select="catalog/feat[group='Power Enhancement']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Power Recovery</div>
		<xsl:for-each select="catalog/feat[group='Power Recovery']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Power Repertoire</div>
		<xsl:for-each select="catalog/feat[group='Power Repertoire']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Proficiency Gain</div>
		<xsl:for-each select="catalog/feat[group='Proficiency Gain']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Psionics</div>
		<xsl:for-each select="catalog/feat[group='Psionics']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Psychic Specialization</div>
		<xsl:for-each select="catalog/feat[group='Psychic Specialization']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Rituals</div>
		<xsl:for-each select="catalog/feat[group='Rituals']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Saving Throws</div>
		<xsl:for-each select="catalog/feat[group='Saving Throws']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Second Wind</div>
		<xsl:for-each select="catalog/feat[group='Second Wind']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Shapechange</div>
		<xsl:for-each select="catalog/feat[group='Shapechange']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Size-based</div>
		<xsl:for-each select="catalog/feat[group='Size-based']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Skill Enhancement</div>
		<xsl:for-each select="catalog/feat[group='Skill Enhancement']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Skill Training</div>
		<xsl:for-each select="catalog/feat[group='Skill Training']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Spellscar</div>
		<xsl:for-each select="catalog/feat[group='Spellscar']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Stealth</div>
		<xsl:for-each select="catalog/feat[group='Stealth']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Summoning</div>
		<xsl:for-each select="catalog/feat[group='Summoning']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Support</div>
		<xsl:for-each select="catalog/feat[group='Support']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Teamwork</div>
		<xsl:for-each select="catalog/feat[group='Teamwork']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Teleportation</div>
		<xsl:for-each select="catalog/feat[group='Teleportation']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Temporary Hit Points</div>
		<xsl:for-each select="catalog/feat[group='Temporary Hit Points']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Traps</div>
		<xsl:for-each select="catalog/feat[group='Traps']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Triggered</div>
		<xsl:for-each select="catalog/feat[group='Triggered']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Undead-hunting</div>
		<xsl:for-each select="catalog/feat[group='Undead-hunting']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Vistani Heritage</div>
		<xsl:for-each select="catalog/feat[group='Vistani Heritage']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Weapon Specialization</div>
		<xsl:for-each select="catalog/feat[group='Weapon Specialization']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		<div class="list">
		<div class="groupname">Worship</div>
		<xsl:for-each select="catalog/feat[group='Worship']">
			<xsl:choose>
				<xsl:when test="position() mod 2 = 1">
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="line" style="width:100%; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div class="title"><xsl:value-of select="title"/></div>
						<div class="category"> <i><xsl:value-of select="category"/></i> &#160;</div>
						<div class="groups"><xsl:for-each select="group"><xsl:value-of select="."/><xsl:if test="position()!=last()"><xsl:text>, </xsl:text></xsl:if> </xsl:for-each></div>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</div>
		
	</div>
	<div class="container">
	<xsl:for-each select="catalog/feat">
		<div class="feat">
			<xsl:choose>
				<xsl:when test="tier = 'Heroic'">
					<div id ="header" style="background-color:RoyalBlue; box-sizing:border-box; width:100%; float:left; color:white; ">
						<div id="title" style="float:left; margin:0.5em; vertical-align:middle; font-size:1.1em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; max-width:70%;"><xsl:value-of select="title"/></div>
						<div id="tier" style="width: 20%; float:right; text-align:right; font-size: 0.8em; margin:0.5em;"><xsl:value-of select="tier"/>
						</div>
					</div>	
				</xsl:when>
				<xsl:when test="tier = 'Paragon'">
					<div id ="header" style="background-color:MediumBlue; box-sizing:border-box; width:100%; float:left; color:white; ">
						<div id="title" style="float:left; margin:0.5em; vertical-align:middle; font-size:1.1em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; max-width:60%;"><xsl:value-of select="title"/></div>
						<div id="tier" style="width: 20%; float:right; text-align:right; font-size: 0.8em; margin:0.5em;"><xsl:value-of select="tier"/>
						</div>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id ="header" style="background-color:Navy; box-sizing:border-box; width:100%; float:left; color:white; ">
						<div id="title" style="float:left; margin:0.5em; vertical-align:middle; font-size:1.1em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; max-width:60%;"><xsl:value-of select="title"/></div>
						<div id="tier" style="width: 20%; float:right; text-align:right; font-size: 0.8em; margin:0.5em;"><xsl:value-of select="tier"/>
						</div>
					</div>
				</xsl:otherwise> 
			</xsl:choose> 
			<div id="categroup" style="background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro); width:100%; box-sizing:border-box; padding:0.3em; float:left;"> 
				<xsl:choose>
					<xsl:when test="category">
						<b><div id="category" style="width:8.5em; float:left;"><xsl:value-of select="category"/></div> <div id="blob" style="width: 1.3em; float: left; text-align:center;">&#x25C6;</div></b>
						<div id="group" style="width:calc(100% - 9.8em); float:left;">
							<xsl:for-each select="group">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if> 
							</xsl:for-each>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div id="group" style="width:100%; float:left;">
							<xsl:for-each select="group">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if> 
							</xsl:for-each>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</div> <!-- categroup -->
			<div id="content">
				<xsl:if test="prereq">
					<div style="width:100%; box-sizing:border-box; padding:0.3em; text-indent:-1em; padding-left:1.3em; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<b>Prerequisites: </b> 
						<xsl:for-each select="prereq">
							<xsl:choose>
								<xsl:when test="type='ability'">
									<xsl:value-of select="name"/> <xsl:text> </xsl:text> <xsl:value-of select="value"/>
									<xsl:choose>
										<xsl:when test="combine">
											<xsl:text> </xsl:text> <xsl:value-of select="combine"/> <xsl:text> </xsl:text>
										</xsl:when>
										<xsl:when test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								</xsl:when>
								<xsl:when test="type='power'">
									<i><xsl:value-of select="name"/></i> <xsl:text> </xsl:text> <xsl:value-of select="qualifier"/> <xsl:text> </xsl:text> <xsl:value-of select="type"/>
									<xsl:choose>
										<xsl:when test="combine">
											<xsl:text> </xsl:text> <xsl:value-of select="combine"/> <xsl:text> </xsl:text>
										</xsl:when>
										<xsl:when test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								</xsl:when>
								<xsl:when test="type='class'">
									<xsl:value-of select="name"/> <xsl:text> </xsl:text> <xsl:value-of select="type"/>
									<xsl:choose>
										<xsl:when test="combine">
											<xsl:text> </xsl:text> <xsl:value-of select="combine"/> <xsl:text> </xsl:text>
										</xsl:when>
										<xsl:when test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								</xsl:when> 
								<xsl:when test="type='skill'">
									<xsl:text>trained in </xsl:text> <xsl:value-of select="name"/>
									<xsl:choose>
										<xsl:when test="combine">
											<xsl:text> </xsl:text> <xsl:value-of select="combine"/> <xsl:text> </xsl:text>
										</xsl:when>
										<xsl:when test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								</xsl:when>
								<xsl:when test="type='deity'">
									<xsl:text>must worship </xsl:text> <xsl:value-of select="name"/>
									<xsl:choose>
										<xsl:when test="combine">
											<xsl:text> </xsl:text> <xsl:value-of select="combine"/> <xsl:text> </xsl:text>
										</xsl:when>
										<xsl:when test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="name"/> <xsl:text> </xsl:text> <xsl:value-of select="type"/>
									<xsl:choose>
										<xsl:when test="combine">
											<xsl:text> </xsl:text> <xsl:value-of select="combine"/> <xsl:text> </xsl:text>
										</xsl:when>
										<xsl:when test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:when>
										<xsl:otherwise/>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
							
						</xsl:for-each>
					</div>
				</xsl:if>
				<div style="width:100%; box-sizing:border-box; padding:0.3em; text-indent:-1em; padding-left:1.3em; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
					<b>Benefit: </b><xsl:value-of select="benefit[1]" disable-output-escaping="yes"/>
				</div>
				<xsl:for-each select="benefit[position()>1]">
					<div style="width:100%; box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; padding-left:1.3em; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<xsl:value-of select="." disable-output-escaping="yes"/>
					</div>
				</xsl:for-each>
				<xsl:if test="special">
						<div style="width:100%; box-sizing:border-box; padding:0.3em; text-indent:-1em; padding-left:1.3em; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<b>Special: </b><xsl:value-of select="special[1]" disable-output-escaping="yes"/>
					</div>
					<xsl:for-each select="special[position()>1]">
						<div style="width:100%; box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; padding-left:1.3em; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
							<xsl:value-of select="." disable-output-escaping="yes"/>
						</div>
					</xsl:for-each>
				</xsl:if>
			</div> <!-- content -->
		</div> <!-- power -->
	</xsl:for-each>
	</div> <!-- container -->
	</body>
	</html>
</xsl:template>
</xsl:stylesheet>