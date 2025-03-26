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
			<div class="power" style="margin:0.3em 0.1em; width:calc(100% - 1em); float:left; break-inside:avoid; border: 0.25em solid #619869; border-radius: 0.2em;">
				<xsl:call-template name="createheader">
					<xsl:with-param name="bgcolor">#619869</xsl:with-param>
				</xsl:call-template>

					<xsl:apply-templates select="section"/>

					<xsl:apply-templates select="part" />
			</div>
		</xsl:when>
		<xsl:when test="frequency = 'Encounter' or (not(frequency) and part[1]/frequency='Encounter')">
			<div class="power" style="margin:0.3em 0.1em; width:calc(100% - 1em); float:left; break-inside:avoid; border: 0.25em solid #961334; border-radius: 0.2em;">
				<xsl:call-template name="createheader">
					<xsl:with-param name="bgcolor">#961334</xsl:with-param>
				</xsl:call-template>

					<xsl:apply-templates select="section"/>

					<xsl:apply-templates select="part" />
			</div>
		</xsl:when>
		<xsl:when test="frequency = 'Daily' or (not(frequency) and part[1]/frequency='Daily')">
			<div class="power" style="margin:0.3em 0.1em; width:calc(100% - 1em); float:left; break-inside:avoid; border: 0.25em solid #4d4d4f; border-radius: 0.2em;">
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

	<xsl:apply-templates select="aspect" />

</xsl:template>

	<xsl:template name="createheader">
		<xsl:param name="bgcolor">Purple</xsl:param>

		<div class="header" style="width:100%; float:left; color:white;background-color:{$bgcolor};">
			<div class="titlebox" style="float:left; margin:0.3em; vertical-align:middle; width:calc(100% - 0.25em);">
				<div class="classcat" style="float:right; text-align:right; font-size: 0.7em; margin:0.4em; margin-top: 0em; margin-bottom:0.2em; max-width:8em;">
					<xsl:value-of select="class"/><br />
					<xsl:value-of select="category"/>
					<xsl:if test="level">
						<xsl:text> </xsl:text><xsl:value-of select="level"/>
					</xsl:if>
				</div>
				<div class="title" style="width:calc(100% - 7em); float:left; font-size:1.2em; text-indent:-1em; margin-left:1.2em;">

					<span class="titletext" style="font-variant: small-caps; font-weight:bold; letter-spacing:1px;"><xsl:value-of select="title"/></span>
				</div>

				<xsl:if test="frequency or action">
					<div class="freqact" style="width:calc(100% - 7em); font-size:1.05em; margin:0.2em; margin-top:0.1em; float:left;">
						<xsl:if test="frequency">
							<b><xsl:value-of select="frequency" /></b>
							<xsl:if test="action">
								&#x25C6;
							</xsl:if>
						</xsl:if>
						<b> <xsl:value-of select="action" /></b><xsl:text> </xsl:text>
						<xsl:choose>
							<xsl:when test="subaction=''">
								<xsl:text>Action</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="subaction" />
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</xsl:if>
			</div>
		</div>

		<div class="fluff" style="font-family:MentorSansStd-Light; background:linear-gradient(to right, #D6D6C2, #ebebe0); width:calc(100% - 0.1em); box-sizing:border-box; padding:0.3em; float:left;">
			<i><xsl:value-of select="fluff"/></i>
		</div>
		<xsl:if test="keyword">
			<div class="keyword" style="font-variant: small-caps; font-size: 1.1em; float:left; width:calc(100% - 0.5em); margin:0.2em;">
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
		<xsl:if test="name or part-name or frequency or action">
			<div class="header" style="float:left; width:100%; background:linear-gradient(to right, #D6D6C2, #ebebe0); ">
				<div class="titlebox" style="float:left; margin:0.3em; vertical-align:middle; width: calc(100% - 1em);">
			      <xsl:if test="name or part-name">
			      	<div class="title" style="width:calc(100% - 1em); float:left; font-size:1.2em; text-indent:-1em; margin-left:1.2em;">
			      		<span class="titletext" style="font-variant: small-caps; font-weight:bold; letter-spacing:1px;"><i>
								<xsl:choose>
									<xsl:when test="name/@attack">
										<!-- <xsl:value-of select="../title"/>--><xsl:text> Attack Technique</xsl:text>
									</xsl:when>
									<xsl:when test="name/@movement">
										<!-- <xsl:value-of select="../title"/>--><xsl:text> Movement Technique</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="name"/><xsl:value-of select="part-name"/>
									</xsl:otherwise>
								</xsl:choose>
							</i></span>
						</div>
				   </xsl:if>
				   <xsl:if test="frequency or action">
				   	<div class="freqact" style="width:calc(100% - 0.09em); font-size:1.05em; margin:0.2em; margin-top:0em; float:left;">
							<xsl:if test="frequency">
						   	<b><xsl:value-of select="frequency" /> </b>
								<xsl:if test="action">
						   		&#x25C6;
								</xsl:if>
							</xsl:if>
						   <b> <xsl:value-of select="action" /></b><xsl:text> </xsl:text>
							<xsl:choose>
								<xsl:when test="subaction=''">
									<xsl:text>Action</xsl:text>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="subaction" />
								</xsl:otherwise>
							</xsl:choose>
					   </div>
				   </xsl:if>
					<xsl:if test="fluff">
						<div class="fluff" style="font-family:MentorSansStd-Light; background:linear-gradient(to right, #D6D6C2, #ebebe0); width:calc(100% - 0.1em); box-sizing:border-box; padding:0.3em; float:left;">
							<i><xsl:value-of select="fluff"/></i>
						</div>
					</xsl:if>
			   </div>
			</div>
		</xsl:if>

		<xsl:if test="keyword">
			<div class="keyword" style="margin-top:0em; font-variant: small-caps; font-size: 1.1em; float:left; width:calc(100% - 0.5em); margin:0.2em;"><b>
				<xsl:for-each select="keyword">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</b></div>
		</xsl:if>

		<xsl:if test="type">
			<div class="section" style="width:calc(100% - 0.1em); box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; float:left; padding-left:1.2em;">
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
		<xsl:when test="indent='1' or @indent='1'">
			<xsl:call-template name="buildsection">
				<xsl:with-param name="leftindent">2.4em</xsl:with-param>
			</xsl:call-template>
		</xsl:when>
		<xsl:when test="indent='2' or @indent='1'">
			<xsl:call-template name="buildsection">
				<xsl:with-param name="leftindent">3.9em</xsl:with-param>
			</xsl:call-template>
		</xsl:when>
		<xsl:when test="indent='3' or @indent='3'">
			<xsl:call-template name="buildsection">
				<xsl:with-param name="leftindent">5.4em</xsl:with-param>
			</xsl:call-template>
		</xsl:when>
		<xsl:when test="indent='4' or @indent='4'">
			<xsl:call-template name="buildsection">
				<xsl:with-param name="leftindent">6.9em</xsl:with-param>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="buildsection">
				<xsl:with-param name="leftindent">0.9em</xsl:with-param>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="augment"/>

<xsl:template match="aspect">
	<xsl:choose>
		<xsl:when test="frequency='At-Will'">

			<div id="part" style="width:95%; box-sizing:border-box; float:left; margin: 0.3em; border-top: 0.5em solid white; break-inside: avoid; border: 0.25em solid #619869; border-radius: 0.2em;">
				<xsl:if test="name or part-name or frequency">
					<div class="header" style="float:left; width:100%; background:linear-gradient(to right, #D6D6C2, #ebebe0); ">
						<div class="titlebox" style="float:left; margin:0.3em; vertical-align:middle; width: calc(100% - 1em);">
					      <xsl:if test="name or part-name">
					      	<div class="title" style="width:calc(100% - 1em); float:left; font-size:1.2em; text-indent:-1em; margin-left:1.2em;">
					      		<span class="titletext" style="font-variant: small-caps; font-weight:bold; letter-spacing:1px;"><i><xsl:value-of select="name"/><xsl:value-of select="part-name"/></i></span>
								</div>
						   </xsl:if>
						   <xsl:if test="frequency or action">
						   	<div class="freqact" style="width:calc(100% - 0.09em); font-size:1.05em; margin:0.2em; margin-top:0em; float:left;">
								   <b><xsl:value-of select="frequency" /> </b>
								   &#x25C6;
								   <b> <xsl:value-of select="action" /></b><xsl:text> </xsl:text>
									<xsl:choose>
										<xsl:when test="subaction=''">
											<xsl:text>Action</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="subaction" />
										</xsl:otherwise>
									</xsl:choose>
							   </div>
						   </xsl:if>
							<xsl:if test="fluff">
								<div class="fluff" style="font-family:MentorSansStd-Light; background:linear-gradient(to right, #D6D6C2, #ebebe0); width:calc(100% - 0.1em); box-sizing:border-box; padding:0.3em; float:left;">
									<i><xsl:value-of select="fluff"/></i>
								</div>
							</xsl:if>
					   </div>
					</div>
				</xsl:if>

				<xsl:if test="keyword">
					<div class="keyword" style="margin-top:0em; font-variant: small-caps; font-size: 1.1em; float:left; width:calc(100% - 0.5em); margin:0.2em;"><b>
						<xsl:for-each select="keyword">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</b></div>
				</xsl:if>

				<xsl:if test="type">
					<div class="section" style="width:calc(100% - 0.1em); box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; float:left; padding-left:1.2em;">
						<b><xsl:value-of select="type"/></b>&#160;<xsl:value-of select="range" disable-output-escaping="yes"/>
						<xsl:if test="type2">
							<xsl:text> or </xsl:text><b><xsl:value-of select="type2"/></b>&#160;<xsl:value-of select="range2" disable-output-escaping="yes"/>
						</xsl:if>
					</div>
				</xsl:if>

				<xsl:apply-templates select="section"/>

			</div>
		</xsl:when>
		<xsl:when test="frequency='Encounter'">

			<div id="part" style="width:95%; box-sizing:border-box; float:left; margin: 0.3em; border-top: 0.5em solid white; break-inside: avoid; border: 0.25em solid #961334; border-radius: 0.2em;">
				<xsl:if test="name or part-name or frequency">
					<div class="header" style="float:left; width:100%; background:linear-gradient(to right, #D6D6C2, #ebebe0); ">
						<div class="titlebox" style="float:left; margin:0.3em; vertical-align:middle; width: calc(100% - 1em);">
					      <xsl:if test="name or part-name">
					      	<div class="title" style="width:calc(100% - 1em); float:left; font-size:1.2em; text-indent:-1em; margin-left:1.2em;">
					      		<span class="titletext" style="font-variant: small-caps; font-weight:bold; letter-spacing:1px;"><i><xsl:value-of select="name"/><xsl:value-of select="part-name"/></i></span>
								</div>
						   </xsl:if>
						   <xsl:if test="frequency">
						   	<div class="freqact" style="width:calc(100% - 0.09em); font-size:1.05em; margin:0.2em; margin-top:0em; float:left;">
								   <b><xsl:value-of select="frequency" /> </b>
								   &#x25C6;
								   <b> <xsl:value-of select="action" /></b><xsl:text> </xsl:text><xsl:value-of select="subaction" />
							   </div>
						   </xsl:if>
							<xsl:if test="fluff">
								<div class="fluff" style="font-family:MentorSansStd-Light; background:linear-gradient(to right, #D6D6C2, #ebebe0); width:calc(100% - 0.1em); box-sizing:border-box; padding:0.3em; float:left;">
									<i><xsl:value-of select="fluff"/></i>
								</div>
							</xsl:if>
					   </div>
					</div>
				</xsl:if>

				<xsl:if test="keyword">
					<div class="keyword" style="margin-top:0em; font-variant: small-caps; font-size: 1.1em; float:left; width:calc(100% - 0.5em); margin:0.2em;"><b>
						<xsl:for-each select="keyword">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</b></div>
				</xsl:if>

				<xsl:if test="type">
					<div class="section" style="width:calc(100% - 0.1em); box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; float:left; padding-left:1.2em;">
						<b><xsl:value-of select="type"/></b>&#160;<xsl:value-of select="range" disable-output-escaping="yes"/>
						<xsl:if test="type2">
							<xsl:text> or </xsl:text><b><xsl:value-of select="type2"/></b>&#160;<xsl:value-of select="range2" disable-output-escaping="yes"/>
						</xsl:if>
					</div>
				</xsl:if>

				<xsl:apply-templates select="section"/>

			</div>
		</xsl:when>
		<xsl:when test="frequency='Daily'">

			<div id="part" style="width:95%; box-sizing:border-box; float:left; margin: 0.3em; border-top: 0.5em solid white; break-inside: avoid; border: 0.25em solid #4d4d4f; border-radius: 0.2em;">
				<xsl:if test="name or part-name or frequency">
					<div class="header" style="float:left; width:100%; background:linear-gradient(to right, #D6D6C2, #ebebe0); ">
						<div class="titlebox" style="float:left; margin:0.3em; vertical-align:middle; width: calc(100% - 1em);">
					      <xsl:if test="name or part-name">
					      	<div class="title" style="width:calc(100% - 1em); float:left; font-size:1.2em; text-indent:-1em; margin-left:1.2em;">
					      		<span class="titletext" style="font-variant: small-caps; font-weight:bold; letter-spacing:1px;"><i><xsl:value-of select="name"/><xsl:value-of select="part-name"/></i></span>
								</div>
						   </xsl:if>
						   <xsl:if test="frequency">
						   	<div class="freqact" style="width:calc(100% - 0.09em); font-size:1.05em; margin:0.2em; margin-top:0em; float:left;">
								   <b><xsl:value-of select="frequency" /> </b>
								   &#x25C6;
								   <b> <xsl:value-of select="action" /></b><xsl:text> </xsl:text><xsl:value-of select="subaction" />
							   </div>
						   </xsl:if>
							<xsl:if test="fluff">
								<div class="fluff" style="font-family:MentorSansStd-Light; background:linear-gradient(to right, #D6D6C2, #ebebe0); width:calc(100% - 0.1em); box-sizing:border-box; padding:0.3em; float:left;">
									<i><xsl:value-of select="fluff"/></i>
								</div>
							</xsl:if>
					   </div>
					</div>
				</xsl:if>

				<xsl:if test="keyword">
					<div class="keyword" style="margin-top:0em; font-variant: small-caps; font-size: 1.1em; float:left; width:calc(100% - 0.5em); margin:0.2em;"><b>
						<xsl:for-each select="keyword">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</b></div>
				</xsl:if>

				<xsl:if test="type">
					<div class="section" style="width:calc(100% - 0.1em); box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; float:left; padding-left:1.2em;">
						<b><xsl:value-of select="type"/></b>&#160;<xsl:value-of select="range" disable-output-escaping="yes"/>
						<xsl:if test="type2">
							<xsl:text> or </xsl:text><b><xsl:value-of select="type2"/></b>&#160;<xsl:value-of select="range2" disable-output-escaping="yes"/>
						</xsl:if>
					</div>
				</xsl:if>

				<xsl:apply-templates select="section"/>

			</div>
		</xsl:when>
		<xsl:otherwise>
			<div id="part" style="width:95%; box-sizing:border-box; float:left; margin: 0.3em; border-top: 0.5em solid white; break-inside: avoid;">
				<xsl:if test="name or part-name or frequency">
					<div class="header" style="float:left; width:100%; background:linear-gradient(to right, #D6D6C2, #ebebe0); ">
						<div class="titlebox" style="float:left; margin:0.3em; vertical-align:middle; width: calc(100% - 1em);">
					      <xsl:if test="name or part-name">
					      	<div class="title" style="width:calc(100% - 1em); float:left; font-size:1.2em; text-indent:-1em; margin-left:1.2em;">
					      		<span class="titletext" style="font-variant: small-caps; font-weight:bold; letter-spacing:1px;"><i><xsl:value-of select="name"/><xsl:value-of select="part-name"/></i></span>
								</div>
						   </xsl:if>
						   <xsl:if test="frequency">
						   	<div class="freqact" style="width:calc(100% - 0.09em); font-size:1.05em; margin:0.2em; margin-top:0em; float:left;">
								   <b><xsl:value-of select="frequency" /> </b>
								   &#x25C6;
								   <b> <xsl:value-of select="action" /></b><xsl:text> </xsl:text><xsl:value-of select="subaction" />
							   </div>
						   </xsl:if>
							<xsl:if test="fluff">
								<div class="fluff" style="font-family:MentorSansStd-Light; background:linear-gradient(to right, #D6D6C2, #ebebe0); width:calc(100% - 0.1em); box-sizing:border-box; padding:0.3em; float:left;">
									<i><xsl:value-of select="fluff"/></i>
								</div>
							</xsl:if>
					   </div>
					</div>
				</xsl:if>

				<xsl:if test="keyword">
					<div class="keyword" style="margin-top:0em; font-variant: small-caps; font-size: 1.1em; float:left; width:calc(100% - 0.5em); margin:0.2em;"><b>
						<xsl:for-each select="keyword">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</b></div>
				</xsl:if>

				<xsl:if test="type">
					<div class="section" style="width:calc(100% - 0.1em); box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; float:left; padding-left:1.2em;">
						<b><xsl:value-of select="type"/></b>&#160;<xsl:value-of select="range" disable-output-escaping="yes"/>
						<xsl:if test="type2">
							<xsl:text> or </xsl:text><b><xsl:value-of select="type2"/></b>&#160;<xsl:value-of select="range2" disable-output-escaping="yes"/>
						</xsl:if>
					</div>
				</xsl:if>

				<xsl:apply-templates select="section"/>

			</div>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="buildsection">
	<xsl:param name="leftindent">20em</xsl:param>

	<xsl:choose>
		<xsl:when test="shade or @shade ='true' or @shade or @temp">
			<xsl:choose>
	  		 	<xsl:when test="name or bullet or @bullet or @auto or @special or @personal or keyword or type">
		  			<div class="section" style="width:calc(100% - 0.1em); box-sizing:border-box; padding:0.2em 0.3em; text-indent:-0.7em; float:left; background:linear-gradient(to right, #D6D6C2, #ebebe0); padding-left:{$leftindent};">
              <xsl:call-template name="section-content"/>
		  		 	</div>
		  		</xsl:when>
		  		<xsl:otherwise>
		  			<div class="section" style="width:calc(100% - 0.1em); box-sizing:border-box; padding:0.2em 0.3em; text-indent:0.5em; float:left; background:linear-gradient(to right, #D6D6C2, #ebebe0); padding-left:{$leftindent};">
              <xsl:call-template name="section-content"/>
		  		 	</div>
		  		</xsl:otherwise>
		  	</xsl:choose>
		</xsl:when>
		<xsl:otherwise>
			<xsl:choose>
	   		<xsl:when test="name or bullet or @bullet or @auto or @special or @personal or keyword or type">
	   		  <div class="section" style="width:calc(100% - 0.1em); box-sizing:border-box; padding:0.2em 0.3em; text-indent:-0.7em; float:left; padding-left:{$leftindent};">
					  <xsl:call-template name="section-content"/>
	   		  </div>
	   	  </xsl:when>
	   	  <xsl:otherwise>
	   		  <div class="section" style="width:calc(100% - 0.1em); box-sizing:border-box; padding:0.2em 0.3em; text-indent:0.5em; float:left; padding-left:{$leftindent};">
					  <xsl:call-template name="section-content"/>
	   		  </div>
	   	  </xsl:otherwise>
	     </xsl:choose>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="section-content">
  <xsl:if test="bullet or @style='bullet' or @bullet">
    &#9658;<xsl:text> </xsl:text>
  </xsl:if>

  <xsl:if test="@auto='channeldivinity'">
    <b>Channel Divinity:&#160;</b>
    <xsl:text>One Channel Divinity power per encounter.</xsl:text>
  </xsl:if>
  <xsl:if test="@auto='no-opportunity'">
    <xsl:text>Using this power does not trigger </xsl:text><i>reactive strikes</i>
  </xsl:if>
  <xsl:if test="@auto='no-opportunity-target'">
    <xsl:text>Using this power does not trigger </xsl:text><i>reactive strikes</i><xsl:text> from the target</xsl:text>
  </xsl:if>
  <xsl:if test="@auto='basic-melee'">
    <b>Special:&#160;</b>
    <xsl:text>You can use this attack in place of a </xsl:text><i>melee basic attack</i><xsl:text>. </xsl:text>
  </xsl:if>
  <xsl:if test="@auto='basic-ranged'">
    <b>Special:&#160;</b>
    <xsl:text>You can use this attack in place of a </xsl:text><i>ranged basic attack</i><xsl:text>. </xsl:text>
  </xsl:if>
  <xsl:if test="@auto='basic-both'">
    <b>Special:&#160;</b>
    <xsl:text>You can use this attack in place of a </xsl:text><i>basic attack</i><xsl:text>. </xsl:text>
  </xsl:if>
  <xsl:if test="@auto='basic-melee-counts'">
    <b>Special:&#160;</b>
    <xsl:text>This power counts as a </xsl:text><i>melee basic attack</i><xsl:text>. </xsl:text>
  </xsl:if>
  <xsl:if test="@auto='basic-ranged-counts'">
    <b>Special:&#160;</b>
    <xsl:text>This power counts as a </xsl:text><i>melee basic attack</i><xsl:text>. </xsl:text>
  </xsl:if>
  <xsl:if test="@auto='basic-both-counts'">
    <b>Special:&#160;</b>
    <xsl:text>This power counts as a </xsl:text><i>basic attack</i><xsl:text>. </xsl:text>
  </xsl:if>
  <xsl:if test="@auto='basic-melee-opportunity'">
    <b>Special:&#160;</b>
    <xsl:text>You can use this attack in place of a </xsl:text><i>melee basic attack</i><xsl:text> when making a </xsl:text><i>reactive strike</i><xsl:text>. </xsl:text>
  </xsl:if>
  <xsl:if test="@auto='charge-effect'">
    <b>Effect:&#160;</b>
    <xsl:text>You charge and use this attack in place of a </xsl:text><i>melee basic attack</i><xsl:text>. If an effect allows you to charge, you can use this power. </xsl:text>
  </xsl:if>
  <xsl:if test="@auto='charge-special'">
    <b>Special:&#160;</b>
    <xsl:text>You can use this attack in place of a </xsl:text><i>melee basic attack</i><xsl:text> when charging. </xsl:text>
  </xsl:if>
  <xsl:if test="@auto='req-twomelee'">
    <b>Requirement:&#160;</b>
    <xsl:text>You must be wielding two melee weapons.</xsl:text>
  </xsl:if>
  <xsl:if test="@auto='req-ranger'">
    <b>Requirement:&#160;</b>
    <xsl:text>You must be wielding two melee weapons, or a ranged weapon.</xsl:text>
  </xsl:if>
  <xsl:if test="@auto='prereq-wildshape'">
    <b>Prerequisite:&#160;</b>
    <xsl:text>You must have the </xsl:text><i>wild shape</i><xsl:text> class power.</xsl:text>
  </xsl:if>
  <xsl:if test="@auto='powerstrike'">
    <b>Special:&#160;</b>
    <i>Power strike</i><xsl:text> can be chosen at all encounter attack levels, allowing you to use it more than once per encounter. You can only use one </xsl:text><i>power strike</i><xsl:text> per triggering attack.</xsl:text>
  </xsl:if>
  <xsl:if test="@auto='dreadsmite'">
    <b>Special:&#160;</b>
    <i>Dread smite</i><xsl:text> can be chosen at all encounter attack levels, allowing you to use it more than once per encounter. You can only use one </xsl:text><i>dread smite</i><xsl:text> per triggering attack.</xsl:text>
  </xsl:if>
  <xsl:if test="@auto='holysmite'">
    <b>Special:&#160;</b>
    <i>Holy smite</i><xsl:text> can be chosen at all encounter attack levels, allowing you to use it more than once per encounter. You can only use one </xsl:text><i>holy smite</i><xsl:text> per triggering attack.</xsl:text>
  </xsl:if>
  <xsl:if test="@auto='weapon-implement'">
    <b>Special:&#160;</b>
    <xsl:text>You make this attack as either a melee </xsl:text><b><span class="keyword" style="float:none; font-variant: small-caps; font-size: 1.05em; width:calc(100% - 0.5em); margin:0.1em;">Weapon</span></b><xsl:text> attack or a ranged </xsl:text><b><span class="keyword" style="float:none; font-variant: small-caps; font-size: 1.05em; width:calc(100% - 0.5em); margin:0.1em;">Implement</span></b><xsl:text> attack.</xsl:text>
  </xsl:if>
  <xsl:if test="@auto='personal' or @personal">
    <b>Personal</b>
  </xsl:if>
  <xsl:if test="@auto='special' or @special">
    <b>Special</b>
  </xsl:if>

  <xsl:apply-templates />
</xsl:template>

<xsl:template match="name">
	<xsl:choose>
		<xsl:when test="../name-style='italic' or @style='italic'">
			<i><xsl:apply-templates />&#160;</i>
		</xsl:when>
		<xsl:when test="../name-style='bold' or @style='bold'">
			<b><xsl:apply-templates />&#160;</b>
		</xsl:when>
		<xsl:when test="../name-style or @style">
			<xsl:apply-templates />&#160;
		</xsl:when>
		<xsl:when test="@vestige">
			<b><i>Eyes of the Vestige</i> Augment:</b>&#160;
		</xsl:when>
      <xsl:when test="contains(., 'Miss (Level')">
			<b><xsl:apply-templates />&#160;</b>
		</xsl:when>
		<xsl:when test="contains(., 'Effect (Level')">
			<b><xsl:apply-templates />&#160;</b>
		</xsl:when>
		<xsl:when test="contains(., 'Special (Level')">
			<b><xsl:apply-templates />&#160;</b>
		</xsl:when>
		<xsl:when test="contains(., 'Aftereffect')">
			<i><xsl:apply-templates />&#160;</i>
		</xsl:when>
		<xsl:when test="contains(., 'Failed Save')">
			<i><xsl:apply-templates />&#160;</i>
		</xsl:when>
		<xsl:when test="contains(., 'Level')">
			<i><xsl:apply-templates />&#160;</i>
		</xsl:when>
		<xsl:when test="contains(., 'Alternative:')">
			<i><xsl:apply-templates />&#160;</i>
		</xsl:when>
		<xsl:otherwise>
			<b><xsl:apply-templates />&#160;</b>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="type">
	<xsl:choose>
		<xsl:when test="not(../name) or @style='bold'">
			<xsl:choose>
            <xsl:when test="../@name">
               <i><xsl:apply-templates/></i>
            </xsl:when>
            <xsl:otherwise>
               <b><xsl:apply-templates/></b>
            </xsl:otherwise>
         </xsl:choose>
		</xsl:when>
		<xsl:otherwise>
			<i><xsl:apply-templates/></i>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="range">
	<xsl:text> </xsl:text><xsl:apply-templates/>
</xsl:template>

<xsl:template match="target">
	<xsl:text>&#160;(</xsl:text><xsl:apply-templates/><xsl:text>)</xsl:text>
	<xsl:if test="../type2='Personal' or not(../target2)">
		<br />
	</xsl:if>
</xsl:template>

<xsl:template match="type2">
	<xsl:text> or </xsl:text>
	<xsl:choose>
		<xsl:when test="not(../name) or @style='bold'">
			<xsl:choose>
            <xsl:when test="../@name">
               <i><xsl:apply-templates/></i>
            </xsl:when>
            <xsl:otherwise>
               <b><xsl:apply-templates/></b>
            </xsl:otherwise>
         </xsl:choose>
		</xsl:when>
		<xsl:otherwise>
			<i><xsl:apply-templates/></i>
		</xsl:otherwise>
	</xsl:choose>
	<xsl:if test="not(../range2)">
		<br />
	</xsl:if>
</xsl:template>

<xsl:template match="range2">
	<xsl:text> </xsl:text><xsl:apply-templates/>
</xsl:template>

<xsl:template match="target2">
	<xsl:text>&#160;(</xsl:text><xsl:apply-templates/><xsl:text>)</xsl:text>
	<br/>
</xsl:template>

<xsl:template match="shade"/>
<xsl:template match="name-style"/>
<xsl:template match="indent"/>

<xsl:template match="keyword">
	<xsl:text>This power gains the </xsl:text>
	<b><span class="keyword" style="float:none; font-variant: small-caps; font-size: 1.1em; width:calc(100% - 0.5em); margin:0.2em;"><xsl:apply-templates/></span></b>
	<xsl:text> keyword</xsl:text>
</xsl:template>

<xsl:template match="key">
	<b><span class="keyword" style="float:none; font-variant: small-caps; font-size: 1.05em; width:calc(100% - 0.5em); margin:0.1em;"><xsl:apply-templates/></span></b>
</xsl:template>

<xsl:template match="text()">
  <xsl:choose>
    <xsl:when test="not(normalize-space(.))"/>
    <xsl:otherwise>
      <xsl:value-of select="." disable-output-escaping="yes" />
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

<xsl:template match="b">
   <b><xsl:apply-templates /></b>
</xsl:template>

<xsl:template match="i">
   <i><xsl:apply-templates /></i>
</xsl:template>

<xsl:template match="br">
   <br />
</xsl:template>

</xsl:stylesheet>
