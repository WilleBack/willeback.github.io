<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
   <html>
   <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <title><xsl:value-of select="race/name" /></title>
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
            width:95%;
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
      <div id="classtitle" style="background-color:#042151; box-sizing:border-box; width:100%; float:left; font-size:1.6em; padding:1em 1em; font-weight:bold; font-variant:small-caps; letter-spacing:1px;" >
         <xsl:value-of select="race/name" />
      </div>
      <div id="classinfo" style="background:linear-gradient(to right, #45494f, #45494f, #6d737c); box-sizing:border-box; width:100%; padding:1em; float:left;" >
         <b><xsl:text>Size: </xsl:text></b>  <xsl:value-of select="race/size" /> <xsl:text>; </xsl:text> <b><xsl:text>Origin: </xsl:text></b> <xsl:value-of select="race/origin" /> <xsl:text>; </xsl:text> <b><xsl:text>Type: </xsl:text></b> <xsl:value-of select="race/type" /> <br />
         <i><xsl:value-of select="race/shortfluff" /></i>
      </div>
   </div> <!-- class header -->

   <div class="container">

      <div class="feature">
         <img src="image.png" style="width:100%;" />
      </div>

      <div class="feature">
         <xsl:for-each select="race/fluff">
            <div id="fluff" style="width:100%; box-sizing:border-box; padding:0.3em; text-indent:-1em; padding-left:1.3em; float:left; page-break-inside:avoid;">
               <xsl:value-of select="." />
            </div>
         </xsl:for-each>
      </div>

      <div id="block" style="background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro); width:100%; box-sizing:border-box; padding:0.3em; float:left; page-break-inside:avoid;">
         <div id="header" style="width:100%; float:left; font-size:1.4em; padding:0.5em 0.4em 0.2em; font-weight:bold; font-variant:small-caps; color:#321001;">
            <xsl:text>Racial Traits</xsl:text>
         </div>

         <div class="blockdiv">
            <div style="width:100%;">
               <b>Average Height: </b> <xsl:value-of select="race/height" />
            </div>
            <div style="width:100%;">
               <b>Average Weight: </b> <xsl:value-of select="race/weight" /> <xsl:text> lbs</xsl:text>
            </div>
         </div>

         <div class="blockdiv">
            <div style="100%;">
               <b>Ability scores: </b> <xsl:text>+2 to </xsl:text><xsl:value-of select="race/ability[1]" />
               <xsl:if test="count(race/ability)=2"><xsl:text>, </xsl:text></xsl:if>
               <xsl:if test="count(race/ability)>2"><xsl:text>; </xsl:text><br /></xsl:if>
               <xsl:for-each select="race/ability[position()>1]">
                  <xsl:text>+2 to </xsl:text> <xsl:value-of select="."/>
                  <xsl:if test="position()!=last()">
                     <xsl:text> or </xsl:text>
                  </xsl:if>
               </xsl:for-each>
            </div>
            <div style="100%;">
               <b>Speed: </b> <xsl:value-of select="race/speed" /> <xsl:text> squares</xsl:text>
            </div>
            <div style="100%;">
               <b>Vision: </b> <xsl:value-of select="race/vision" />
            </div>
         </div> <!-- blockdiv -->

         <div class="blockdiv">
            <div style="width:100%;">
               <b>Languages: </b>
               <xsl:for-each select="race/language">
                  <xsl:value-of select="." />
                  <xsl:if test="position()!=last()">
                     <xsl:text>, </xsl:text>
                  </xsl:if>
               </xsl:for-each>
            </div>
            <xsl:for-each select="race/trait">
               <div style="width=100%;">
                  <b><xsl:value-of select="name" />: </b> <xsl:value-of select="description[1]" disable-output-escaping="yes" />
               </div>
               <xsl:for-each select="description[position()>1]">
                  <div style="width:100%;">
                     <xsl:value-of select="." disable-output-escaping="yes" />
                  </div>
               </xsl:for-each>
            </xsl:for-each>
         </div> <!-- blockdiv -->

      </div> <!-- block -->

      <div class="feature">
         <xsl:apply-templates select="race/feature[1]" />
      </div>

      <xsl:for-each select="race/feature[position()>1]">
         <div class="feature">
            <div id="featurename" style="width:100%; float:left; font-size:1.3em; padding:0.3em 0.4em 0.2em; font-weight:bold; font-variant:small-caps; color:#321001;">
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

         <xsl:if test="subfeature">
            <xsl:for-each select="subfeature">
               <div id="subfeature" style="width:98%; float:left; page-break-inside:avoid; margin: 0 0.2cm;">
                  <div id="subfeaturename" style="width:100%; float:left; font-size:1.1em; padding:0.3em 0.2em; font-weight:bold; font-variant:small-caps; color:#632003;">
                     <i><xsl:value-of select="name" /></i>
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
