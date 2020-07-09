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

			.power {
				margin:0.2cm;
				width:97%;
				float:left;
				page-break-inside:avoid;
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

				<xsl:apply-templates match="power">
					<xsl:sort select="title" />
				</xsl:apply-templates>


		</div> <!-- container -->
	</body>
	</html>
</xsl:template>

<xsl:template match="power">

	<div class="power">
		<xsl:choose>
			<xsl:when test="part[1]/frequency = 'At-Will'">
				<xsl:call-template name="createheader">
					<xsl:with-param name="bgcolor">#619869</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="part[1]/frequency = 'Encounter'">
				<xsl:call-template name="createheader">
					<xsl:with-param name="bgcolor">#961334</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="part[1]/frequency = 'Daily'">
				<xsl:call-template name="createheader">
					<xsl:with-param name="bgcolor">#4d4d4f</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
		</xsl:choose>


		<div id="fluff" style="background:linear-gradient(to right, #D6D6C2, #ebebe0); width:100%; box-sizing:border-box; padding:0.3em; float:left;">
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
				<i><b><xsl:value-of select="part-name"/></b></i>
			</div>
		</xsl:if>

		<xsl:if test="not(hide-freqkey = 'true')">
			<div id="freqkey" style="width:100%; box-sizing:border-box;  padding:0.2em 0.3em; float:left; font-weight:bold;">
				<div id="frequency" style="width:5.9em; float:left;">
					<xsl:value-of select="frequency"/>
				</div>
				<xsl:if test="keyword">
					<div id="blob" style="width: 1.2em; float: left; text-align:center;">
						&#x25C6;
					</div>
					<div id="keywords" style="width:calc(100% - 7.1em); float:left;">
						<xsl:value-of select="keyword"/>
					</div>
				</xsl:if>
			</div>
		</xsl:if>

		<xsl:if test="not(hide-actrange = 'true')">
			<div id="actrange" style="width:100%; box-sizing:border-box;  padding:0.2em 0.3em; float:left;">
				<div id="action" style="width:12.2em; float:left; ">
					<b><xsl:value-of select="action"/></b> <xsl:text> </xsl:text>
					<xsl:value-of select="subaction"/>
				</div>
				<div id="type" style="width:calc(100% - 12.2em); box-sizing:border-box; text-indent: -1em; padding-left:1em; float:left;">
					<b><xsl:value-of select="type"/>&#160;</b>
					<xsl:value-of select="range"/>
					<xsl:if test="type2">
						 or <p style="text-indent:-1em; margin-top:0em; margin-bottom:0em;">
								<b><xsl:value-of select="type2"/>&#160;</b>
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
	<xsl:if test="augment">
		<div style="width:100%; box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; padding-left:1em; float:left; font-size:1.05em; font-variant:small-caps;">
			<b>Augment <xsl:value-of select="augment" /></b>
		</div>
	</xsl:if>

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
				<xsl:when test="indent='3'">
					<xsl:call-template name="shadesection">
						<xsl:with-param name="leftindent">5.1em</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="indent='2'">
					<xsl:call-template name="shadesection">
						<xsl:with-param name="leftindent">6.4em</xsl:with-param>
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
				<xsl:when test="indent='3'">
					<xsl:call-template name="clearsection">
						<xsl:with-param name="leftindent">5.1em</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="indent='4'">
					<xsl:call-template name="clearsection">
						<xsl:with-param name="leftindent">6.4em</xsl:with-param>
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

	<div style="width:100%; background:linear-gradient(to right, #D6D6C2, #ebebe0); box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; padding-left:{$leftindent}; float:left;">
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
