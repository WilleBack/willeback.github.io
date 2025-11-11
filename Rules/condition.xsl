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
				width: 100%;
				box-sizing:border-box;
				float:left;
			}

			.condition {
				background:linear-gradient(to right, #f8e9d5, #fcf4eb);
				margin:0.2cm;
				width:calc(100% - 1.2em);
				float:left;
				break-inside:avoid;
				border: 0.25em solid #1d3d5e;
				border-radius: 0.2em;
			}

			.pricetable {
				box-sizing:border-box;
				width: 100%;
				column-count: 2;
				column-gap:.2em;
			}

			.priceline {
				width:100%;
				box-sizing:border-box;
				float:left;
				page-break-inside:avoid;
				margin:0.25em;
			}

			.line {
				width:100%;
				box-sizing:border-box;
				padding:0.2em 0.3em;
				text-indent:-1em;
				padding-left:1.3em;
				float:left;
			}

			.tableline {
				width:98%;
				box-sizing:border-box;
				padding:0.2em 0.3em;
				float:left;
			}

			.listcontainer {
				box-sizing:border-box;
				width:100%;
				float:left;

			}

			.groupholder {
				width:100%;
				float:left;
			}

			.grouptitle {
				width:100%;
				font-family:DnDLolth;
				font-size:1.4em;
				font-weight:bold;
			}

			.groupname {
				width:100%;
				font-family:DnDLolth;
				font-size:1.2em;
				font-weight:bold;
			}

			.list {
				margin:0.4em;
				width:97%;
				float:left;
				page-break-inside: avoid;
			}

			@font-face {
				font-family: 'MentorSansStd';
				src: url('../font/MentorSansStd.otf') format('opentype');
				font-weight: normal;
				font-style: normal;

			}

			@font-face {
				font-family: 'MentorSansStd';
				src: url('../font/MentorSansStd-Bold.otf') format('opentype');
				font-weight: bold;
				font-style: normal;

			}

			@font-face {
				font-family: 'DnDLolth';
				src: url('../font/DnDLolth.otf') format('opentype');
				font-weight: normal;
				font-style: normal;

			}

			@font-face {
				font-family: 'MentorSansStd-Light';
				src: url('../font/MentorSansStd-Light.otf') format('opentype');
				font-weight: lighter;
				font-style: normal;

			}

			@font-face {
				font-family: 'MentorSansStd-Light';
				src: url('../font/MentorSansStd-LightIta.otf') format('opentype');
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
					column-gap:0.4em;
				}

				.listcontainer {
					column-count: 2;
					column-gap:0.4em;
				}
			}

			@media only screen and (min-width:1300px) {
				.container {
					column-count: 4;
					column-gap:0.4em;
				}

			}
			@page {
				size: auto;
				margin: 0.7cm 0.6cm 0.9cm;
			}

			@media print {
				.container {
					column-count: 2;
					column-gap:0.4em;
					margin:0cm;
				}

				.listcontainer {
					column-count: 2;
					column-gap:0.5em;
					margin:0cm;
				}

			}


		</style>
	</head>
	<body style="font-family:MentorSansStd, Trebuchet, Verdana, Arial; font-size:9pt;margin:0cm; ">
		<xsl:if test="collection">
         <div style="width:100%; float:left;">
            <div id="collection-header" style="font-family:DnDLolth; width:100%; box-sizing:border-box; padding:0.2em; font-size:1.4em; font-variant:small-caps;">
               <b><xsl:value-of select="collection" /></b>
            </div>
            <div class="line">
               <xsl:apply-templates select="intro"/>
            </div>
         </div>
      </xsl:if>

		<div class="container">
			<xsl:apply-templates select="condition"/>
		</div> <!-- container -->
	</body>
	</html>
</xsl:template>

<xsl:template match="condition">

	<div class="condition">
		<xsl:call-template name="createheader">
			<xsl:with-param name="bgcolor">#1d3d5e</xsl:with-param>
		</xsl:call-template>

			<xsl:for-each select="line">
  				<xsl:variable name="indent" select="number(@indent)" />
  				<xsl:variable name="padding" select="1.3 + ($indent * 1.0)" />

  				<div class="line">
    				<xsl:attribute name="style">
      				<xsl:text>padding-left:</xsl:text>
      				<xsl:value-of select="$padding"/>
      				<xsl:text>em;</xsl:text>
    				</xsl:attribute>
    				<xsl:apply-templates select="."/>
  				</div>
			</xsl:for-each>

	</div>

</xsl:template>

<xsl:template name="if-not-last">
  <xsl:if test="position() != last()">
    <xsl:text>, </xsl:text>
  </xsl:if>
</xsl:template>

<xsl:template match="line[@auto]">
	<xsl:apply-templates select="bullet"/>

	<xsl:choose>
		<xsl:when test="@auto='bard'">
			<xsl:text>If you are a Bard who has proficiency with this weapon, you also have proficiency in this weapon as an implement.</xsl:text>
		</xsl:when>
		<xsl:when test="@auto='bardinstrument'">
			<xsl:text>If you are a Bard, you can use this instrument as an implement for Bard powers.</xsl:text>
		</xsl:when>
		<xsl:when test="@auto='weapliment'">
			<xsl:text>If you are </xsl:text>
			<xsl:apply-templates select="text()"/>
			<xsl:text> who has proficiency with this weapon, you also have proficiency in this weapon as an implement.</xsl:text>
		</xsl:when>
		<xsl:when test="@auto='crit'">
			<xsl:text>When you score a critical hit using this weapon, </xsl:text>
			<xsl:apply-templates />
		</xsl:when>
		<xsl:when test="@auto='critweap'">
			<xsl:text>When you score a critical hit with a </xsl:text><b><span class="keyword" style="float:none; font-variant: small-caps; font-size: 1.05em; width:calc(100% - 0.5em); margin:0.1em;">Weapon</span></b><xsl:text> attack using this weapon, </xsl:text>
			<xsl:apply-templates/>
		</xsl:when>
		<xsl:when test="@auto='critimpl'">
			<xsl:text>When you score a critical hit with an </xsl:text><b><span class="keyword" style="float:none; font-variant: small-caps; font-size: 1.05em; width:calc(100% - 0.5em); margin:0.1em;">Implement</span></b><xsl:text> attack using this implement, </xsl:text>
			<xsl:apply-templates />
		</xsl:when>
		<xsl:when test="@auto='no-opportunity'">
			<xsl:text>Using this power does not trigger </xsl:text><i>reactive strikes</i>
		</xsl:when>
		<xsl:when test="@auto='no-opportunity-target'">
			<xsl:text>Using this power does not trigger </xsl:text><i>reactive strikes</i><xsl:text> from the target</xsl:text>
		</xsl:when>
		<xsl:when test="@auto='ammo'">
			<xsl:text>When using this ammunition, you use the listed attack bonus instead of your own. You add your weapon's proficiency bonus to attack, but not its enhancement bonus or other modifiers.</xsl:text>
		</xsl:when>
		<xsl:when test="@auto='short-surge'">
			<b>Special: </b>
			<xsl:text>As part of a short rest, you can expend a healing surge to recharge this power.</xsl:text>
		</xsl:when>
		<xsl:when test="@auto='telepathy'">
			<xsl:text>You gain telepathy </xsl:text>
			<xsl:apply-templates select="text()"/>
			<xsl:text>, allowing you to communicate with any other creature in your telepathy range that has a language and is within line of sight.</xsl:text>
		</xsl:when>
		<xsl:when test="@auto='limittelepathy'">
			<xsl:text>You gain limited telepathy </xsl:text>
			<xsl:apply-templates select="text()"/>
			<xsl:text>, allowing you to communicate with any </xsl:text>
			<xsl:apply-templates select="@creature" />
			<xsl:apply-templates select="@limittelepathy" />
			<xsl:text> in your telepathy range that shares a language with you and is within line of sight.</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="line[@table]">
   <div class="table-block" style="width:95%; float:left; margin-bottom:0.6em; padding-left:1em;">
      <div class="table-title" style="font-weight:bold; margin-bottom:0.3em;">
         <xsl:value-of select="@table"/>
      </div>
      <xsl:for-each select="row">
         <div class="listline">
            <xsl:attribute name="style">
               <xsl:text>width: 90%; overflow: auto; margin-left: 0.8em; padding: 0.2em;</xsl:text>
               <xsl:if test="position() mod 2 = 1">background:linear-gradient(to right, #dedede, #ececec);</xsl:if>
            </xsl:attribute>
            <div style="width:27%; float:left; text-align:right; padding-right:0.7em;">
               <i><xsl:value-of select="@name"/></i>
            </div>
            <div style="width:calc(73% - 1em); float:left;">
               <xsl:apply-templates/>
            </div>
         </div>
       </xsl:for-each>
  </div>
</xsl:template>

<xsl:template name="createheader">
	<xsl:param name="bgcolor">Purple</xsl:param>

	<div id="header" style="background-color:{$bgcolor}; width:100%; float:left; color:white; ">
		<div id="title" style="float:left; margin:0.4em; margin-top:0.3em; vertical-align:middle; font-size:1.2em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; width:calc(100% - 9.5em);">
			<xsl:value-of select="title"/>
		</div>
	</div>

</xsl:template>

<xsl:template match="bullet">
	&#9658;<xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="name">
	<xsl:choose>
		<xsl:when test="contains(., 'Miss (Level')">
			<b><xsl:apply-templates />: </b>
		</xsl:when>
		<xsl:when test="contains(., 'Effect (Level')">
			<b><xsl:apply-templates />: </b>
		</xsl:when>
		<xsl:when test="contains(., 'Special (Level')">
			<b><xsl:apply-templates />: </b>
		</xsl:when>
		<xsl:when test="contains(., 'Aftereffect')">
			<i><xsl:apply-templates />: </i>
		</xsl:when>
		<xsl:when test="contains(., 'Failed Save')">
			<i><xsl:apply-templates />: </i>
		</xsl:when>
		<xsl:when test="contains(., 'Level')">
			<i><xsl:apply-templates />: </i>
		</xsl:when>
		<xsl:when test="./@style='italic'">
			<i><xsl:apply-templates />: </i>
		</xsl:when>
		<xsl:when test="./@style='under'">
			<u><xsl:apply-templates />:</u><xsl:text> </xsl:text>
		</xsl:when>
		<xsl:when test="name(parent::*) = 'block'">
			<xsl:apply-templates />
		</xsl:when>
		<xsl:otherwise>
			<b><xsl:apply-templates />: </b>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="augment">
	<span style="font-variant:small-caps;"><b>Augment <xsl:apply-templates />: </b></span>
</xsl:template>

<xsl:template match="key">
	<b><span class="keyword" style="float:none; font-variant: small-caps; font-size: 1.05em; width:calc(100% - 0.5em); margin:0.1em;"><xsl:apply-templates/></span></b>
</xsl:template>

<xsl:template match="text()">
   <xsl:value-of select="." disable-output-escaping="yes" />
</xsl:template>

<xsl:template match="b|i">
	<xsl:element name="{name()}">
    <xsl:apply-templates />
  </xsl:element>
</xsl:template>

<xsl:template match="br">
   <br />
</xsl:template>

</xsl:stylesheet>
