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
               background-image= url("bg.png");
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
               src: url('font/Pathfinder2eActions.ttf') format('truetype');
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
               <xsl:for-each select="creature">
                  <xsl:call-template name="creature" />
               </xsl:for-each>
            </div> <!-- container -->
         </body>
      </html>
   </xsl:template>

   <xsl:template name="creature">
      <div class="creature">
         <xsl:call-template name="createheader" />

         <div id="topbox" style="width:100%; box-sizing:border-box; padding:0.1em; float:left; border-bottom: 0.1em solid black;">
            <div id="perception" class="line" style="float: left;">
               <b>Perception </b> <xsl:value-of select="perception" />
               <xsl:if test="sense">
                  <xsl:text>; </xsl:text>
                  <xsl:for-each select="sense">
                     <xsl:value-of select="."/>
                     <xsl:if test="position()!=last()">
                        <xsl:text>, </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:if>
            </div>
            <xsl:if test="language">
               <div id="language" class="line" style="float: left;">
                  <b>Languages </b>
                  <xsl:for-each select="language">
                     <xsl:value-of select="."/>
                     <xsl:if test="position()!=last()">
                        <xsl:text>, </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="langnote">
                     <xsl:text>; </xsl:text>
                     <xsl:for-each select="language">
                        <xsl:value-of select="."/>
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if>
                     </xsl:for-each>
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="skill">
               <div id="skills" class="line" style="float: left;">
                  <b>Skills </b>
                  <xsl:for-each select="skill">
                     <xsl:value-of select="name" />&#160;<xsl:value-of select="value" />
                     <xsl:if test="position()!=last()">
                        <xsl:text>, </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </div>
            </xsl:if>
            <div id="stats" class="line" style="float: left;">
               <b>Str </b><xsl:value-of select="str" /><xsl:text>, </xsl:text>
               <b>Dex </b><xsl:value-of select="dex" /><xsl:text>, </xsl:text>
               <b>Con </b><xsl:value-of select="con" /><xsl:text>, </xsl:text>
               <b>Int </b><xsl:value-of select="int" /><xsl:text>, </xsl:text>
               <b>Wis </b><xsl:value-of select="wis" /><xsl:text>, </xsl:text>
               <b>Cha </b><xsl:value-of select="cha" />
            </div>
            <xsl:if test="item">
               <div id="items" class="line" style="float:left;">
                  <b>Items </b>
                  <xsl:for-each select="item">
                     <xsl:value-of select="." />
                     <xsl:if test="position()!=last()">
                        <xsl:text>, </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </div>
            </xsl:if>
            <xsl:for-each select="interaction">
               <div id="interaction" class="line" style="float:left;">
                  <b><xsl:value-of select="name" />&#160;</b>
                  <xsl:if test="action">
                     <span style="font-family: 'pfactions';font-size: 1.5em; width:2em; text-align: center;"><xsl:value-of select="action" /></span><xsl:text> </xsl:text>
                  </xsl:if>
                  <xsl:if test="name='Melee' or name='Ranged'">
                     <xsl:text> </xsl:text><xsl:value-of select="weapon" /><xsl:text>&#160;</xsl:text><xsl:value-of select="atk" />
                     <xsl:if test="trait">
                        <xsl:text> </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="trait">
                     <xsl:text>(</xsl:text>
                     <xsl:for-each select="trait">
                        <xsl:value-of select="." />
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if>
                     </xsl:for-each>
                     <xsl:text>)</xsl:text>
                     <xsl:if test="line">
                        <xsl:text> </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="name='Melee' or name='Ranged'">
                     <xsl:text>, </xsl:text><b>Damage&#160;</b><xsl:value-of select="damage" /><xsl:text> </xsl:text>
                  </xsl:if>
                  <xsl:if test="line[1]/@name">
                     <b><xsl:value-of select="line[1]/@name" disable-output-escaping="yes"/><xsl:text> </xsl:text></b>
                  </xsl:if>
                  <xsl:value-of select="line[1]" disable-output-escaping="yes"/>
                  <xsl:for-each select="line[position()>1]">
                     <br />
                     <xsl:if test="@name">
                        <b><xsl:value-of select="@name" disable-output-escaping="yes"/><xsl:text> </xsl:text></b>
                     </xsl:if>
                     <xsl:value-of select="." disable-output-escaping="yes"/>
                  </xsl:for-each>
               </div>
            </xsl:for-each>
         </div>
         <div id="defenses" style="width:100%; box-sizing:border-box; padding:0.1em; float:left; border-bottom: 0.1em solid black;">
            <div id="def" class="line" style="float: left;">
               <b>AC </b><xsl:value-of select="ac" />
               <xsl:for-each select="acmod">
                  <xsl:text>, </xsl:text>
                  <xsl:value-of select="."/>
               </xsl:for-each>
               <xsl:text>; </xsl:text>
               <b>Fort </b><xsl:value-of select="fort" /><xsl:text>, </xsl:text>
               <b>Ref </b><xsl:value-of select="ref" /><xsl:text>, </xsl:text>
               <b>Will </b><xsl:value-of select="will" />
               <xsl:if test="savemod">
                  <xsl:text>; </xsl:text>
                  <xsl:for-each select="savemod">
                     <xsl:value-of select="."/>
                     <xsl:if test="position()!=last()">
                        <xsl:text>, </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:if>
            </div>
            <div id="hp" class="line" style="float: left;">
               <b>HP </b> <xsl:value-of select="hp" />
               <xsl:if test="hpnote">
                  <xsl:text>, </xsl:text>
                  <xsl:for-each select="hpnote">
                     <xsl:value-of select="."/>
                     <xsl:if test="position()!=last()">
                        <xsl:text>, </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:if>
               <xsl:if test="hardness">
                  <xsl:text>; </xsl:text>
                  <b>Hardness </b><xsl:value-of select="hardness" />
               </xsl:if>
               <xsl:if test="immune or resist or weakness">
                  <xsl:text>; </xsl:text>
               </xsl:if>
               <xsl:if test="immune">
                  <b>Immunities&#160;</b>
                  <xsl:for-each select="immune">
                     <xsl:value-of select="." disable-output-escaping="yes"/>
                     <xsl:if test="position()!=last()">
                        <xsl:text>, </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="resist or weakness">
                     <xsl:text>; </xsl:text>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="resist">
                  <b>Resistances&#160;</b>
                  <xsl:for-each select="resist">
                     <xsl:value-of select="name" disable-output-escaping="yes"/>&#160;<xsl:value-of select="value" disable-output-escaping="yes" />
                     <xsl:if test="position()!=last()">
                        <xsl:text>, </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
                  <xsl:if test="weakness">
                     <xsl:text>; </xsl:text>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="weakness">
                  <b>Weaknesses&#160;</b>
                  <xsl:for-each select="weakness">
                     <xsl:value-of select="name"  disable-output-escaping="yes"/>&#160;<xsl:value-of select="value" disable-output-escaping="yes" />
                     <xsl:if test="position()!=last()">
                        <xsl:text>, </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:if>
            </div>
            <xsl:for-each select="passive">
               <div id="passive" class="line" style="float:left;">
                  <b><xsl:value-of select="name" /> </b>
                  <xsl:if test="trait">
                     <xsl:text> (</xsl:text>
                     <xsl:for-each select="trait">
                        <xsl:value-of select="." />
                        <xsl:if test="position()!=last()">
                           <xsl:text>, </xsl:text>
                        </xsl:if>
                     </xsl:for-each>
                     <xsl:text>) </xsl:text>
                  </xsl:if>
                  <xsl:if test="line[1]/@name">
                     <b><xsl:value-of select="line[1]/@name" disable-output-escaping="yes"/><xsl:text> </xsl:text></b>
                  </xsl:if>
                  <xsl:value-of select="line[1]" disable-output-escaping="yes"/>
                  <xsl:for-each select="line[position()>1]">
                     <br />
                     <xsl:if test="@name">
                        <b><xsl:value-of select="@name" disable-output-escaping="yes"/><xsl:text> </xsl:text></b>
                     </xsl:if>
                     <xsl:value-of select="." disable-output-escaping="yes"/>
                  </xsl:for-each>
               </div>
            </xsl:for-each>
            <xsl:for-each select="reaction">
               <div id="reaction" class="line" style="float:left;">
                  <xsl:choose>
                     <xsl:when test="@auto='aoo'">
                        <b>Attack of Opportunity </b>
                        <span style="font-family: 'pfactions';font-size: 1.5em; width:2em; text-align: center;">R</span>
                        <xsl:text> </xsl:text>
                        <b>Trigger</b>
                        <xsl:text> A creature within the  </xsl:text>
                        <span style="text-transform: lowercase;"><xsl:value-of select="../title" /></span>
                        <xsl:text>'s reach use a manipulate action or a move action, makes a ranged attack, or leaves a square during a move action it's using. </xsl:text>
                        <br />
                        <b>Effect</b>
                        <xsl:text> The </xsl:text>
                        <span style="text-transform: lowercase;"><xsl:value-of select="../title" /></span>
                        <xsl:text> makes a melee Strike against the triggering creature. If the attack is a critical hit and the trigger was a manipulate action, the </xsl:text>
                        <span style="text-transform: lowercase;"><xsl:value-of select="../title" /></span>
                        <xsl:text> disrupts the action. This Strike doesn't count toward the monster's MAP, and its MAP doesn't apply to this Strike.</xsl:text>
                     </xsl:when>
                     <xsl:when test="@auto='block'">
                        <b>Shield Block </b>
                        <span style="font-family: 'pfactions';font-size: 1.5em; width:2em; text-align: center;">R</span>
                        <xsl:text> </xsl:text>
                        <b>Trigger</b>
                        <xsl:text> The </xsl:text>
                        <span style="text-transform: lowercase;"><xsl:value-of select="../title" /></span>
                        <xsl:text> has its shield raised and takes damage from a physical attack. </xsl:text>
                        <br />
                        <b>Effect</b>
                        <xsl:text> The </xsl:text>
                        <span style="text-transform: lowercase;"><xsl:value-of select="../title" /></span>
                        <xsl:text> snaps its shield into place to deflect a blow. The shield prevents the </xsl:text>
                        <span style="text-transform: lowercase;"><xsl:value-of select="../title" /></span>
                        <xsl:text> from taking an amount of damage up to the shield's Hardness. The </xsl:text>
                        <span style="text-transform: lowercase;"><xsl:value-of select="../title" /></span>
                        <xsl:text> and the shield each take any remaining damage, possibly breaking or destroying the shield.</xsl:text>
                     </xsl:when>
                     <xsl:otherwise>
                        <b><xsl:value-of select="name" />&#160;</b>
                        <span style="font-family: 'pfactions';font-size: 1.5em; width:2em; text-align: center;"><xsl:value-of select="action" /></span><xsl:text> </xsl:text>
                        <xsl:if test="trait">
                           <xsl:text> (</xsl:text>
                           <xsl:for-each select="trait">
                              <xsl:value-of select="." />
                              <xsl:if test="position()!=last()">
                                 <xsl:text>, </xsl:text>
                              </xsl:if>
                           </xsl:for-each>
                           <xsl:text>) </xsl:text>
                        </xsl:if>
                        <xsl:if test="line[1]/@name">
                     <b><xsl:value-of select="line[1]/@name" disable-output-escaping="yes"/><xsl:text> </xsl:text></b>
                  </xsl:if>
                  <xsl:value-of select="line[1]" disable-output-escaping="yes"/>
                  <xsl:for-each select="line[position()>1]">
                     <br />
                     <xsl:if test="@name">
                        <b><xsl:value-of select="@name" disable-output-escaping="yes"/><xsl:text> </xsl:text></b>
                     </xsl:if>
                     <xsl:value-of select="." disable-output-escaping="yes"/>
                  </xsl:for-each>
                     </xsl:otherwise>
                  </xsl:choose>
               </div>
            </xsl:for-each>
         </div>
         <div id="active" style="width:100%; box-sizing:border-box; padding:0.1em; float:left; ">
            <div id="move" class="line" style="width: calc(100% - 9em); float: left;">
               <b>Speed </b> <xsl:value-of select="speed" /> <xsl:text> feet</xsl:text>
               <xsl:if test="fly">
                  <xsl:text>, </xsl:text> <i>fly&#160;</i> <xsl:value-of select="fly" /> <xsl:text> feet</xsl:text>
                  <xsl:if test="fly/@note">
                     <xsl:text> </xsl:text><xsl:value-of select="fly/@note"/>
                  </xsl:if>
               </xsl:if>
               <xsl:if test="climb">
                  <xsl:text>, </xsl:text> <i>climb&#160;</i> <xsl:value-of select="climb" /> <xsl:text> feet</xsl:text>
               </xsl:if>
               <xsl:if test="burrow">
                  <xsl:text>, </xsl:text> <i>burrow&#160;</i> <xsl:value-of select="burrow" /> <xsl:text> feet</xsl:text>
               </xsl:if>
               <xsl:if test="swim">
                  <xsl:text>, </xsl:text> <i>swim&#160;</i> <xsl:value-of select="swim" /> <xsl:text> feet</xsl:text>
               </xsl:if>
               <xsl:if test="speedmod">
                  <br />
                  <xsl:for-each select="speedmod">
                     <xsl:value-of select="." disable-output-escaping="yes"/>
                     <xsl:if test="position()!=last()">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </xsl:if>
            </div>

            <xsl:for-each select="action">
               <xsl:choose>
                  <xsl:when test="@auto='grab'">
                     <div id="action" class="line" style="float:left;">
                        <b>Grab </b>
                        <span style="font-family: 'pfactions';font-size: 1.5em; width:2em; text-align: center;">1</span>
                        <xsl:text> </xsl:text>
                        <b>Requirements</b>
                        <xsl:text> The </xsl:text>
                        <span style="text-transform: lowercase;"><xsl:value-of select="../title" /></span>
                        <xsl:text>'s last action was a success with a Strike that lists Grab in its damage entry, or it has a creature grabbed using this action.</xsl:text>
                        <br />
                        <b>Effect</b>
                        <xsl:text> The </xsl:text>
                        <span style="text-transform: lowercase;"><xsl:value-of select="../title" /></span>
                        <xsl:text> automatically Grabs the target until the end of the </xsl:text>
                        <span style="text-transform: lowercase;"><xsl:value-of select="../title" /></span>
                        <xsl:text>'s next turn. The creature is grabbed by whichever body part the attack was made with, and that body part can't be used to Strike creatures until the grab is ended.</xsl:text>
                        <br />
                        <xsl:text>Using Grab extends the duration of the Grab until the end of the </xsl:text>
                        <span style="text-transform: lowercase;"><xsl:value-of select="../title" /></span>
                        <xsl:text>'s next turn for all creatures grabbed by it. A grabbed creature can use the Escape action to get out of the grab, and the Grab ends for a grabbed creature if the </xsl:text>
                        <span style="text-transform: lowercase;"><xsl:value-of select="../title" /></span>
                        <xsl:text> moves away from it.</xsl:text>
                     </div>
                  </xsl:when>
                  <xsl:when test="@auto='contrict'">
                     <div id="action" class="line" style="float:left;">
                        <b>Constrict</b>&#160;
                        <span style="font-family: 'pfactions';font-size: 1.5em; width:2em; text-align: center;">1</span>
                        <xsl:text> The </xsl:text>
                        <span style="text-transform: lowercase;"><xsl:value-of select="../title" /></span>
                        <xsl:text> deals </xsl:text>
                        <xsl:value-of select="damage" />
                        <xsl:text> to any number of creatures grabbed or restrained by it. Each of those creatures can attempt a DC </xsl:text>
                        <xsl:value-of select="dc" />
                        <xsl:text> basic Fortitude save.</xsl:text>
                     </div>
                  </xsl:when>
                     <xsl:when test="@auto='knockdown'">
                        <div id="action" class="line" style="float:left;">
                           <b>Knockdown </b>
                           <span style="font-family: 'pfactions';font-size: 1.5em; width:2em; text-align: center;">1</span>
                           <xsl:text> </xsl:text>
                           <b>Requirements</b>
                           <xsl:text> The </xsl:text>
                           <span style="text-transform: lowercase;"><xsl:value-of select="../title" /></span>
                           <xsl:text>'s last action was a success with a Strike that lists Knockdown in its damage entry.</xsl:text>
                           <br />
                           <b>Effect</b>
                           <xsl:text> The </xsl:text>
                           <span style="text-transform: lowercase;"><xsl:value-of select="../title" /></span>
                           <xsl:text> knocks the target prone.</xsl:text>
                        </div>
                     </xsl:when>
                  <xsl:otherwise>
                     <div id="action" class="line" style="float:left;">
                        <b><xsl:value-of select="name" />&#160;</b>
                        <xsl:if test="action">
                           <span style="font-family: 'pfactions';font-size: 1.5em; width:2em; text-align: center;"><xsl:value-of select="action" /></span><xsl:text> </xsl:text>
                           <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:if test="name='Melee' or name='Ranged'">
                           <xsl:value-of select="weapon" /><xsl:text>&#160;</xsl:text><xsl:value-of select="atk" />
                           <xsl:if test="trait">
                              <xsl:text> </xsl:text>
                           </xsl:if>
                        </xsl:if>
                        <xsl:if test="trait">
                           <xsl:text>(</xsl:text>
                           <xsl:for-each select="trait">
                              <xsl:value-of select="." />
                              <xsl:if test="position()!=last()">
                                 <xsl:text>, </xsl:text>
                              </xsl:if>
                           </xsl:for-each>
                           <xsl:text>)</xsl:text>
                           <xsl:if test="req or line">
                              <xsl:text> </xsl:text>
                           </xsl:if>
                        </xsl:if>
                        <xsl:if test="req">
                           <b>Requirements&#160;</b><xsl:value-of select="req" disable-output-escaping="yes"/>
                           <xsl:text>; </xsl:text>
                        </xsl:if>
                        <xsl:if test="damage">
                           <xsl:if test="not(req)">
                              <xsl:text>, </xsl:text>
                           </xsl:if>
                           <b>Damage&#160;</b><xsl:value-of select="damage" disable-output-escaping="yes" />
                        </xsl:if>
                        <xsl:if test="effect">
                           <xsl:if test="not(req)">
                              <xsl:text>, </xsl:text>
                           </xsl:if>
                           <b>Effect&#160;</b><xsl:value-of select="effect" disable-output-escaping="yes" />
                        </xsl:if>
                        <xsl:if test="line[1]/@name">
                     <b><xsl:value-of select="line[1]/@name" disable-output-escaping="yes"/><xsl:text> </xsl:text></b>
                  </xsl:if>
                  <xsl:value-of select="line[1]" disable-output-escaping="yes"/>
                  <xsl:for-each select="line[position()>1]">
                     <br />
                     <xsl:if test="@name">
                        <b><xsl:value-of select="@name" disable-output-escaping="yes"/><xsl:text> </xsl:text></b>
                     </xsl:if>
                     <xsl:value-of select="." disable-output-escaping="yes"/>
                  </xsl:for-each>
                     </div>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:for-each>
         </div>
      </div>

   </xsl:template>

   <xsl:template name="createheader">
      <div id="header" style="width:100%; float:left; border-bottom: 0.1em solid black; ">
         <div id="title" style="float:left; margin:0.3em; margin-bottom: 0.2em; margin-left:0.4em; vertical-align:middle; font-size:1.2em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; width:calc(100% - 12em);">
            <xsl:value-of select="title"/>
         </div>
         <div id="rolelevel" style="width: 10.5em; float:right; text-align:right; font-size: 1.2em; margin:0.3em; font-weight: bold;">
            <xsl:value-of select="type"/>
            <xsl:if test="rolestrength">
               <xsl:text> </xsl:text><xsl:value-of select="rolestrength" />
            </xsl:if>
            <xsl:text> </xsl:text> <xsl:value-of select="role" />
            <xsl:if test="subrole">
               <xsl:text> (</xsl:text> <xsl:value-of select="subrole" /> <xsl:text>)</xsl:text>
            </xsl:if>
            <xsl:if test="level"><xsl:text> </xsl:text><xsl:value-of select="level"/> </xsl:if>
         </div>
      </div>
      <div>
         <div id="traits" style="width: 100%; float: left; margin: 0.1em; color: white;">
            <xsl:if test="uncommon" >
               <div id="rarity" style="float:left; margin: 0.1em; border: 0.2em solid gold; background-color: #c45500; font-variant: small-caps; padding: 0.3em 0.3em;">
                  <xsl:text>Uncommon</xsl:text>
               </div>
            </xsl:if>
            <xsl:if test="rare" >
               <div id="rarity" style="float:left; margin: 0.1em; border: 0.2em solid gold; background-color: #0c1466; font-variant: small-caps; padding: 0.3em 0.4em;">
                  <xsl:text>Rare</xsl:text>
               </div>
            </xsl:if>
            <div id="alignment" style="float:left; margin: 0.1em; border: 0.2em solid gold; background-color: #566193; font-variant: small-caps; padding: 0.3em 0.4em;">
               <xsl:value-of select="alignment" />
            </div>
            <div id="size" style="float:left; margin: 0.1em; border: 0.2em solid gold; background-color: #3a7a58; font-variant: small-caps; padding: 0.3em 0.4em;">
               <xsl:value-of select="size" />
            </div>
            <xsl:for-each select="trait">
               <div id="trait" style="float:left; margin: 0.1em; border: 0.2em solid gold; background-color: #5d0000; font-variant: small-caps; padding: 0.3em 0.4em;">
                  <xsl:value-of select="." />
               </div>
            </xsl:for-each>
         </div>
      </div>

   </xsl:template>

</xsl:stylesheet>
