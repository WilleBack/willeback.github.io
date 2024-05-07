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
               padding:0.15em 0.3em;
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
               font-family: 'DnDVecna';
               src: url('../font/DnDVecna.otf') format('opentype');
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
               <xsl:for-each select="creature">
                  <xsl:call-template name="creature" />
               </xsl:for-each>
            </div> <!-- container -->
         </body>
      </html>
   </xsl:template>

   <xsl:template name="creature">
      <div class="creature">
         <xsl:call-template name="createheader">
            <xsl:with-param name="bgcolor">#4e5c2e</xsl:with-param>
         </xsl:call-template>

         <div id="topbox" style="width:100%; box-sizing:border-box; padding:0.3em; float:left;">
            <xsl:choose>
               <xsl:when test="initiative or perception or insight or sense">
                  <div id="hp" class="line" style="width: calc(100% - 9em); float: left;">
                     <xsl:call-template name="hp-content"/>
                  </div>
                  <xsl:if test="init">
                     <div id="init" class="line" style="width: 9em; float: right; text-align: right; padding-left: 0.3em;">
                        <b>Initiative </b> <xsl:value-of select="init" />
                     </div>
                  </xsl:if>
                  <xsl:if test="perception or insight or sense">
                     <div id="senses" class="line" style="width: 9em; float: right; text-align: right; padding-left: 0.3em;">
                        <xsl:if test="perception">
                           <b>Perception </b> <xsl:value-of select="perception" />
                           <xsl:if test="insight or sense"> <br /> </xsl:if>
                        </xsl:if>
                        <xsl:if test="insight">
                           <b>Insight </b> <xsl:value-of select="insight" />
                           <xsl:if test="sense"> <br/></xsl:if>
                        </xsl:if>
                        <xsl:if test="not(perception) and not(insight)">
                           <b>Senses</b><br/>
                        </xsl:if>
                        <xsl:for-each select="sense">
                           <xsl:value-of select="." disable-output-escaping="yes" />
                           <xsl:if test="position()!=last()">
                              <br/>
                           </xsl:if>
                        </xsl:for-each>
                     </div>
                  </xsl:if>
                  <div id="defense" class="line" style="width: calc(100% - 9em); float: left;">
                     <xsl:call-template name="defense-content"/>
                  </div>
                  <div id="move" class="line" style="width: calc(100% - 9em); float: left;">
                     <xsl:call-template name="move-content"/>
                  </div>
               </xsl:when>
               <xsl:otherwise>
                  <div id="hp" class="line">
                     <xsl:call-template name="hp-content"/>
                  </div>
                  <div id="defense" class="line">
                     <xsl:call-template name="defense-content"/>
                  </div>
                  <div id="move" class="line">
                     <xsl:call-template name="move-content"/>
                  </div>
               </xsl:otherwise>
            </xsl:choose>
                  <xsl:if test="immune">
                     <div id="immune" class="line">
                        <b>Immune </b>
                        <xsl:for-each select="immune">
                           <xsl:value-of select="."/>
                           <xsl:if test="position()!=last()">
                              <xsl:text>, </xsl:text>
                           </xsl:if>
                        </xsl:for-each>
                     </div>
                  </xsl:if>
                  <xsl:if test="resist or vulnerable">
                     <div id="resist" class="line">
                        <xsl:if test="resist">
                           <b>Resist&#160;</b>
                           <xsl:for-each select="resist">
                              <xsl:value-of select="./value"/><xsl:text>&#160;</xsl:text><xsl:value-of select="./type" />
                              <xsl:if test="position()!=last()">
                                 <xsl:text>, </xsl:text>
                              </xsl:if>
                           </xsl:for-each>
                           <xsl:if test="vulnerable">
                              <xsl:text>; </xsl:text>
                           </xsl:if>
                        </xsl:if>
                        <xsl:if test="vulnerable">
                           <b>Vulnerable&#160;</b>
                           <xsl:for-each select="vulnerable">
                              <xsl:value-of select="./value"/><xsl:text>&#160;</xsl:text><xsl:value-of select="./type" />
                              <xsl:if test="position()!=last()">
                                 <xsl:text>, </xsl:text>
                              </xsl:if>
                           </xsl:for-each>
                        </xsl:if>
                     </div>
                  </xsl:if>
                  <xsl:if test="saves or ap or savemod">
                     <xsl:choose>
                        <xsl:when test="saves">
                           <div id="extra" class="line">
                              <xsl:if test="saves">
                                 <b>Saving Throws </b>
                                 <xsl:value-of select="saves"/>
                                 <xsl:if test="ap">
                                    <xsl:text>; </xsl:text>
                                 </xsl:if>
                              </xsl:if>
                              <xsl:if test="ap">
                                 <b>Action Points </b>
                                 <xsl:value-of select="ap"/>
                              </xsl:if>
                              <xsl:if test="savemod">
                                 <br />
                                 <xsl:for-each select="savemod">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position()!=last()">
                                       <xsl:text>; </xsl:text>
                                    </xsl:if>
                                 </xsl:for-each>
                              </xsl:if>
                           </div>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:if test="savemod">
                              <div id="savemods" class="line">
                                 <b>Saving Throws </b>
                                 <xsl:for-each select="savemod">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position()!=last()">
                                       <xsl:text>; </xsl:text>
                                    </xsl:if>
                                 </xsl:for-each>
                              </div>
                           </xsl:if>
                           <xsl:if test="ap">
                              <div id="ap" class="line">
                                 <b>Action Points </b>
                                 <xsl:value-of select="ap"/>
                              </div>
                           </xsl:if>
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:if>
               
         </div>

         <xsl:for-each select="category">
            <div id="catname" style="background-color:#4e5c2e; color: white; width:100%; padding:0.2em; padding-left: 0.7em; box-sizing: border-box; font-variant:small-caps; font-size:1.1em; font-weight: bold; float:left;">
               <xsl:value-of select="category-name" />
            </div>
            <xsl:for-each select="block">
               <div id="blockhead" style="background:linear-gradient(to right, #c6c5ad, #d6d5c4); width:100%; box-sizing:border-box; padding:0.3em; float:left; ">
                  <div style="float:left; width: max-content; max-width: calc(100% - 6em);">
                     <xsl:choose>
                        <xsl:when test="@summon-move">
                           <b>Minor Action </b>
                        </xsl:when>
                        <xsl:when test="type='aura'">
                           <div style="font-family: 'game_icons';font-size: 0.78em; width:2em; float: left; text-align: center;"><img src="../font/auraicon.svg" width="12px" height="12px" /></div>
                        </xsl:when>
                        <xsl:when test="type='melee'">
                           <div style="font-family: 'game_icons';font-size: 0.78em; width:2em; float: left; text-align: center;"><xsl:text>M</xsl:text></div>
                        </xsl:when>
                        <xsl:when test="type='mbasic'">
                           <div style="font-family: 'game_icons';font-size: 0.78em; width:2em; float: left; text-align: center;"><xsl:text>m</xsl:text></div>
                        </xsl:when>
                        <xsl:when test="type='ranged'">
                           <div style="font-family: 'game_icons';font-size: 0.78em; width:2em; float: left; text-align: center;"><xsl:text>R</xsl:text></div>
                        </xsl:when>
                        <xsl:when test="type='rbasic'">
                           <div style="font-family: 'game_icons';font-size: 0.78em; width:2em; float: left; text-align: center;"><xsl:text>r</xsl:text></div>
                        </xsl:when>
                        <xsl:when test="type='mrbasic'">
                           <div style="font-family: 'game_icons';font-size: 0.78em; width:4.2em; float: left; text-align: center;"><xsl:text>m/r</xsl:text></div>
                        </xsl:when>
                        <xsl:when test="type='mr'">
                           <div style="font-family: 'game_icons';font-size: 0.78em; width:3em; float: left; text-align: center;"><xsl:text>M / R</xsl:text></div>
                        </xsl:when>
                        <xsl:when test="type='close'">
                           <div style="font-family: 'game_icons';font-size: 0.78em; width:2em; float: left; text-align: center;"><xsl:text>C</xsl:text></div>
                        </xsl:when>
                        <xsl:when test="type='area'">
                           <div style="font-family: 'game_icons';font-size: 0.78em; width:2em; float: left; text-align: center;"><xsl:text>A</xsl:text></div>
                        </xsl:when>
                     </xsl:choose>
                     <b> <xsl:value-of select="name" /> </b>
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
                  <xsl:if test="@summon-move">
                     <div id="blob" style="width: 1.2em; float: left; text-align:center; ">
                        <xsl:text disable-output-escaping="yes">&#x25C6;</xsl:text>
                     </div>
                     <div style="float:left; max-width:30em; "><b>At-Will </b><xsl:text>1 / turn</xsl:text></div>
                  </xsl:if>
                  <xsl:if test="frequency">
                     <div id="blob" style="width: 1.2em; float: left; text-align:center; ">
                        <xsl:text disable-output-escaping="yes">&#x25C6;</xsl:text>
                     </div>
                     <div style="float:left; max-width:30em; "><b><xsl:value-of select="frequency" />&#160;</b><xsl:value-of select="note" disable-output-escaping="yes"/></div>
                  </xsl:if>
                  <xsl:if test="recharge">
                     <div id="blob" style="width: 1.2em; float: left; text-align:center; ">
                        <xsl:text disable-output-escaping="yes">&#x25C6;</xsl:text>
                     </div>
                     <div style="float:left; max-width:30em; "><b>Recharge </b><span style="font-family:'game_icons'; font-size:0.82em;"><xsl:value-of select="recharge" /></span></div>
                  </xsl:if>
               </div>
               <xsl:if test="@summon-move">
                  <div class="line" style="padding-left:1.8em;">
                     <i>Effect: </i>
                     <xsl:text>The creature either walks, steps, stands up, squeezes, or crawls.</xsl:text>
                  </div>
               </xsl:if>
               <xsl:for-each select="line">
                  <xsl:choose>
                     <xsl:when test="@indent='1'">
                        <div class="line" style="padding-left:2.8em;">
                           <xsl:if test="name">
                              <i><xsl:value-of select="name" disable-output-escaping="yes"/><xsl:text>: </xsl:text></i>
                           </xsl:if>
                           <xsl:value-of select="text()" disable-output-escaping="yes"/>
                        </div>
                     </xsl:when>
                     <xsl:when test="@indent='2'">
                        <div class="line" style="padding-left:3.8em;">
                           <xsl:if test="name">
                              <i><xsl:value-of select="name" disable-output-escaping="yes"/><xsl:text>: </xsl:text></i>
                           </xsl:if>
                           <xsl:value-of select="text()" disable-output-escaping="yes"/>
                        </div>
                     </xsl:when>
                     <xsl:when test="@indent='3'">
                        <div class="line" style="padding-left:4.8em;">
                           <xsl:if test="name">
                              <i><xsl:value-of select="name" disable-output-escaping="yes"/><xsl:text>: </xsl:text></i>
                           </xsl:if>
                           <xsl:value-of select="text()" disable-output-escaping="yes"/>
                        </div>
                     </xsl:when>
                     <xsl:otherwise>
                        <div class="line" style="padding-left:1.8em;">
                           <xsl:if test="name">
                              <i><xsl:value-of select="name" disable-output-escaping="yes"/><xsl:text>: </xsl:text></i>
                           </xsl:if>
                           <xsl:value-of select="text()" disable-output-escaping="yes"/>
                        </div>
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:for-each>
            </xsl:for-each>
         </xsl:for-each>
         <xsl:if test="skill or str">
            <div id="checkbonus" style="background:linear-gradient(to right, #c6c5ad, #d6d5c4); width:100%; box-sizing:border-box; padding:0.3em; float:left; ">
               <xsl:if test="skill">
                  <div id="skills" class="line">
                     <b>Skills:&#160;</b>
                     <xsl:for-each select="skill">
                        <xsl:value-of select="./name"/><xsl:text>&#160;</xsl:text><xsl:value-of select="./value" />
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if>
                     </xsl:for-each>
                  </div>
               </xsl:if>
               <xsl:if test="str">
                  <div id="abilities" style="float:left;">
                     <div id="str" class="line" style="width: 32%;">
                        <b>Str </b><xsl:value-of select="str/value" /><xsl:text> (</xsl:text><xsl:value-of select="str/mod" /><xsl:text>)</xsl:text>
                     </div>
                     <div id="dex" class="line" style="width: 32%;">
                        <b>Dex </b><xsl:value-of select="dex/value" /><xsl:text> (</xsl:text><xsl:value-of select="dex/mod" /><xsl:text>)</xsl:text>
                     </div>
                     <div id="wis" class="line" style="width: 32%;">
                        <b>Wis </b><xsl:value-of select="wis/value" /><xsl:text> (</xsl:text><xsl:value-of select="wis/mod" /><xsl:text>)</xsl:text>
                     </div>
                     <div id="con" class="line" style="width: 32%;">
                        <b>Con </b><xsl:value-of select="con/value" /><xsl:text> (</xsl:text><xsl:value-of select="con/mod" /><xsl:text>)</xsl:text>
                     </div>
                     <div id="int" class="line" style="width: 32%;">
                        <b>Int </b><xsl:value-of select="int/value" /><xsl:text> (</xsl:text><xsl:value-of select="int/mod" /><xsl:text>)</xsl:text>
                     </div>
                     <div id="cha" class="line" style="width: 32%;">
                        <b>Cha </b><xsl:value-of select="cha/value" /><xsl:text> (</xsl:text><xsl:value-of select="cha/mod" /><xsl:text>)</xsl:text>
                     </div>
                  </div>
               </xsl:if>
            </div>
         </xsl:if>
         <div id="bottombox" style="width:100%; box-sizing:border-box; padding:0.3em; float:left; ">
            <div id="alignment" class="line" style="width: 13em;">
               <b>Alignment </b><xsl:value-of select="alignment" />
            </div>
            <div id="languages" class="line" style="width: calc(100% - 14em);">
               <b>Languages </b>
               <xsl:for-each select="language">
                  <xsl:value-of select="."/>
                  <xsl:if test="position()!=last()">
                     <xsl:text>, </xsl:text>
                  </xsl:if>
               </xsl:for-each>
            </div>
            <xsl:if test="equipment">
               <div id="equipment" class="line">
                  <b>Equipment </b>
                  <xsl:for-each select="equipment">
                     <xsl:value-of select="."/>
                     <xsl:if test="position()!=last()">
                        <xsl:text>, </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </div>
            </xsl:if>
            <xsl:if test="source">
               <div id="equipment" class="line">
                  <xsl:choose>
                     <xsl:when test="source/@type">
                        <i>Source <xsl:value-of select="source/@type" />: </i>
                     </xsl:when>
                     <xsl:otherwise>
                        <i>Source Power: </i>
                     </xsl:otherwise>
                  </xsl:choose>
                  <xsl:value-of select="source" />
               </div>
            </xsl:if>
            <xsl:if test="description">
               <div id="description" class="line" style="font-family:MentorSansStd-Light;">
                  <xsl:value-of select="description" />
               </div>
            </xsl:if>
         </div>
      </div>

      <xsl:if test="affliction">
         <div class="affliction">
            <div class="afflictheader" style="background-color:#4E1126; width:100%; float:left; color:white; ">
               <div id="affliction/title" style="font-family:DnDVecna; float:left; margin:0.3em; margin-bottom: 0.2em; margin-left:0.4em; vertical-align:middle; font-size:1.2em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; width:calc(100% - 10.6em);">
                  <xsl:value-of select="affliction/title"/>
               </div>
               <div id="typelevel" style="width: 13.3em; float:right; text-align:right; font-size: 0.8em; margin:0.5em; font-weight: bold;">
                  <xsl:text>Lvl </xsl:text><xsl:value-of select="affliction/level"/><br/>
                  <xsl:value-of select="affliction/type" />
               </div>
            </div>
            <div class="line" style="background:linear-gradient(to right, #ae9da0, #bfb2b5); font-family:MentorSansStd-Light; font-style:italic;">
               <xsl:value-of select="affliction/fluff" />
            </div>
            <xsl:for-each select="affliction/stage">
               <div class="line">
                  <b><xsl:value-of select="name" /></b><xsl:text> </xsl:text><xsl:value-of select="text" />
               </div>
            </xsl:for-each>
            <div class="line">
               <b>Check: </b><xsl:value-of select="affliction/check/text" />
               <xsl:for-each select="affliction/check/result">
                  <div class="line" style="padding-left:2.3em;">
                     <i><xsl:value-of select="roll" /></i><xsl:text> </xsl:text><xsl:value-of select="text" />
                  </div>
               </xsl:for-each>
            </div>
         </div>
      </xsl:if>

   </xsl:template>

   <xsl:template name="createheader">
      <xsl:param name="bgcolor">Purple</xsl:param>
      <div id="header" style="background-color:{$bgcolor}; width:100%; float:left; color:white; ">
         <div id="title" style="float:left; margin:0.3em; margin-bottom: 0.2em; margin-left:0.4em; vertical-align:middle; font-size:1.2em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; width:calc(100% - 10.6em);">
            <xsl:value-of select="title"/>
         </div>
         <div id="rolelevel" style="width: 13.3em; float:right; text-align:right; font-size: 0.8em; margin:0.5em; font-weight: bold;">
            <xsl:if test="level"><xsl:text>Lvl </xsl:text><xsl:value-of select="level"/> </xsl:if>
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
            <xsl:if test="xp">
               <div id="xp" style="margin: 0.3em; margin-top: 0.1em; width: 7em; float:right; text-align: right;">
                  <xsl:text>XP </xsl:text> <xsl:value-of select="xp" />
               </div>
            </xsl:if>
         </div>
      </div>

   </xsl:template>
   
   <xsl:template name="hp-content">
      <xsl:choose>
         <xsl:when test="hp/@bloodied">
            <b>HP </b><xsl:text>Your bloodied value; </xsl:text><b>Bloodied </b><xsl:text>one-half HP</xsl:text><br/>
            <xsl:text>Has no healing surges, but you can expend yours for effects that allow the summoned creature to expend one</xsl:text>
         </xsl:when>
         <xsl:when test="hp/@surge">
            <b>HP </b><xsl:text>Your healing surge value; </xsl:text><b>Bloodied </b><xsl:text>one-half HP</xsl:text><br/>
            <xsl:text>Has no healing surges, but you can expend yours for effects that allow the summoned creature to expend one</xsl:text>
         </xsl:when>
         <xsl:when test="hp/@minion">
            <b>HP </b> <xsl:value-of select="hp" /><xsl:text>; </xsl:text><b>Bloodied </b> <xsl:text>any damage bloodies a minion</xsl:text>
            <xsl:if test="hpnote">
               <br /> <xsl:value-of select="hpnote" disable-output-escaping="yes"/>
            </xsl:if>
         </xsl:when>
         <xsl:otherwise>
            <b>HP </b> <xsl:value-of select="hp" /><xsl:text>; </xsl:text><b>Bloodied </b> <xsl:value-of select="bloodied" />
            <xsl:if test="hpnote">
               <br/>
               <xsl:choose>
                  <xsl:when test="hpnote/@summoned">
                     <xsl:text>Has no healing surges, but you can expend yours for effects that allow the summoned creature to expend one</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:value-of select="hpnote" disable-output-escaping="yes" />
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:if>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <xsl:template name="defense-content">
      <xsl:choose>
         <xsl:when test="defenses/@yours">
            <b>Defenses </b> <xsl:text>Your defenses, not counting temporary bonuses</xsl:text>
         </xsl:when>
         <xsl:when test="defenses">
            <b>Defenses </b> <xsl:value-of select="defenses" disable-output-escaping="yes" />
         </xsl:when>
         <xsl:otherwise>
            <b>AC </b> <xsl:value-of select="ac" /><xsl:text>, </xsl:text><b>Fortitude </b> <xsl:value-of select="fort" /><xsl:text>, </xsl:text> <b>Reflex </b> <xsl:value-of select="ref" /> <xsl:text>, </xsl:text><b>Will </b> <xsl:value-of select="will" />
         </xsl:otherwise>
      </xsl:choose>
      <xsl:if test="defmod">
         <br />
         <xsl:for-each select="defmod">
            <xsl:value-of select="." disable-output-escaping="yes" />
            <xsl:if test="position()!=last()">
               <xsl:text>; </xsl:text>
            </xsl:if>
         </xsl:for-each>
      </xsl:if>
   </xsl:template>
   
   <xsl:template name="move-content">
      <b>Speed </b> <xsl:value-of select="speed" />
      <xsl:if test="fly">
         <xsl:text>, </xsl:text> <i>fly&#160;</i> <xsl:value-of select="fly" />
      </xsl:if>
      <xsl:if test="climb">
         <xsl:text>, </xsl:text> <i>climb&#160;</i> <xsl:value-of select="climb" />
      </xsl:if>
      <xsl:if test="burrow">
         <xsl:text>, </xsl:text> <i>climb&#160;</i> <xsl:value-of select="burrow" />
      </xsl:if>
      <xsl:if test="swim">
         <xsl:text>, </xsl:text> <i>swim&#160;</i> <xsl:value-of select="swim" />
      </xsl:if>
      <xsl:if test="speedmod">
         <br />
         <xsl:for-each select="speedmod">
            <xsl:value-of select="." disable-output-escaping="yes" />
            <xsl:if test="position()!=last()">
               <xsl:text>; </xsl:text>
            </xsl:if>
         </xsl:for-each>
      </xsl:if>
   </xsl:template>

</xsl:stylesheet>
