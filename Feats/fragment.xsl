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

			.fragment {
				margin:0.2cm;
				width:98%;
				float:left;
				page-break-inside:avoid;
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
	<body style="font-family:MentorSansStd, Trebuchet, Verdana, Arial; font-size:8pt;margin:0cm; ">

		<div class="container">
			<xsl:for-each select="catalog/fragment">
				<div class="fragment">
					<div id ="header" style="background-color:#49070c; box-sizing:border-box; width:100%; float:left; color:white; ">
						<div id="title" style="float:left; margin:0.5em; vertical-align:middle; font-size:1.1em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; max-width:60%;"><xsl:value-of select="title"/></div>
						<div id="tier" style="width: 20%; float:right; text-align:right; font-size: 0.8em; margin:0.5em;"><xsl:value-of select="tier"/> </div>
					</div>

					<div id="fluff" style="font-family:MentorSansStd-Light; background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro); width:100%; box-sizing:border-box; padding:0.3em; float:left;">
						<i><xsl:value-of select="fluff" /> </i>
					</div>
					<div style="width:100%; box-sizing:border-box; padding:0.3em; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div style="width:100%; box-sizing:border-box; font-variant:small-caps; font-weight:bold;">Constant Benefit</div>
						<xsl:for-each select="benefit" >
							<div style="width:100%; box-sizing:border-box; padding:0.2em; text-indent:-1em; padding-left:2.3em; float:left;">
								<xsl:value-of select="." disable-output-escaping="yes"/>
							</div>
						</xsl:for-each>
					</div>
					<div style="width:100%; box-sizing:border-box; padding:0.3em; background:linear-gradient(to right, GhostWhite, Ghostwhite,White);float:left;">
						<div style="width:100%; box-sizing:border-box; font-variant:small-caps; font-weight:bold;">Divine Manifestation
							<xsl:if test="manifestation/keyword" >
								<xsl:text> (</xsl:text>
								<span style="font-weight:normal;">
								<xsl:for-each select="manifestation/keyword">
									<xsl:value-of select="."/>
									<xsl:if test="position()!=last()">
										<xsl:text>, </xsl:text>
									</xsl:if>
								</xsl:for-each>
								</span>
								<xsl:text>)</xsl:text>
							</xsl:if>
							<xsl:text> </xsl:text>&#x25C6; <xsl:text> </xsl:text>
							<xsl:value-of select="manifestation/frequency" />
							<xsl:text> (</xsl:text>
							<xsl:value-of select="manifestation/action" /> <xsl:text> </xsl:text> <xsl:text> </xsl:text><span style="font-weight:normal;"><xsl:value-of select="manifestation/subaction" /></span>
							<xsl:text>)</xsl:text>
						</div>
						<div style="width:100%; box-sizing:border-box; padding:0.2em; text-indent:-1em; padding-left:2.3em; float:left;">
							<b><xsl:text>Trigger: </xsl:text></b><xsl:value-of select="manifestation/trigger" />
						</div>
						<div style="width:100%; box-sizing:border-box; padding:0.2em; text-indent:-1em; padding-left:2.3em; float:left;">
							<b>Effect: </b><xsl:value-of select="manifestation/effect[1]" disable-output-escaping="yes" />
						</div>
						<xsl:for-each select="manifestation/effect[position()>1]">
							<div style="width:100%; box-sizing:border-box; padding:0.2em; text-indent:-1em; padding-left:2.3em; float:left;">
								<xsl:value-of select="." disable-output-escaping="yes"/>
							</div>
						</xsl:for-each>
					</div>
					<div style="width:100%; box-sizing:border-box; padding:0.3em; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
						<div style="width:100%; box-sizing:border-box; font-variant:small-caps; font-weight:bold;">Quirks</div>
						<div style="width:100%; box-sizing:border-box; padding:0.2em; text-indent:-1em; padding-left:2.3em; float:left;">
							<xsl:for-each select="quirk" >
								<i><xsl:value-of select="." disable-output-escaping="yes"/></i>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</div>
					</div>

				</div>
			</xsl:for-each>
		</div> <!-- container -->
	</body>
	</html>
</xsl:template>

</xsl:stylesheet>
