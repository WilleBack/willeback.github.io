<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="../Powers/power.xsl"/>

<xsl:template match="/deity">
	<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<style>
			.container {
				box-sizing:border-box;
				float:left;
			}

			.item {
			background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro);
				margin:0.2cm;
				width:97%;
				float:left;
				page-break-inside:avoid;
			}

			.pricetable {
				box-sizing:border-box;
				width: 100%;
				column-count: 2;
				column-gap:.3em;
			}

			.priceline {
				width:100%;
				box-sizing:border-box;
				float:left;
				page-break-inside:avoid;
				margin:0.2em;
			}

			.line {
				width:100%;
				box-sizing:border-box;
				padding:0.2em 0.3em;
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

				.listcontainer {
					column-count: 2;
					column-gap:0.6em;
					margin:0cm;
				}

			}


		</style>
	</head>
	<body style="font-family:MentorSansStd, Trebuchet, Verdana, Arial; font-size:9pt;margin:0cm; ">
		<div class="container">

				<div class="item">
               <div class="grouptitle" style="box-sizing:border-box; background-color:#042151; color:white; width:100%; padding:0.4em 0.6em;">
                  <xsl:value-of select="name" />
                  <xsl:if test="title">
                     <xsl:text>, </xsl:text> <xsl:value-of select="title" />
                  </xsl:if>
               </div>
               <div class="line">
                  <b>Type: </b> <xsl:value-of select="type" />
               </div>
               <div class="line">
                  <b>Alignment: </b> <xsl:value-of select="alignment" />
               </div>
               <div class="line">
                  <b>Gender: </b> <xsl:value-of select="gender" />
               </div>
               <div class="line">
                  <b>Domain: </b>
                  <xsl:for-each select="domain">
                     <xsl:value-of select="." />
                     <xsl:if test="position()!=last()">
                        <xsl:text>, </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </div>
            </div>

            <div id="textcontainer" style="page-break-inside:avoid; float:left;">
               <xsl:for-each select="text">
                  <div class="line" style="page-break-inside:avoid;">
                     <xsl:value-of select="." />
                  </div>
               </xsl:for-each>
            </div>
			</div>

         <xsl:if test="power">
				<div class="grouptitle" style="padding-bottom:0.6em;">
					<xsl:text>Channel Divinity Powers Offered by </xsl:text> <xsl:value-of select="name" /> <xsl:text>:</xsl:text>
				</div>
            <div class="container">

               <xsl:apply-templates select="power" />
            </div>
         </xsl:if>

	</body>
	</html>
</xsl:template>

</xsl:stylesheet>
