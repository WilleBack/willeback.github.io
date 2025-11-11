<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/ruleblock">
	<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<title><xsl:value-of select="rulename" /></title>
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

			.para {
				margin:0.2cm;
				width:calc(98% - 0.2em);
				float:left;
				page-break-inside:avoid;
			}

			.title {
				width:99%;
				box-sizing:border-box;
				float:left;
				font-family:DnDLolth;
				font-size:1.3em;
				padding:0.3em 0.4em 0.2em;
				font-weight:bold;
				font-variant:small-caps;
				color:#321001;
				border-bottom: 0.2em solid #321001;
			}

			.subtitle {
				width:98%;
				box-sizing:border-box;
				float:left;
				font-size:1.1em;
				padding:0.3em 0.2em;
				font-weight:bold;
				font-variant:small-caps;
				color:#632003;
				margin: 0 0.2cm;
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

		<xsl:apply-templates/>

	</body>
	</html>
</xsl:template>

<xsl:template match="*">
	<xsl:variable name="indent" select="number(@indent)" />
	<xsl:variable name="padding" select="0.2 + ($indent * 1.0)" />

   <div class="{name()}">
		<xsl:if test="@indent or @narrow">
			<xsl:attribute name="style">
				<xsl:if test="@indent">
					<xsl:text>margin-left:</xsl:text>
					<xsl:value-of select="$padding"/>
					<xsl:text>em; </xsl:text>
					<xsl:text>width: calc(98% - </xsl:text><xsl:value-of select="($indent * 1.0)"/><xsl:text>em);</xsl:text>
				</xsl:if>
				<xsl:if test="@narrow">
					<xsl:text>margin-top:0.2em; margin-bottom:0.15em;</xsl:text>
				</xsl:if>
			</xsl:attribute>
		</xsl:if>

      <xsl:apply-templates/>
   </div>
</xsl:template>

<xsl:template match="rulename">
	<div id="ruleheader" style="box-sizing:border-box; width:100%; float:left;">
		<div id="ruletitle" style="font-family:DnDLolth; box-sizing:border-box; width:100%; float:left; font-size:1.6em; padding:0.6em 0.6em 0.2em; font-weight:bold; font-variant:small-caps; letter-spacing:1px;" >
			<xsl:apply-templates />
		</div>
	</div>
</xsl:template>

<xsl:template match="para/title">
  <div class="title"><xsl:apply-templates/></div>
</xsl:template>

<xsl:template match="para/subtitle">
  <div class="subtitle"><xsl:apply-templates/></div>
</xsl:template>

<xsl:template match="scoretable">
   <div class="table-block" style="width:95%; float:left; margin-bottom:0.6em; padding-left:1em; break-inside:avoid;">
      <div class="table-title" style="font-weight:bold; margin-bottom:0.3em; font-size: 1.05em;">
         <xsl:value-of select="@name"/>
      </div>
		<div style="width:100%; column-count:2; column-gap:0.1em;">
	      <xsl:for-each select="row">
	         <div class="listline">
	            <xsl:attribute name="style">
	               <xsl:text>width: 90%; overflow: auto; margin-left: 0.8em; padding: 0.2em;</xsl:text>
	               <xsl:if test="position() mod 2 = 1">background:linear-gradient(to right, #dedede, #ececec);</xsl:if>
	            </xsl:attribute>
	            <div style="width:27%; float:left; text-align:right; padding-right:0.7em;">
	               <b><xsl:value-of select="@name"/></b>
	            </div>
	            <div style="width:calc(73% - 1em); float:left;">
	               <xsl:apply-templates/>
	            </div>
	         </div>
	      </xsl:for-each>
		</div>
  </div>
</xsl:template>

<xsl:template match="name">
	<xsl:choose>
		<xsl:when test="./@style='italic'">
			<i><xsl:apply-templates /> </i>
		</xsl:when>
		<xsl:when test="./@style='under'">
			<u><xsl:apply-templates /> </u>
		</xsl:when>
		<xsl:when test="name(parent::*) = 'block'">
			<xsl:apply-templates />
		</xsl:when>
		<xsl:otherwise>
			<b><xsl:apply-templates /> </b>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="key">
	<b><span class="keyword" style="float:none; font-variant: small-caps; font-size: 1.05em; width:calc(100% - 0.5em); margin:0.1em;"><xsl:apply-templates/></span></b>
</xsl:template>

<xsl:template match="b|i">
	<xsl:element name="{name()}">
    <xsl:apply-templates />
  </xsl:element>
</xsl:template>

<xsl:template match="bullet">
	&#9658;<xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="br">
   <br />
</xsl:template>

<xsl:template match="et">
	<xsl:text> &#38; </xsl:text>
</xsl:template>

<xsl:template match="text()">
   <xsl:value-of select="." disable-output-escaping="yes" />
</xsl:template>

</xsl:stylesheet>
