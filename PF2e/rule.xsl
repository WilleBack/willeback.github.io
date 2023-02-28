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

               .rule {
               background-image: url("bg.png");
               background-repeat: no-repeat;
               margin:0.2cm;
               width:98%;
               float:left;
               page-break-inside:avoid;
               }

               .affliction {
               background:linear-gradient(to right, #e3ddde, #ece8e9);
               margin:0.2cm;
               width:98%;
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
               padding:0.1em 0.3em;
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

               @font-face {
               font-family: 'pfactions';
               src: url('../font/Pathfinder2eActions.ttf') format('truetype');
               font-weight: normal;
               font-style: normal;

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
               column-gap:0.5em;
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
         <body style="font-family:MentorSansStd, Trebuchet, Verdana, Arial; font-size:8pt;margin:0cm; ">
            <div class="container">
               <xsl:for-each select="rule">
                  <xsl:call-template name="rule" />
               </xsl:for-each>
            </div> <!-- container -->
         </body>
      </html>
   </xsl:template>

   <xsl:template name="rule">
      <div class="rule">
         <xsl:call-template name="createheader" />

         <xsl:if test="tradition or cast or range or save or duration or prereq or frequency or trigger or requirements">
            <div id="topbox" style="width:100%; box-sizing:border-box; padding:0.1em; float:left; border-bottom: 0.1em solid black;">
               <xsl:if test="prereq">
                  <div id="prereq" class="line" style="float: left;">
                     <b>Prerequisites </b>
                     <xsl:value-of select="prereq" />
                  </div>
               </xsl:if>
               <xsl:if test="frequency">
                  <div id="freq" class="line" style="float: left;">
                     <b>Frequency </b>
                     <xsl:value-of select="prereq" />
                  </div>
               </xsl:if>
               <xsl:if test="trigger">
                  <div id="trigger" class="line" style="float: left;">
                     <b>Trigger </b>
                     <xsl:value-of select="trigger" />
                  </div>
               </xsl:if>
               <xsl:if test="requirement">
                  <div id="requirement" class="line" style="float: left;">
                     <b>Requirement </b>
                     <xsl:value-of select="requirement" />
                  </div>
               </xsl:if>
            </div>
         </xsl:if>
         <div id="description" class="line" style="float: left;">
            <xsl:value-of select="line[1]" disable-output-escaping="yes"/>
         </div>
         <xsl:for-each select="line[position()>1]">
            <div id="description" class="line" style="float: left;">
               <br /><xsl:value-of select="." disable-output-escaping="yes"/>
            </div>
         </xsl:for-each>
         <xsl:if test="special">
            <div id="special" class="line" style="float: left;">
               <xsl:value-of select="special[1]" disable-output-escaping="yes"/>
            </div>
            <xsl:for-each select="special[position()>1]">
               <div id="special" class="line" style="float: left;">
                  <br /><xsl:value-of select="." disable-output-escaping="yes"/>
               </div>
            </xsl:for-each>
         </xsl:if>
      </div>

   </xsl:template>

   <xsl:template name="createheader">
      <div id="header" style="width:100%; float:left; border-bottom: 0.1em solid black; ">
         <div id="title" style="float:left; margin:0.3em; margin-bottom: 0.2em; margin-left:0.4em; vertical-align:middle; font-size:1.2em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; width:calc(100% - 12em);">
            <xsl:value-of select="title"/>
            <xsl:if test="action">
               <xsl:text>&#160;</xsl:text><span style="font-family: 'pfactions'; width:2em; text-align: center;"><xsl:value-of select="action" /></span>
            </xsl:if>
         </div>
         <div id="typelevel" style="width: 10.5em; float:right; text-align:right; font-size: 1.2em; margin:0.3em; font-weight: bold;">
            <xsl:value-of select="type" />
            <xsl:if test="level"><xsl:text> </xsl:text><xsl:value-of select="level"/> </xsl:if>
         </div>
      </div>
      <div>
         <div id="traits" style="width: 100%; float: left; margin: 0.1em; color: white;">
            <xsl:if test="rarity" >
               <div id="alignment" style="float:left; margin: 0.1em; border: 0.2em solid gold; background-color: #98503c; font-variant: small-caps; padding: 0.3em 0.4em;">
                  <xsl:value-of select="alignment" />
               </div>
            </xsl:if>
            <xsl:for-each select="trait">
               <div id="trait" style="float:left; margin: 0.1em; border: 0.2em solid gold; background-color: #5d0000; font-variant: small-caps; padding: 0.3em 0.4em;">
                  <xsl:value-of select="." />
               </div>
            </xsl:for-each>
         </div>
      </div>

   </xsl:template>

</xsl:stylesheet>
