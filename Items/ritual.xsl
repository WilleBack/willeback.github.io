<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/catalog">
   <html>
   <head>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <style>
         .container {

            box-sizing:border-box;
            float:left;
         }

         .ritual {
            background:linear-gradient(to right, #f5f5f5, #fafafa);
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
            margin-bottom: 0.6em;
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
      <div class="listcontainer">
         <div class="groupholder">
            <div class="grouptitle">Rituals by level</div>
               <xsl:for-each select="list">
                  <xsl:call-template name="listgroup" />
               </xsl:for-each>
         </div>
      </div>

      <div class="grouptitle">
         Ritual Descriptions
      </div>

      <div class="container">

           <xsl:apply-templates match="ritual">
               <xsl:sort select="title" />
            </xsl:apply-templates>


      </div> <!-- container -->
   </body>
   </html>
</xsl:template>

<xsl:template match="ritual">

   <div class="ritual">
      <xsl:call-template name="createheader">
         <xsl:with-param name="bgcolor">#2e5984</xsl:with-param>
      </xsl:call-template>

      <div id="fluff" style="font-family:MentorSansStd-Light; background:linear-gradient(to right, #dedede, #ececec); width:100%; box-sizing:border-box; padding:0.3em; float:left;">
         <i><xsl:value-of select="fluff"/></i>
      </div>
      <div class="pricetable">
        <div class="priceline">
          <b>Market Price: </b><xsl:value-of select="price" />
        </div>
        <div class="priceline">
           <b>Key Skill: </b><xsl:value-of select="skill" />
         </div>
         <div class="priceline">
           <b>Component Cost: </b><xsl:value-of select="component" />
         </div>
         <div class="priceline">
           <b>Time: </b><xsl:value-of select="time" />
         </div>
         <div class="priceline">
           <b>Duration: </b><xsl:value-of select="duration" />
         </div>
      </div>

      <xsl:if test="bard">
        <div class="line" style="margin-bottom:0.6em;">
          <b>Bardic Ritual: </b> <xsl:text>You must be a Bard to cast this ritual.</xsl:text>
        </div>
      </xsl:if>

      <xsl:if test="requirement">
        <div class="line" style="margin-bottom:0.6em;">
          <b>Requirement: </b> <xsl:value-of select="requirement" />
        </div>
      </xsl:if>

      <xsl:for-each select="line">
         <xsl:choose>
            <xsl:when test="@indent='1'">
               <div class="line" style="padding-left:2.3em;">
                  <xsl:value-of select="." disable-output-escaping="yes"/>
               </div>
            </xsl:when>
            <xsl:when test="@indent='2'">
               <div class="line" style="padding-left:3.3em;">
                  <xsl:value-of select="." disable-output-escaping="yes"/>
               </div>
            </xsl:when>
            <xsl:otherwise>
               <div class="line">
                  <xsl:value-of select="." disable-output-escaping="yes"/>
               </div>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </div>

</xsl:template>

<xsl:template name="createheader">
   <xsl:param name="bgcolor">Purple</xsl:param>

   <div id="header" style="background-color:{$bgcolor}; width:100%; float:left; color:white; ">
      <div id="title" style="float:left; margin:0.5em; vertical-align:middle; font-size:1.2em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; width:calc(100% - 9em);">
         <xsl:value-of select="title"/>
      </div>
      <div id="classcat" style="width: 10em; float:right; text-align:right; font-size: 0.8em; margin:0.5em;">
         <xsl:text>Level </xsl:text><xsl:value-of select="level"/><br />
         <xsl:value-of select="category"/> <xsl:text> ritual</xsl:text>
      </div>
   </div>

</xsl:template>

<xsl:template name="listgroup">

   <xsl:if test="count(//catalog/ritual[level=current()/@selection])>0">
      <div class="list">
         <div class="groupname"> <b><xsl:text>Level </xsl:text><xsl:value-of select="@selection" /></b></div>
         <xsl:choose>
            <xsl:when test="@selection='1'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">1</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='2'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">2</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='3'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">3</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='4'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">4</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='5'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">5</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='6'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">6</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='7'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">7</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='8'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">8</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='9'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">9</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='10'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">10</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='11'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">11</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='12'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">12</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='13'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">13</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='14'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">14</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='15'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">15</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='16'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">16</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='17'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">17</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='18'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">18</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='19'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">19</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='20'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">20</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='21'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">21</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='22'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">22</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='23'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">23</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='24'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">24</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='25'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">25</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='26'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">26</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='27'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">27</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='28'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">28</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='29'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">29</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:when test="@selection='30'">
               <xsl:for-each select="//catalog/ritual[level=current()/@selection]">
                  <xsl:call-template name="line">
                     <xsl:with-param name="levelvalue">30</xsl:with-param>
                  </xsl:call-template>
               </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
               <![CDATA[<i>Error</i>]]>
            </xsl:otherwise>
         </xsl:choose>
      </div>
   </xsl:if>

</xsl:template>

<xsl:template name="line">
   <xsl:param name="levelvalue" select="1"/>

   <xsl:choose>
      <xsl:when test="position() mod 2 = 1">
         <div id="line" style="width:100%; float:left; background:linear-gradient(to right, LightGrey, LightGrey, Gainsboro); box-sizing:border-box; padding:0.2em;">
            <div class="title" style="width:calc(55% - 5em); float:left; padding:0.1em;"><xsl:value-of select="title"/>&#160;<xsl:value-of select="level[value=$levelvalue]/bonus" /></div>
            <div class="subtype" style="width:calc(45% - 5em); float:left; padding:0.1em;">
               <xsl:value-of select="category" />
               <xsl:if test="bard">
                 <xsl:text> (Bardic)</xsl:text>
               </xsl:if>
            </div>
            <div class="price" style="width:9em; float:right; text-align:right; padding:0.1em;">
               <xsl:value-of select="price"/>
            </div>
         </div>
      </xsl:when>
      <xsl:otherwise>
         <div id="line" style="width:100%; float:left; background:linear-gradient(to right, WhiteSmoke, WhiteSmoke, Snow); box-sizing:border-box; padding:0.2em;">
            <div class="title" style="width:calc(55% - 5em); float:left; padding:0.1em;"><xsl:value-of select="title"/>&#160;<xsl:value-of select="level[value=$levelvalue]/bonus" /></div>
            <div class="subtype" style="width:calc(45% - 5em); float:left; padding:0.1em;">
              <xsl:value-of select="category" />
              <xsl:if test="bard">
                <xsl:text> (Bardic)</xsl:text>
              </xsl:if>
            </div>
            <div class="price" style="width:9em; float:right; text-align:right; padding:0.1em;">
               <xsl:value-of select="price"/>
            </div>
         </div>
      </xsl:otherwise>
   </xsl:choose>

</xsl:template>

</xsl:stylesheet>
