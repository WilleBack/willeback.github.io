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
		<xsl:apply-templates select="catalog/list" />
		
		<div class="list">
		<div class="groupname">Bloodline</div>
		<xsl:for-each select="catalog/feat[category='Bloodline']">
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
		<div class="groupname">Familiar</div>
		<xsl:for-each select="catalog/feat[category='Familiar']">
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
		<xsl:for-each select="catalog/feat[category='Spellscar']">
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

<xsl:template match="catalog/list">
	<div class="list">
		<div class="groupname"> <xsl:value-of select="@selection" /> </div>
		<xsl:for-each select="//catalog/feat[group=current()/@selection]">
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
</xsl:template>
	
</xsl:stylesheet>