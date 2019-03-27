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
            
            .creature {
               background:linear-gradient(to right, #d6d6c2, #ebebe1);
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
               font-family: 'game_icons';
               src: url('../font/gameicons-webfont.woff2') format('woff2'),
                    url('../font/gameicons-webfont.woff') format('woff'),
                    url('../font/gameicons-webfont.ttf') format('truetype');
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
      <body style="font-family:Verdana; font-size:8pt;margin:0cm; ">	
         <div class="container">
            <xsl:apply-templates match="creature">
               <xsl:sort select="title" />
            </xsl:apply-templates> 
         </div> <!-- container -->
      </body>
   </html>
</xsl:template>

<xsl:template match="creature">
   <div class="creature">
      <xsl:call-template name="createheader">
         <xsl:with-param name="bgcolor">#4e5c2e</xsl:with-param>
      </xsl:call-template>
      
      <div id="topbox" style="width:100%; box-sizing:border-box; padding:0.3em; float:left;"> 
         <div id="hp" class="line" style="width: calc(100% - 9em); float: left;">
            <b>HP </b> <xsl:value-of select="hp" /><xsl:text>; </xsl:text><b>Bloodied </b> <xsl:value-of select="bloodied" />
         </div>
         <div id="init" class="line" style="width: 8.5em; float: right; text-align: right;">
            <b>Initiative </b> <xsl:value-of select="init" />
         </div>
         <div id="defense" class="line" style="width: calc(100% - 9em); float: left;">
            <b>AC </b> <xsl:value-of select="ac" /><xsl:text>, </xsl:text><b>Fortitude </b> <xsl:value-of select="fort" /><xsl:text>, </xsl:text> <b>Reflex </b> <xsl:value-of select="ref" /> <xsl:text>, </xsl:text><b>Will </b> <xsl:value-of select="will" />
            <xsl:if test="defmod">
               <xsl:for-each select="defmod">
                  <br /> <xsl:value-of select="."/>
                  <xsl:if test="position()!=last()">
                     <xsl:text>, </xsl:text>
                  </xsl:if> 
               </xsl:for-each>
            </xsl:if>
         </div>
         <div id="senses" class="line" style="width: 8.5em; float: right; text-align: right;">
            <b>Perception </b> <xsl:value-of select="perception" /> <br />
            <b>Insight </b> <xsl:value-of select="insight" />
            <xsl:if test="sense">
               <xsl:for-each select="sense">
                  <br /> <xsl:value-of select="."/>
                  <xsl:if test="position()!=last()">
                     <xsl:text>, </xsl:text>
                  </xsl:if> 
               </xsl:for-each>
            </xsl:if>
         </div>
         <div id="move" class="line" style="width: calc(100% - 9em); float: left;">
            <b>Speed </b> <xsl:value-of select="speed" />
            <xsl:if test="fly">
               <xsl:text>, </xsl:text> <i>fly&#160;</i> <xsl:value-of select="fly" />
            </xsl:if>
            <xsl:if test="climb">
               <xsl:text>, </xsl:text> <i>climb&#160;</i> <xsl:value-of select="climb" />
            </xsl:if>
            <xsl:if test="swim">
               <xsl:text>, </xsl:text> <i>swim&#160;</i> <xsl:value-of select="swim" />
            </xsl:if>
            <xsl:if test="speedmod">
               <xsl:for-each select="speedmod">
                  <br /> <xsl:value-of select="."/>
                  <xsl:if test="position()!=last()">
                     <xsl:text>, </xsl:text>
                  </xsl:if> 
               </xsl:for-each>
            </xsl:if>
         </div>
         <xsl:if test="immune or resist or vulnerable">
            <div id="resist" class="line" style="width: calc(100% - 9em); float:left;">
               <xsl:choose>
                  <xsl:when test="immune and resist and vulnerable">
                     <b>Immune </b>
                     <xsl:for-each select="immune">
                        <xsl:value-of select="."/>
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if> 
                     </xsl:for-each>
                     <xsl:text>; </xsl:text>
                     <b>Resist&#160;</b>
                     <xsl:for-each select="resist">
                        <xsl:value-of select="./value"/><xsl:text>&#160;</xsl:text><xsl:value-of select="./type" />
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if> 
                     </xsl:for-each>
                     <xsl:text>; </xsl:text>
                     <b>Vulnerable&#160;</b>
                     <xsl:for-each select="vulnerable">
                        <xsl:value-of select="./value"/><xsl:text>&#160;</xsl:text><xsl:value-of select="./type" />
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if> 
                     </xsl:for-each>
                  </xsl:when>
                  <xsl:when test="immune and resist">
                     <b>Immune </b>
                     <xsl:for-each select="immune">
                        <xsl:value-of select="."/>
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if> 
                     </xsl:for-each>
                     <xsl:text>; </xsl:text>
                     <b>Resist&#160;</b>
                     <xsl:for-each select="resist">
                        <xsl:value-of select="./value"/><xsl:text>&#160;</xsl:text><xsl:value-of select="./type" />
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if> 
                     </xsl:for-each>
                  </xsl:when>
                  <xsl:when test="immune and vulnerable">
                     <b>Immune </b>
                     <xsl:for-each select="immune">
                        <xsl:value-of select="."/>
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if> 
                     </xsl:for-each>
                     <xsl:text>; </xsl:text>
                     <b>Vulnerable&#160;</b>
                     <xsl:for-each select="vulnerable">
                        <xsl:value-of select="./value"/><xsl:text>&#160;</xsl:text><xsl:value-of select="./type" />
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if> 
                     </xsl:for-each>
                  </xsl:when>
                  <xsl:when test="resist and vulnerable">
                     <b>Resist&#160;</b>
                     <xsl:for-each select="resist">
                        <xsl:value-of select="./value"/><xsl:text>&#160;</xsl:text><xsl:value-of select="./type" />
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if> 
                     </xsl:for-each>
                     <xsl:text>; </xsl:text>
                     <b>Vulnerable&#160;</b>
                     <xsl:for-each select="vulnerable">
                        <xsl:value-of select="./value"/><xsl:text>&#160;</xsl:text><xsl:value-of select="./type" />
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if> 
                     </xsl:for-each>
                  </xsl:when>
                  <xsl:when test="immune">
                     <b>Immune </b>
                     <xsl:for-each select="immune">
                        <xsl:value-of select="."/>
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if> 
                     </xsl:for-each>
                  </xsl:when>
                  <xsl:when test="resist">
                     <b>Resist&#160;</b>
                     <xsl:for-each select="resist">
                        <xsl:value-of select="./value"/><xsl:text>&#160;</xsl:text><xsl:value-of select="./type" />
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if> 
                     </xsl:for-each>
                  </xsl:when>
                  <xsl:when test="vulnerable">
                     <b>Vulnerable&#160;</b>
                     <xsl:for-each select="vulnerable">
                        <xsl:value-of select="./value"/><xsl:text>&#160;</xsl:text><xsl:value-of select="./type" />
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if> 
                     </xsl:for-each>
                  </xsl:when>
               </xsl:choose> 
            </div>
         </xsl:if>
      </div> 
      
      <xsl:for-each select="category">
         <div id="catname" style="background-color:#4e5c2e; color: white; width:100%; padding:0.2em; padding-left: 0.7em; box-sizing: border-box; font-variant:small-caps; font-size:1.1em; font-weight: bold; float:left;">
            <xsl:value-of select="category-name" />
         </div>
         <xsl:for-each select="block">
            <div id="blockhead" style="background:linear-gradient(to right, #c6c5ad, #d6d5c4); width:100%; box-sizing:border-box; padding:0.3em; float:left; ">
               <div style="float:left; width: max-content; max-width: calc(100% - 14em);">
                  <div style="font-family: 'game_icons';font-size: 0.8em;width: 2em;float: left;"><xs:value-of select="icon" /></div><b> <xsl:value-of select="name" /> </b>
                  <xsl:if test="keyword">
                     <xsl:text> (</xsl:text>
                     <xsl:for-each select="keyword">
                        <xsl:value-of select="."/>
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if> 
                     </xsl:for-each>
                     <xsl:text>)</xsl:text>
                  </xsl:if>
               </div>
               <xsl:if test="frequency">
                  <div id="blob" style="width: 1.2em; float: left; text-align:center; ">
                     <xsl:text disable-output-escaping="yes">&#x25C6;</xsl:text>
                  </div>
                  <div style="float:left; max-width:21em; "><b><xsl:value-of select="frequency" /> </b><xsl:value-of select="note" /></div>
               </xsl:if>
               <xsl:if test="recharge">
                  <div id="blob" style="width: 1.2em; float: left; text-align:center; ">
                     <xsl:text disable-output-escaping="yes">&#x25C6;</xsl:text>
                  </div>
                  <div style="float:left; max-width:21em; "><b>Recharge </b><xsl:value-of select="recharge" /></div>
               </xsl:if>
            </div>
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
         </xsl:for-each> 
      </xsl:for-each> 
   </div> 

</xsl:template>

<xsl:template name="createheader">
   <xsl:param name="bgcolor">Purple</xsl:param>
   <div id="header" style="background-color:{$bgcolor}; width:100%; float:left; color:white; ">
      <div id="title" style="float:left; margin:0.5em; margin-bottom: 0.2em; vertical-align:middle; font-size:1.2em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; width:calc(100% - 10.6em);"> 
         <xsl:value-of select="title"/>
      </div>
      <div id="rolelevel" style="width: 13.3em; float:right; text-align:right; font-size: 0.8em; margin:0.5em; font-weight: bold;">
         <xsl:text>Lvl </xsl:text><xsl:value-of select="level"/>
         <xsl:if test="rolestrength">
            <xsl:text> </xsl:text><xsl:value-of select="rolestrength" />
         </xsl:if>
         <xsl:text> </xsl:text> <xsl:value-of select="role" />
         <xsl:if test="subrole">
            <xsl:text> (</xsl:text> <xsl:value-of select="subrole" /> <xsl:text>)</xsl:text>
         </xsl:if>
      </div>
      <div id="typexp" style="width: 100%; float: left;">
         <div id="type" style="float:left; margin: 0.2em; margin-top: 0.1em; margin-left: 0.5em; font-variant: small-caps; width:calc(100% - 8.5em);">
		 <xsl:value-of select="size" /><xsl:text> </xsl:text> <xsl:value-of select="origin" /><xsl:text> </xsl:text> <xsl:value-of select="type" />
               <xsl:if test="subtype">
                  <xsl:text> (</xsl:text>
                  <xsl:for-each select="subtype">
                     <xsl:value-of select="."/>
                     <xsl:if test="position()!=last()">
                        <xsl:text>, </xsl:text>
                     </xsl:if> 
                  </xsl:for-each>
                  <xsl:text>)</xsl:text>
               </xsl:if>
         </div>
         <div id="xp" style="margin: 0.3em; margin-top: 0.1em; width: 7em; float:right; text-align: right;">
            <xsl:text>XP </xsl:text> <xsl:value-of select="xp" />
         </div>
      </div>
   </div>

</xsl:template>

</xsl:stylesheet>
