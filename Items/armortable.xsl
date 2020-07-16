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
				page-break-inside:avoid;
			}

			.weapongroup {
				margin:0.2cm;
				width:98%;
				float:left;
				page-break-inside:avoid;
			}

			.armor {
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
				page-break-inside:avoid;
			}

			.grouptitle {
				width:100%;
				font-family:DnDLolth;
				font-size:1.4em;
				font-weight:bold;
				margin:0.2em 0.1em;
			}

			.list {
				margin:0.4em;
				width:97%;
				float:left;
				page-break-inside: avoid;
			}

			.groupname {
				width:100%;
				font-family:DnDLolth;
				font-size:1.2em;
				font-weight:bold;
			}

			.title {
				width:12em;
				float:left;
			}

			.bonus {
				width:calc(20% - 2.5em);
				float:left;
				text-align:center;
			}

			.penalty {
				width:calc(20% - 2.5em);
				float:left;
				text-align:center;
			}

			.speed {
				width:calc(20% - 2.5em);
				float:left;
				text-align:center;
			}

			.price {
				width:calc(20% - 2.5em);
				float:left;
			}

			.weight {
				width:calc(20% - 2.5em);
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
	<div class="listcontainer">

        	<xsl:for-each select="catalog/category">
			<div class="groupholder">
				<div class="grouptitle"><xsl:value-of select="@selection" /></div>
				<xsl:call-template name="list" />
			</div>
		</xsl:for-each>

	</div> <!-- list container -->

		<div class="container">
			<div class="grouptitle">Armor Descriptions</div>
			<xsl:for-each select="catalog/armor">
				<xsl:call-template name="armordesc" />
			</xsl:for-each>
		</div>
	</body>
	</html>
</xsl:template>

<xsl:template name="list">

	<div class="list">
		<xsl:for-each select="//catalog/armor[category=current()/@selection]">
			<xsl:call-template name="line" />
		</xsl:for-each>
	</div>

</xsl:template>

<xsl:template name="line">
	<xsl:choose>
		<xsl:when test="position() mod 2 = 1">
			<div id="line" style="width:100%; float:left; padding:0.1em; background:linear-gradient(to right, LightGrey, LightGrey, Gainsboro); box-sizing:border-box;">
				<xsl:call-template name="linecontent" />
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div id="line" style="width:100%; float:left; padding:0.1em;background:linear-gradient(to right, WhiteSmoke, WhiteSmoke, Snow); box-sizing:border-box;">
				<xsl:call-template name="linecontent" />
			</div>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

<xsl:template name="linecontent">

	<div class="title"><xsl:value-of select="title"/></div>
	<div class="bonus"><xsl:text>+</xsl:text><xsl:value-of select="bonus"/></div>
	<div class="penalty"><xsl:text>-</xsl:text><xsl:value-of select="penalty"/></div>
	<div class="speed"><xsl:text>-</xsl:text><xsl:value-of select="speed"/></div>
	<div class="price"><xsl:value-of select="cost"/><xsl:text> gp</xsl:text></div>
	<div class="weight"><xsl:value-of select="weight"/><xsl:text> lb</xsl:text></div>

</xsl:template>

<xsl:template name="armordesc">
	<div class="armor">
		<xsl:call-template name="createheader" />
		<div class="stats" style="width:100%; margin:0.3em; float:left;">
			<b>Check Penalty: </b> <xsl:text>-</xsl:text><xsl:value-of select="penalty" /><xsl:text>; </xsl:text> <b>Speed Penalty: </b> <xsl:text>-</xsl:text><xsl:value-of select="speed" /> <br />
			<b>Base Bonus: </b> <xsl:text>+</xsl:text><xsl:value-of select="bonus" /><br />
			<b>Cost: </b> <xsl:value-of select="cost" /><xsl:text> gp; </xsl:text> <b>Weight: </b> <xsl:value-of select="weight" /> <xsl:text> lb</xsl:text>
		</div>
		<xsl:for-each select="description">
			<div class="descript" style="width:100%; box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; padding-left:1.3em; float:left;">
				<xsl:value-of select="." />
			</div>
		</xsl:for-each>
	</div>

</xsl:template>

<xsl:template name="createheader">
	<xsl:param name="bgcolor">#0f2f63</xsl:param>

	<div id="header" style="background-color:{$bgcolor}; width:100%; float:left; color:white; ">
		<div id="title" style="float:left; margin:0.3em; margin-bottom:0.1em; vertical-align:middle; font-size:1.2em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; width:100%;">
			<xsl:value-of select="title"/>
		</div>
		<div id="classcat" style="width: 100%; float:left; font-size: 0.9em; margin: 0.15em 0.5em;">
			<xsl:value-of select="category"/>
		</div>
	</div>

</xsl:template>

</xsl:stylesheet>
