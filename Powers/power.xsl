<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/catalog">
	<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

		<xsl:if test="collection">
			<title><xsl:value-of select="collection" /></title>
		</xsl:if>
		<style>
			.container {

				box-sizing:border-box;
			}

			.power {
				margin:0.2cm;
				width:calc(100% - 1em);
				float:left;
				break-inside:avoid;
			}

			.header {
				width:100%;
				float:left;
				color:white;
			}

			.titlebox {
				float:left;
				margin:0.3em;
				vertical-align:middle;
				width:calc(100% - 0.1em);
			}

			.title {
				width:calc(100% - 2em);
				float:left;
				font-size:1.2em;
				text-indent:-1em;
				margin-left:1.2em;
			}

			.titletext {
				font-variant: small-caps;
				font-weight:bold;
				letter-spacing:1px;
			}

			.classcat {
				float:right;
				text-align:right;
				font-size: 0.6em;
				margin:0.2em;
				margin-bottom:0em;
			}

			.freqact {
				width:calc(100% - 0.09em);
				font-size:1.05em;
				margin:0.2em;
				margin-top:0em;
				float:left;
			}

			.fluff {
				font-family:MentorSansStd-Light;
				background:linear-gradient(to right, #D6D6C2, #ebebe0);
				width:calc(100% - 0.1em);
				box-sizing:border-box;
				padding:0.3em;
				float:left;
			}

			.keyword {
				font-variant: small-caps;
				font-size: 1.1em;
				float:left;
				width:calc(100% - 0.5em);
				margin:0.2em;
			}

			.section {
				width:calc(100% - 0.1em);
				box-sizing:border-box;
				padding:0.2em 0.3em;
				text-indent:-1em;
				float:left;
			}

			@font-face {
				font-family: 'MentorSansStd';
				src: url('../../font/MentorSansStd.otf') format('opentype');
				font-weight: normal;
				font-style: normal;

			}

			@font-face {
				font-family: 'MentorSansStd';
				src: url('../../font/MentorSansStd-Bold.otf') format('opentype');
				font-weight: bold;
				font-style: normal;

			}

			@font-face {
				font-family: 'DnDLolth';
				src: url('../../font/DnDLolth.otf') format('opentype');
				font-weight: normal;
				font-style: normal;

			}

			@font-face {
				font-family: 'MentorSansStd-Light';
				src: url('../../font/MentorSansStd-Light.otf') format('opentype');
				font-weight: lighter;
				font-style: normal;

			}

			@font-face {
				font-family: 'MentorSansStd-Light';
				src: url('../../font/MentorSansStd-LightIta.otf') format('opentype');
				font-weight: lighter;
				font-style: italic;

			}

			@media only screen and (min-width:600px) {
				.container {
					column-count: 2;
					column-gap:.2em;
				}

			}

			@media only screen and (min-width:1000px) {
				.container {
					column-count: 3;
					column-gap:0.2em;
				}
			}

			@media only screen and (min-width:1300px) {
				.container {
					column-count: 4;
					column-gap:0.2em;
				}

			}
			@page {
				size: auto;
				margin: 0.85cm 0.7cm 1.1cm;
			}

			@media print {
				.container {
					column-count: 2;
					column-gap:0.2em;
					margin:0cm;
				}

			}


		</style>
	</head>
	<body style="font-family:MentorSansStd, Trebuchet, Verdana, Arial; font-size:9.5pt;margin:0cm; ">
		<xsl:if test="collection">
			<div id="collection-header" style="font-family:DnDLolth; width:100%; box-sizing:border-box; padding:0.2em; font-size:1.4em; font-variant:small-caps;">
				<b><xsl:value-of select="collection" /></b>
			</div>
		</xsl:if>
		<div class="container">

				<xsl:apply-templates select="power"/>

		</div> <!-- container -->
	</body>
	</html>
</xsl:template>

<xsl:template match="power">

	<xsl:choose>
		<xsl:when test="frequency = 'At-Will' or (not(frequency) and part[1]/frequency='At-Will')">
			<div class="power" style="border: 0.25em solid #619869; border-radius: 0.2em;">
				<xsl:call-template name="createheader">
					<xsl:with-param name="bgcolor">#619869</xsl:with-param>
				</xsl:call-template>

					<xsl:apply-templates select="section"/>

					<xsl:apply-templates select="part" />
			</div>
		</xsl:when>
		<xsl:when test="frequency = 'Encounter' or (not(frequency) and part[1]/frequency='Encounter')">
			<div class="power" style="border: 0.25em solid #961334; border-radius: 0.2em;">
				<xsl:call-template name="createheader">
					<xsl:with-param name="bgcolor">#961334</xsl:with-param>
				</xsl:call-template>

					<xsl:apply-templates select="section"/>

					<xsl:apply-templates select="part" />
			</div>
		</xsl:when>
		<xsl:when test="frequency = 'Daily' or (not(frequency) and part[1]/frequency='Daily')">
			<div class="power" style="border: 0.25em solid #4d4d4f; border-radius: 0.2em;">
				<xsl:call-template name="createheader">
					<xsl:with-param name="bgcolor">#4d4d4f</xsl:with-param>
				</xsl:call-template>

					<xsl:apply-templates select="section"/>

					<xsl:apply-templates select="part" />
			</div>
		</xsl:when>
		<xsl:otherwise>
				<xsl:call-template name="createheader"/>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

	<xsl:template name="createheader">
		<xsl:param name="bgcolor">Purple</xsl:param>

		<div class="header" style="background-color:{$bgcolor};">
			<div class="titlebox">
				<div class="title">
					<div class="classcat">
						<xsl:value-of select="class"/><br />
						<xsl:value-of select="category"/>
						<xsl:if test="level">
							<xsl:text> </xsl:text><xsl:value-of select="level"/>
						</xsl:if>
					</div>
				<span class="titletext"><xsl:value-of select="title"/></span>
				</div>
				<xsl:if test="frequency">
					<div class="freqact">
						<b><xsl:value-of select="frequency" /></b>
						&#x25C6;
						<b> <xsl:value-of select="action" /></b><xsl:text> </xsl:text><xsl:value-of select="subaction" />
					</div>
				</xsl:if>
			</div>
		</div>

		<div class="fluff">
			<i><xsl:value-of select="fluff"/></i>
		</div>
		<xsl:if test="keyword">
			<div class="keyword">
				<b><xsl:for-each select="keyword">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each></b>
			</div>
		</xsl:if>

	</xsl:template>

<xsl:template match="part">
	<div id="part" style="width:100%; box-sizing:border-box; float:left; border-top: 0.5em solid white;">
		<xsl:if test="name or part-name or frequency">
			<div class="header" style=" background:linear-gradient(to right, #D6D6C2, #ebebe0); color:black;">
				<div class="titlebox" style="width: calc(100% - 1em);">
			      <xsl:if test="name or part-name">
						<div class="title">
							<span class="titletext"><i><xsl:value-of select="name"/><xsl:value-of select="part-name"/></i></span>
						</div>
				   </xsl:if>
				   <xsl:if test="frequency">
					   <div class="freqact">
						   <b><xsl:value-of select="frequency" /> </b>
						   &#x25C6;
						   <b> <xsl:value-of select="action" /></b><xsl:text> </xsl:text><xsl:value-of select="subaction" />
					   </div>
				   </xsl:if>
			   </div>
			</div>
		</xsl:if>

		<xsl:if test="keyword">
			<div class="keyword" style="margin-top:0em;"><b>
				<xsl:for-each select="keyword">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</b></div>
		</xsl:if>

		<xsl:if test="type">
			<div class="section" style="padding-left:1.2em;">
				<b><xsl:value-of select="type"/></b>&#160;<xsl:value-of select="range" disable-output-escaping="yes"/>
				<xsl:if test="type2">
					<xsl:text> or </xsl:text><b><xsl:value-of select="type2"/></b>&#160;<xsl:value-of select="range2" disable-output-escaping="yes"/>
				</xsl:if>
			</div>
		</xsl:if>

		<xsl:apply-templates select="section"/>

	</div>
</xsl:template>

<xsl:template match="section">
	<xsl:if test="augment">
		<div style="width:100%; box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; padding-left:1em; float:left; font-size:1.05em; font-variant:small-caps;">
			<b>Augment <xsl:value-of select="augment" /></b>
		</div>
	</xsl:if>

	<xsl:choose>
		<xsl:when test="shade or @shade ='true' or @shade or @temp">
			<xsl:choose>
				<xsl:when test="indent='1' or @indent='1'">
					<xsl:call-template name="shadesection">
						<xsl:with-param name="leftindent">2.5em</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="indent='2' or @indent='2'">
					<xsl:call-template name="shadesection">
						<xsl:with-param name="leftindent">3.8em</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="indent='3' or @indent='3'">
					<xsl:call-template name="shadesection">
						<xsl:with-param name="leftindent">5.1em</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="indent='4' or @indent='4'">
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
				<xsl:when test="indent='1' or @indent='1'">
					<xsl:call-template name="clearsection">
						<xsl:with-param name="leftindent">2.5em</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="indent='2' or @indent='2'">
					<xsl:call-template name="clearsection">
						<xsl:with-param name="leftindent">3.8em</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="indent='3' or @indent='3'">
					<xsl:call-template name="clearsection">
						<xsl:with-param name="leftindent">5.1em</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="indent='4' or @indent='4'">
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

	<div class="section" style="background:linear-gradient(to right, #D6D6C2, #ebebe0); padding-left:{$leftindent};">
		<xsl:call-template name="sectioncontent" />
	</div>
</xsl:template>

<xsl:template name="clearsection">
	 <xsl:param name="leftindent">1.2em</xsl:param>

	<div class="section" style="padding-left:{$leftindent};">
		<xsl:call-template name="sectioncontent" />
	</div>
</xsl:template>

<xsl:template name="sectioncontent">

	<xsl:if test="bullet or name/@style='bullet'">
		&#9658;<xsl:text> </xsl:text>
	</xsl:if>

	<xsl:if test="@auto='channeldivinity'">
		<b>Channel Divinity:&#160;</b>
		You can only use one Channel Divinity power per encounter.
	</xsl:if>
	<xsl:if test="@auto='no-opportunity'">
		Using this power does not trigger <i>opportunity attacks</i>
	</xsl:if>
	<xsl:if test="@auto='charge-effect'">
		<b>Effect:&#160;</b>
		You charge and use this attack in place of a <i>melee basic attack</i>. If an effect allows you to charge, you can use this power.
	</xsl:if>
	<xsl:if test="@auto='powerstrike'">
		<b>Special:&#160;</b>
		<i>Power strike</i> can be chosen at all encounter attack levels, allowing you to use it more than once per encounter. You can only use one <i>power strike</i> per triggering attack.
	</xsl:if>
	<xsl:if test="@auto='personal'">
		<b>Personal</b>
	</xsl:if>
	<xsl:if test="@auto='special'">
		<b>Special</b>
	</xsl:if>
	<xsl:choose>
		<xsl:when test="name-style='italic' or name/@style='italic'">
			<i><xsl:value-of select="name" disable-output-escaping="yes"/>&#160;</i>
		</xsl:when>
		<xsl:when test="name-style='bold' or name/@style='bold'">
			<b><xsl:value-of select="name" disable-output-escaping="yes"/>&#160;</b>
		</xsl:when>
		<xsl:when test="name-style or name/@style">
			<xsl:value-of select="name" disable-output-escaping="yes"/>&#160;
		</xsl:when>
		<xsl:when test="name/@vestige">
			<b><i>Eyes of the Vestige</i> Augment:</b>&#160;
		</xsl:when>
		<xsl:when test="keyword">
			<xsl:text>This power gains the </xsl:text>
			<b><span class="keyword" style="float:none;"><xsl:value-of select="keyword"/></span></b>
			<xsl:text> keyword</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:if test="name">
				<b><xsl:value-of select="name" disable-output-escaping="yes"/></b>
			</xsl:if>
			<xsl:text>&#160;</xsl:text>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:if test="type">
		<i><xsl:value-of select="type" /></i>
		<xsl:if test="range">
			<xsl:text> </xsl:text><xsl:value-of select="range" disable-output-escaping="yes"/>
		</xsl:if>
		<xsl:if test="type2">
			<xsl:text> or </xsl:text><i><xsl:value-of select="type2"/></i>
			<xsl:if test="range2">
				<xsl:text> </xsl:text><xsl:value-of select="range2" disable-output-escaping="yes"/>
			</xsl:if>
		</xsl:if>
		<xsl:if test="target">
		   <xsl:text> (</xsl:text><xsl:value-of select="target" disable-output-escaping="yes"/><xsl:text>)</xsl:text>
		</xsl:if>
		<xsl:if test="text">
			<xsl:text>; </xsl:text>
		</xsl:if>
	</xsl:if>
	<xsl:if test="type and target">
		<br />
	</xsl:if>
	<xsl:if test="text">
		<xsl:value-of select="text" disable-output-escaping="yes" />
	</xsl:if>

</xsl:template>

</xsl:stylesheet>
