<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<style>
			.container {
				
				padding-top:1em;
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
				width:97%;
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
	
	<div id="classheader" style="box-sizing:border-box; width:100%; float:left; color:white; ">
		<div id="classtitle" style="background-color:#042151; box-sizing:border-box; width:100%; float:left; font-size:1.6em; padding:1em 1em 0.2em; font-weight:bold; font-variant:small-caps; letter-spacing:1px;" > 
			<xsl:value-of select="class/name" /> 
		</div>
		<div id="subclasstitle" style="background-color:#042151; box-sizing:border-box; width:100%; float:left; font-size:1.2em; padding:0em 1.2em 1em; font-variant:small-caps; letter-spacing:1px;">
			<xsl:text>- </xsl:text><xsl:value-of select="class/subname" />
		</div>
		<div id="classinfo" style="background:linear-gradient(to right, #45494f, #45494f, #6d737c); width:100%; padding:1em; float:left;" >
			<b><xsl:text>Role: </xsl:text></b>  <xsl:value-of select="class/role" /> <xsl:text>; </xsl:text> <b><xsl:text>Power Source: </xsl:text></b> <xsl:value-of select="class/source" /> <br />
			<i><xsl:value-of select="class/shortfluff" /></i>
		</div> 
	</div> <!-- class header -->
		
	<div class="container">
		<xsl:for-each select="class/fluff">
			<div id="fluff" style="width:100%; box-sizing:border-box; padding:0.3em; text-indent:-1em; padding-left:1.3em; float:left; page-break-inside:avoid;">
				<xsl:value-of select="." />
			</div>
		</xsl:for-each>
		
		<div id="block" style="background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro); width:100%; box-sizing:border-box; padding:0.3em; float:left; page-break-inside:avoid;">
			<div class="blockdiv">
				<b>Key Abilities </b> 
				<br /><b>Primary: </b> <xsl:value-of select="class/keyability[1]" />
				<br /><b>Secondaries: </b> 
				<xsl:for-each select="class/keyability[position()>1]">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</div> <!-- blockdiv -->
			
			<div class="blockdiv">
				<b>Proficiencies</b>
				<xsl:for-each select="class/proficiency">
					<br /><b><xsl:value-of select="type"/> <xsl:text>: </xsl:text></b>
					<xsl:for-each select="name">
						<xsl:value-of select="." />
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</xsl:for-each>
			</div> <!-- blockdiv -->
			
			<div class="blockdiv">
				<b>Defenses </b>
				<xsl:for-each select="class/defense">
					<br /><b><xsl:value-of select="name"/> :</b> <xsl:value-of select="value" />
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</div> <!-- blockdiv -->
			
			<div class="blockdiv">
				<b>Health</b>
					<br /><b>Hit Points at 1st level: </b><xsl:value-of select="class/hpbase"/> <xsl:text> + Constitution score</xsl:text>
					<br /><b>Hit Points gained each level: </b><xsl:value-of select="class/hpgain"/> 
					<br /><b>Healing Surges: </b><xsl:value-of select="class/surgebase"/> <xsl:text> + Constitution modifier</xsl:text>
			</div> <!-- blockdiv -->
			
			<div class="blockdiv">
				<b>Skills</b>
					<br /><b>Automatically trained in: </b><xsl:value-of select="class/skills/trained"/>
					<br /><b>Additional Trained skills: </b><xsl:value-of select="class/skills/number"/> 
			</div> <!-- blockdiv -->
			
		</div> <!-- block -->
		
		<div class="feature">
			<div id="header" style="width:100%; float:left; font-size:1.4em; padding:0.5em 0.4em 0.2em; font-weight:bold; font-variant:small-caps;">
				<xsl:text>Class Features</xsl:text>
			</div>
			<div class="text">
				<xsl:text>The following are class features of the </xsl:text><xsl:value-of select="class/subname" /> <xsl:text> version of the </xsl:text> <xsl:value-of select="class/name" /> <xsl:text> class:</xsl:text>
			</div>
		</div>
		
		<xsl:for-each select="class/feature">
			<div class="feature">
				<div id="featurename" style="width:100%; float:left; font-size:1.2em; padding:0.3em 0.4em 0.2em; font-weight:bold; font-variant:small-caps;">
					<xsl:value-of select="name" />
				</div>
				<xsl:for-each select="benefit">
					<div class="text">
						<xsl:value-of select="." disable-output-escaping="yes" />
					</div>
				</xsl:for-each>
			</div>
			
			<xsl:if test="power">
				<xsl:apply-templates select="power" />
			</xsl:if>
			
			<xsl:if test="subfeature">
				<xsl:for-each select="subfeature">
					<div class="feature">
						<div id="subfeaturename" style="width:100%; float:left; font-size:1em; padding:0.3em 0.2em; font-weight:bold; font-variant:small-caps;">
							<xsl:value-of select="name" />
						</div>
						<xsl:for-each select="benefit">
							<div class="text">
								<xsl:value-of select="." disable-output-escaping="yes" />
							</div>
						</xsl:for-each>
						
						<xsl:if test="power">
							<xsl:apply-templates select="power" />
						</xsl:if>
					</div>
				</xsl:for-each>
			</xsl:if>
			
		</xsl:for-each>
			
		
	</div>  <!-- container --> 
	</body>
	</html>
</xsl:template>

<xsl:template match="power">
	
	<div class="power">
		<xsl:choose>
			<xsl:when test="part[1]/frequency = 'At-Will'">
				<xsl:call-template name="createheader">
					<xsl:with-param name="bgcolor">#407040</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="part[1]/frequency = 'Encounter'">
				<xsl:call-template name="createheader">
					<xsl:with-param name="bgcolor">FireBrick</xsl:with-param> 
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="part[1]/frequency = 'Daily'">
				<xsl:call-template name="createheader">
					<xsl:with-param name="bgcolor">DarkSlateGray</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose> 
		
		
		<div id="fluff" style="background:linear-gradient(to right,PeachPuff, PeachPuff,PapayaWhip); width:100%; box-sizing:border-box; padding:0.3em; float:left;"> 
			<i><xsl:value-of select="fluff"/></i>
		</div>
		
		<xsl:apply-templates select="part" />
	
	</div> 

</xsl:template>

<xsl:template name="createheader">
	<xsl:param name="bgcolor">Purple</xsl:param>
	
	<div id="header" style="background-color:{$bgcolor}; width:100%; float:left; color:white; ">
		<div id="title" style="float:left; margin:0.5em; vertical-align:middle; font-size:1.2em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; width:calc(100% - 9em);"> 
			<xsl:value-of select="title"/>
		</div>
		<div id="classcat" style="width: 10em; float:right; text-align:right; font-size: 0.8em; margin:0.5em;">
			<xsl:value-of select="class"/><br />
			<xsl:value-of select="category"/>
			<xsl:if test="level">
				<xsl:text> </xsl:text><xsl:value-of select="level"/>
			</xsl:if>
		</div>
	</div> 
	
</xsl:template> 

<xsl:template match="part">
	<div id="part" style="width:100%; box-sizing:border-box; float:left;">
		<xsl:if test="part-name != ''">
			<div id="part-name" style="width:100%; padding:0.2em; font-variant:small-caps; font-size:1.1em; float:left;"> 
				<b><xsl:value-of select="part-name"/></b>
			</div>
		</xsl:if>
		
		<xsl:if test="not(hide-freqkey = 'true')">
			<div id="freqkey" style="width:100%; box-sizing:border-box;  padding:0.2em 0.3em; float:left; font-weight:bold;"> 
				<div id="frequency" style="width:5.9em; float:left;">
					<xsl:value-of select="frequency"/>
				</div> 
				<div id="blob" style="width: 1.2em; float: left; text-align:center;">
					&#x25C6;
				</div>
				<div id="keywords" style="width:calc(100% - 7.1em); float:left;">
					<xsl:value-of select="keyword"/>
				</div>
			</div>
		</xsl:if>
		
		<xsl:if test="not(hide-actrange = 'true')">
			<div id="actrange" style="width:100%; box-sizing:border-box;  padding:0.2em 0.3em; float:left;"> 
				<div id="action" style="width:12.2em; float:left; ">
					<b><xsl:value-of select="action"/></b>&#160;
					<xsl:value-of select="subaction"/>
				</div> 
				<div id="type" style="width:calc(100% - 12.2em); box-sizing:border-box; text-indent: -1em; padding-left:1em; float:left;"> 
					<b><xsl:value-of select="type"/>&#160;</b> 
					<xsl:value-of select="range"/>
					<xsl:if test="type2">
						 or <p style="text-indent:-1em; margin-top:0em; margin-bottom:0em;"> 
								<b><xsl:value-of select="type2"/></b>&#160;
								<xsl:value-of select="range2"/>
							</p>
					</xsl:if>
				</div>
			</div>
		</xsl:if>
		
		<xsl:apply-templates select="section" />
	
	</div>
	
</xsl:template> 

<xsl:template match="section">

	<xsl:choose>
		<xsl:when test="shade='true'">
			<xsl:choose>
				<xsl:when test="indent='1'">
					<xsl:call-template name="shadesection">
						<xsl:with-param name="leftindent">2.5em</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="indent='2'">
					<xsl:call-template name="shadesection">
						<xsl:with-param name="leftindent">3.8em</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="shadesection" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:when>
		<xsl:otherwise>
			<xsl:choose>
				<xsl:when test="indent='1'">
					<xsl:call-template name="clearsection">
						<xsl:with-param name="leftindent">2.5em</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="indent='2'">
					<xsl:call-template name="clearsection">
						<xsl:with-param name="leftindent">3.8em</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="clearsection" />
				</xsl:otherwise>
			</xsl:choose>
		</xsl:otherwise>
	</xsl:choose>
	
</xsl:template>

<xsl:template name="shadesection">
	 <xsl:param name="leftindent">1.2em</xsl:param> 
	
	<div style="width:100%; background:linear-gradient(to right, Moccasin,Moccasin,PapayaWhip); box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; padding-left:{$leftindent}; float:left;">
		<xsl:call-template name="sectioncontent" />
	</div>
</xsl:template>

<xsl:template name="clearsection">
	 <xsl:param name="leftindent">1.2em</xsl:param> 
	
	<div style="width:100%; box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; padding-left:{$leftindent}; float:left;">
		<xsl:call-template name="sectioncontent" />
	</div>
</xsl:template>

<xsl:template name="sectioncontent">
	<xsl:choose>
		<xsl:when test="name-style = 'bold'"> 
			<b><xsl:value-of select="name"/>&#160;</b>
		</xsl:when>
		<xsl:when test="name-style = 'italic'">
			<i><xsl:value-of select="name"/>&#160;</i>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="name"/>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:value-of select="text" disable-output-escaping="yes" />
	
</xsl:template>
	
</xsl:stylesheet>