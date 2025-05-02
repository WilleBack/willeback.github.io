<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="power.xsl"/>

<xsl:template match="/">
	<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<title><xsl:value-of select="class/name" /> - <xsl:value-of select="class/subname" /></title>
		<style>
			.container {
				width:100%;
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
	<body style="font-family:MentorSansStd, Trebuchet, Verdana, Arial; font-size:9pt;margin:0cm; ">

	<div id="classheader" style="box-sizing:border-box; width:100%; float:left; color:white; ">
		<div id="classtitle" style="font-family:DnDLolth; background-color:#042151; box-sizing:border-box; width:100%; float:left; font-size:1.6em; padding:0.6em 0.6em 0.2em; font-weight:bold; font-variant:small-caps; letter-spacing:1px;" >
			<xsl:value-of select="class/name" />
		</div>
		<div id="subclasstitle" style="font-family:DnDLolth; background-color:#042151; box-sizing:border-box; width:100%; float:left; font-size:1.2em; padding:0em 1em 0.6em; font-variant:small-caps; letter-spacing:1px;">
			<xsl:text>- </xsl:text><xsl:value-of select="class/subname" />
		</div>
		<div id="classinfo" style="background:linear-gradient(to right, #45494f, #45494f, #6d737c); box-sizing:border-box; width:100%; padding:0.6em; float:left;" >
			<b><xsl:text>Role: </xsl:text></b>  <xsl:value-of select="class/role" /> <xsl:text>; </xsl:text> <b><xsl:text>Power Source: </xsl:text></b> <xsl:value-of select="class/source" /> <br />
			<span style="font-family:MentorSansStd-Light; font-style:italic;"><xsl:value-of select="class/shortfluff" /></span>
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
					<br /><b><xsl:value-of select="name"/>: </b> <xsl:value-of select="value" />
				</xsl:for-each>
			</div> <!-- blockdiv -->

			<div class="blockdiv">
				<b>Health</b>
					<br /><b>Hit Points at 1st level: </b><xsl:value-of select="class/hpbase"/> <xsl:text> + Constitution score</xsl:text>
					<br /><b>Hit Points gained each level: </b><xsl:value-of select="class/hpgain"/>
					<xsl:if test="class/surgebase">
						<br /><b>Healing Surges: </b><xsl:value-of select="class/surgebase"/> <xsl:text> + Constitution modifier</xsl:text>
					</xsl:if>
					<xsl:if test="class/surges">
						<br /><b>Healing Surges: </b><xsl:value-of select="class/surges"/>
					</xsl:if>
			</div> <!-- blockdiv -->

			<div class="blockdiv">
				<b>Skills</b>
					<br /><b>Automatically trained in: </b><xsl:value-of select="class/skills/trained"/>
					<br /><b>Additional Trained skills: </b><xsl:value-of select="class/skills/number"/>
			</div> <!-- blockdiv -->

		</div> <!-- block -->

		<div class="feature">
			<div id="header" style="width:100%; float:left; font-family:DnDLolth; font-size:1.4em; padding:0.5em 0.4em 0.2em; font-weight:bold; font-variant:small-caps; color:#321001;">
				<xsl:text>Class Features</xsl:text>
			</div>
			<div class="text">
				<xsl:text>The following are class features of the </xsl:text><xsl:value-of select="class/subname" /> <xsl:text> version of the </xsl:text> <xsl:value-of select="class/name" /> <xsl:text> class:</xsl:text>
			</div>
		</div>

		<xsl:for-each select="class/feature">
			<div class="feature">
				<div id="featurename" style="width:97%; float:left; font-family:DnDLolth; font-size:1.3em; padding:0.3em 0.4em 0.2em; font-weight:bold; font-variant:small-caps; color:#321001; border-bottom: 0.2em solid #321001;">
					<xsl:value-of select="name" />
				</div>
				<xsl:for-each select="benefit">
					<div class="text">
						<xsl:apply-templates />
					</div>
				</xsl:for-each>

				<xsl:if test="power">
					<xsl:apply-templates select="power" />
				</xsl:if>

			</div>

			<xsl:if test="subfeature">
				<xsl:for-each select="subfeature">
					<div id="subfeature" style="width:98%; float:left; page-break-inside:avoid; margin: 0 0.2cm;">
						<div id="subfeaturename" style="width:100%; float:left; font-size:1.1em; padding:0.3em 0.2em; font-weight:bold; font-variant:small-caps; color:#632003;">
							<i><xsl:value-of select="name" /></i>
						</div>
						<xsl:for-each select="benefit">
							<div class="text">
								<xsl:apply-templates />
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

</xsl:stylesheet>
