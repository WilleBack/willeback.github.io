<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:import href="../Powers/power.xsl"/>

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
      <div id="classtitle" style="font-family:DnDLolth; background-color:#042151; box-sizing:border-box; width:100%; float:left; font-size:1.6em; padding:0.6em 1em; font-weight:bold; font-variant:small-caps; letter-spacing:1px;" >
         <xsl:value-of select="race/name" />
      </div>
      <div id="classinfo" style="background:linear-gradient(to right, #45494f, #45494f, #6d737c); box-sizing:border-box; width:100%; padding:0.6em 1em; float:left;" >
         <b><xsl:text>Size: </xsl:text></b>  <xsl:value-of select="race/size" /> <xsl:text>; </xsl:text> <b><xsl:text>Origin: </xsl:text></b> <xsl:value-of select="race/origin" /> <xsl:text>; </xsl:text> <b><xsl:text>Type: </xsl:text></b> <xsl:value-of select="race/type" /> <br />
         <span style="font-family:MentorSansStd-Light; font-style:italic;"><xsl:value-of select="race/shortfluff" /></span>
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
         <div id="header" style="font-family:DnDLolth; width:100%; float:left; font-size:1.4em; padding:0.5em 0.4em 0.2em; font-weight:bold; font-variant:small-caps; color:#321001;">
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
               <xsl:choose>
                  <xsl:when test="race/name='Warforged'">
                     <b>Ability scores: </b> <xsl:text>Choose two of the following: </xsl:text><br/>
                     <xsl:for-each select="race/ability">
                        <xsl:text>+2 to </xsl:text> <xsl:value-of select="."/>
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if>
                     </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                     <b>Ability scores: </b> <xsl:text>+2 to </xsl:text><xsl:value-of select="race/ability[1]" />
                     <xsl:if test="count(race/ability)=2"><xsl:text>, </xsl:text></xsl:if>
                     <xsl:if test="count(race/ability)>2"><xsl:text>; </xsl:text><br /></xsl:if>
                     <xsl:for-each select="race/ability[position()>1]">
                        <xsl:text>+2 to </xsl:text> <xsl:value-of select="."/>
                        <xsl:if test="position()!=last()">
                           <xsl:text> or </xsl:text>
                        </xsl:if>
                     </xsl:for-each>
                  </xsl:otherwise>
               </xsl:choose>
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
            <div id="featurename" style="font-family:DnDLolth; width:100%; float:left; font-size:1.3em; padding:0.3em 0.4em 0.2em; font-weight:bold; font-variant:small-caps; color:#321001;">
               <xsl:value-of select="name" />
            </div>
            <xsl:for-each select="benefit">
               <div class="text">
                  <xsl:value-of select="." disable-output-escaping="yes" />
               </div>
            </xsl:for-each>

            <xsl:apply-templates select="power" />

         </div>

         <xsl:if test="subfeature">
            <xsl:for-each select="subfeature">
               <div id="subfeature" style="width:99%; float:left; page-break-inside:avoid; margin: 0 0.2cm;">
                  <xsl:if test="name">
                     <div id="subfeaturename" style="width:100%; float:left; font-size:1.1em; padding:0.3em 0.2em; font-weight:bold; font-variant:small-caps; color:#632003;">
                        <i><xsl:value-of select="name" /></i>
                     </div>
                  </xsl:if>
                  <xsl:for-each select="benefit">
                     <div class="text">
                        <xsl:value-of select="." disable-output-escaping="yes" />
                     </div>
                  </xsl:for-each>

                   <xsl:apply-templates select="power" />
               </div>
            </xsl:for-each>
         </xsl:if>




      </xsl:for-each>


   </div>  <!-- container -->
   </body>
   </html>
</xsl:template>

</xsl:stylesheet>
