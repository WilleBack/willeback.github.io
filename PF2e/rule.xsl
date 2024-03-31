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
               <!-- background-image: url("/bg.png"); -->
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
               padding:0.1em 0.15em 0.1em 0.3em;
               text-indent:-0.8em;
               padding-left:1.1em;
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
               src: url('/font/Pathfinder2eActions.ttf') format('truetype');
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
               margin: 1.2cm 0.9cm;
               }

               @media print {
               .container {
               column-count: 2;
               column-gap:1em;
               margin:0cm;
               }

               .listcontainer {
               column-count: 2;
               column-gap:1em;
               margin:0cm;
               }

               }

            </style>
         </head>
         <body style="font-family:MentorSansStd, Trebuchet, Verdana, Arial; font-size:8.5pt;margin:0cm; ">
            <div class="container">
               <xsl:for-each select="rule">
                  <xsl:choose>
                     <xsl:when test="category">
                        <div class="grouping" style="float:left; width:100%; margin:0.05cm; page-break-inside:avoid;">
                           <div class="grouptitle" style="float:left; width: 98%; border-bottom: 0.2em solid #5d0000; font-variant: small-caps; letter-spacing:1px; padding-left: 0.1em;">
                              <xsl:value-of select="category"/>
                           </div>
                           <xsl:call-template name="rule"/>
                        </div>
                     </xsl:when>
                     <xsl:otherwise>
                        <xsl:call-template name="rule" />
                     </xsl:otherwise>
                  </xsl:choose>
               </xsl:for-each>
            </div> <!-- container -->
         </body>
      </html>
   </xsl:template>

   <xsl:template name="rule">
      <div class="rule">
         <xsl:call-template name="createheader" />

         <xsl:call-template name="topbox" />

         <xsl:call-template name="description" />

         <xsl:if test="block">
            <xsl:for-each select="block">
               <div id="block" class="line" style="width:100%; box-sizing:border-box; padding-top:0.3em; padding-bottom:0.3em; float:left;">
                  <b><xsl:value-of select="name" disable-output-escaping="yes" /><xsl:text> </xsl:text></b>
                  <xsl:if test="action">
                     <span style="font-family: 'pfactions'; font-size: 1.3em; text-align: center;"><xsl:value-of select="action" /> </span><xsl:text> </xsl:text>
                  </xsl:if>
                  <xsl:if test="type">
                     <xsl:text> </xsl:text><xsl:value-of select="type" disable-output-escaping="yes" /><xsl:text>; </xsl:text>
                  </xsl:if>
                  <xsl:for-each select="part">
                     <xsl:if test="@linebreak">
                        <br />
                     </xsl:if>
                     <b><xsl:value-of select="name" disable-output-escaping="yes" /></b><xsl:text> </xsl:text>
                     <xsl:value-of select="text()" disable-output-escaping="yes" />
                     <xsl:if test="position()!=last()">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </div>
            </xsl:for-each>
         </xsl:if>
         <xsl:if test="special">
            <div id="special" class="line" style="float: left;">
               <b>Special&#160;</b><xsl:value-of select="special[1]" disable-output-escaping="yes"/>
            </div>
            <xsl:for-each select="special[position()>1]">
               <div id="special" class="line" style="float: left;">
                  <xsl:value-of select="." disable-output-escaping="yes"/>
               </div>
            </xsl:for-each>
         </xsl:if>
         <xsl:if test="heighten">
            <div id="topbox" style="width:100%; box-sizing:border-box; padding:0.1em; float:left; border-top: 0.1em solid black;">
               <xsl:for-each select="heighten">
                  <div id="heighten" class="line" style="float: left;">
                     <b>Heightened (<xsl:value-of select="@value" />)&#160;</b>
                     <xsl:value-of select="." disable-output-escaping="yes" />
                  </div>
               </xsl:for-each>
            </div>
         </xsl:if>
         <xsl:if test="levels">
            <div id="topbox" style="width:100%; box-sizing:border-box; padding:0.1em; float:left; border-top: 0.1em solid black;">
               <xsl:for-each select="levels">
                  <div id="levels" class="line" style="float: left;">
                     <b>Level (<xsl:value-of select="@value" />)&#160;</b>
                     <xsl:value-of select="." disable-output-escaping="yes" />
                  </div>
               </xsl:for-each>
            </div>
         </xsl:if>
         <xsl:if test="traittext">
            <div id="topbox" style="width:100%; box-sizing:border-box; padding:0.1em; float:left; border-top: 0.1em solid black;">
               <xsl:for-each select="traittext">
                  <div id="traitbox" class="line" style="float:left;">
                     <b><xsl:value-of select="name" /> </b><br/>
                     <xsl:value-of select="text()" disable-output-escaping="yes" />
                  </div>
               </xsl:for-each>
            </div>
         </xsl:if>
         <xsl:if test="variant">
            <xsl:for-each select="variant">
               <div id="topbox" style="width:100%; box-sizing:border-box; padding:0.1em; float:left; border-top: 0.1em solid black;">
                  <div id="variant" class="line" style="float: left;">
                     <xsl:choose>
                        <xsl:when test="child::*[1]/@italic">
                           <b><span style="text-transform: capitalize;"><xsl:value-of select="name(child::*[1])" /></span><xsl:text> </xsl:text></b><i><xsl:value-of select="child::*[1]" disable-output-escaping="yes" /></i>
                        </xsl:when>
                        <xsl:otherwise>
                           <b><span style="text-transform: capitalize;"><xsl:value-of select="name(child::*[1])" /></span><xsl:text> </xsl:text></b><xsl:value-of select="child::*[1]" disable-output-escaping="yes" />
                        </xsl:otherwise>
                     </xsl:choose>
                     <xsl:if test="level">
                        <xsl:text>; </xsl:text>
                        <b>Level </b><xsl:value-of select="level" />
                     </xsl:if>
                  </div>
                  <xsl:call-template name="topbox" />

                  <xsl:call-template name="description" />

               </div>
            </xsl:for-each>
         </xsl:if>

      </div>

   </xsl:template>

   <xsl:template name="createheader">
      <div id="header" style="width:100%; float:left; border-bottom: 0.1em solid black; ">
         <div id="title" style="width:100%; float:left; margin:0.1em; margin-bottom: 0.2em; margin-left:0.4em; vertical-align:middle; font-variant: small-caps; letter-spacing:1px;">
            <div id="typelevel" style="float:right; text-align:right; margin-right: 0.6em; font-size: 1.2em; font-weight: bold; letter-spacing: 0px;">
               <xsl:value-of select="type" />
               <xsl:if test="level"><xsl:text> </xsl:text><xsl:value-of select="level"/> </xsl:if>
            </div>
            <span style="font-weight: bold; font-size:1.2em; margin:0.1em;">
               <xsl:value-of select="title" disable-output-escaping="yes"/>
            </span>
            <xsl:if test="action or cast/@action">
               <xsl:text>&#160;</xsl:text><span style="font-family: 'pfactions'; font-size: 1.8em; text-align: center;"><xsl:value-of select="action" /><xsl:value-of select="cast/@action" /></span>
               <xsl:if test="action/@to or cast/@to">
                  <xsl:text> to </xsl:text><span style="font-family: 'pfactions'; font-size: 1.8em; text-align: center;"><xsl:value-of select="action/@to" /><xsl:value-of select="cast/@to" /></span>
               </xsl:if>
               <xsl:if test="action/@or or cast/@or">
                  <xsl:text> or </xsl:text><span style="font-family: 'pfactions'; font-size: 1.8em; text-align: center;"><xsl:value-of select="action/@or" /><xsl:value-of select="cast/@or" /></span>
               </xsl:if>
            </xsl:if>
         </div>
      </div>

      <xsl:call-template name="traits" />

   </xsl:template>

   <xsl:template name="traits">
      <xsl:if test="uncommon or rare or trait">
         <div>
            <div id="traits" style="width: 100%; float: left; margin: 0.1em; margin-bottom:0em; color: white;">
               <xsl:if test="uncommon" >
                  <div id="rarity" style="float:left; margin: 0.1em; border: 0.2em solid gold; background-color: #c45500; font-variant: small-caps; padding: 0.3em 0.3em; padding-top: 0.25em;">
                     <xsl:text>Uncommon</xsl:text>
                  </div>
               </xsl:if>
               <xsl:if test="rare" >
                  <div id="rarity" style="float:left; margin: 0.1em; border: 0.2em solid gold; background-color: #0c1466; font-variant: small-caps; padding: 0.3em 0.3em padding-top: 0.25em;;">
                     <xsl:text>Rare</xsl:text>
                  </div>
               </xsl:if>
               <xsl:for-each select="trait">
                  <div id="trait" style="float:left; margin: 0.1em; border: 0.2em solid gold; background-color: #5d0000; font-variant: small-caps; padding: 0.3em 0.25em;">
                     <xsl:value-of select="." />
                  </div>
               </xsl:for-each>
            </div>
         </div>
      </xsl:if>
   </xsl:template>

   <xsl:template name="topbox">

      <xsl:if test="tradition or cast or range or area or save or duration or prereq or frequency or trigger or requirement or craft or ammunition or usage or hands or reload or bulk or weaptype or weapcat or group or activate or price or access">
         <xsl:choose>
            <xsl:when test="name()='variant'">
               <div id="topbox" style="width:100%; box-sizing:border-box; padding:0.1em; padding-top: 0em; float:left;">
                  <xsl:call-template name="topbox-content" />
               </div>
            </xsl:when>
            <xsl:otherwise>
               <div id="topbox" style="width:100%; box-sizing:border-box; padding:0.1em; padding-top: 0em; float:left; border-bottom: 0.1em solid black;">
                  <xsl:call-template name="topbox-content" />
               </div>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:if>
   </xsl:template>

   <xsl:template name="topbox-content">
      <xsl:if test="name()='variant' and trait">
         <div style="font-size:90%;">
            <xsl:call-template name="traits" />
         </div>
      </xsl:if>

            <xsl:if test="prereq">
               <div id="prereq" class="line" style="float: left;">
                  <b>Prerequisites </b>
                  <xsl:value-of select="prereq" disable-output-escaping="yes" />
               </div>
            </xsl:if>
            <xsl:if test="price or damage or cost">
               <div id="price" class="line" style="float: left;">
                  <xsl:if test="price">
                     <b>Price </b>
                     <xsl:value-of select="price" />
                     <xsl:if test="damage or cost">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="damage">
                     <b>Damage </b>
                     <xsl:value-of select="damage" />
                     <xsl:if test="cost">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="cost">
                     <b>Cost </b>
                     <xsl:value-of select="cost" disable-output-escaping="yes" />
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="ac or dexcap or checkpenalty or spdpenalty">
               <div id="armor" class="line" style="float:left;">
                  <xsl:if test="ac">
                     <b>AC Bonus </b>
                     <xsl:value-of select="ac" />
                     <xsl:if test="dexcap or checkpenalty or spdpenalty">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="dexcap">
                     <b>Dex Cap </b>
                     <xsl:value-of select="dexcap" />
                     <xsl:if test="checkpenalty or spdpenalty">
                        <xsl:text>; </xsl:text><br/>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="checkpenalty">
                     <b>Check Penalty </b>
                     <xsl:value-of select="checkpenalty"/>
                     <xsl:if test="spdpenalty">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="spdpenalty">
                     <b>Speed Penalty </b>
                     <xsl:value-of select="spdpenalty" />
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="strreq or armorcat or armorgroup">
               <div id="armor" class="line" style="float: left;">
                  <xsl:if test="strreq">
                     <b>Strength </b>
                     <xsl:value-of select="strreq" />
                     <xsl:if test="armorcat or armorgroup">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="armorcat">
                     <b>Category </b>
                     <xsl:value-of select="armorcat" />
                     <xsl:if test="armorgroup">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="armorgroup">
                     <b>Group </b>
                     <xsl:value-of select="armorgroup"/>
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="hands or usage or bulk or hardness or shieldhp or shieldbt">
               <div id="usagebulk" class="line" style="float: left;">
                  <xsl:if test="hands">
                     <b>Hands </b>
                     <xsl:value-of select="hands" disable-output-escaping="yes" />
                     <xsl:if test="usage or bulk or hardness or shieldhp or shieldbt">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="usage">
                     <b>Usage </b>
                     <xsl:value-of select="usage" disable-output-escaping="yes" />
                     <xsl:if test="bulk or hardness or shieldhp or shieldbt">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="bulk">
                     <b>Bulk </b>
                     <xsl:value-of select="bulk" disable-output-escaping="yes" />
                     <xsl:if test="hardness or shieldhp or shieldbt">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="hardness">
                     <b>Hardness </b>
                     <xsl:value-of select="hardness" disable-output-escaping="yes" />
                     <xsl:if test="shieldhp or shieldbt">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="shieldhp">
                     <b>HP </b>
                     <xsl:if test="shieldbt">
                        <b>(BT) </b>
                     </xsl:if>
                     <xsl:value-of select="shieldhp" disable-output-escaping="yes" />
                     <xsl:if test="shieldbt">
                        <xsl:text> (</xsl:text>
                        <xsl:value-of select="shieldbt" disable-output-escaping="yes" />
                        <xsl:text>)</xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="shieldbt and not(shieldhp)">
                     <b>BT </b>
                     <xsl:value-of select="shieldbt" disable-output-escaping="yes" />
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="frequency">
               <div id="freq" class="line" style="float: left;">
                  <b>Frequency </b>
                  <xsl:value-of select="frequency" disable-output-escaping="yes" />
               </div>
            </xsl:if>
            <xsl:if test="access">
               <div id="access" class="line" style="float: left;">
                  <xsl:if test="access">
                     <b>Access </b>
                     <xsl:value-of select="access" disable-output-escaping="yes" />
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="trigger or cast">
               <div id="triggercast" class="line" style="float: left;">
                  <xsl:if test="cast">
                     <b>Cast </b><!-- <span style="font-family: 'pfactions'; font-size: 1.35em; text-align: center;"><xsl:value-of select="cast/@action" /> </span><xsl:text> </xsl:text>
                     <xsl:if test="cast/@to">
                        <xsl:text>to </xsl:text><span style="font-family: 'pfactions'; font-size: 1.35em; margin-top:0em; margin-bottom:0em; text-align: center;"><xsl:value-of select="cast/@to" /> </span><xsl:text> </xsl:text>
                     </xsl:if>
                     <xsl:if test="cast/@or">
                        <xsl:text>or </xsl:text><span style="font-family: 'pfactions'; font-size: 1.35em; text-align: center;"><xsl:value-of select="cast/@or" /> </span><xsl:text> </xsl:text>
                     </xsl:if> -->
                     <xsl:value-of select="cast" disable-output-escaping="yes" />
                     <xsl:if test="trigger">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="trigger">
                     <b>Trigger </b>
                     <xsl:value-of select="trigger" disable-output-escaping="yes" />
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="requirement or craft">
               <div id="requirement" class="line" style="float: left;">
                  <b>
                     <xsl:if test="craft">
                        <xsl:text>Craft </xsl:text>
                     </xsl:if>
                     <xsl:text>Requirement </xsl:text></b>
                  <xsl:value-of select="requirement" disable-output-escaping="yes" />
                  <xsl:value-of select="craft" disable-output-escaping="yes" />
               </div>
            </xsl:if>
            <xsl:if test="range or targets or reload or area">
               <div id="rangereload" class="line" style="float: left;">
                  <xsl:if test="range">
                     <b>Range </b>
                     <xsl:value-of select="range" disable-output-escaping="yes" />
                     <xsl:if test="reload or targets or area">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="targets">
                     <b>Targets </b>
                     <xsl:value-of select="targets" disable-output-escaping="yes" />
                  </xsl:if>
                  <xsl:if test="area">
                     <b>Area </b>
                     <xsl:value-of select="area" disable-output-escaping="yes" />
                  </xsl:if>
                  <xsl:if test="reload">
                     <b>Reload </b>
                     <xsl:value-of select="reload" disable-output-escaping="yes" />
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="weaptype or weapcat or weapgroup">
               <div id="weapon" class="line" style="float: left;">
                  <xsl:if test="weaptype">
                     <b>Type </b>
                     <xsl:value-of select="weaptype" />
                     <xsl:if test="weapcat or weapgroup">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="weapcat">
                     <b>Category </b>
                     <xsl:value-of select="weapcat" />
                     <xsl:if test="weapgroup">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="weapgroup">
                     <b>Group </b>
                     <xsl:value-of select="weapgroup" />
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="base">
               <div id="baseitem" class="line" style="float: left;">
                  <xsl:if test="base">
                     <b>Base <xsl:value-of select="base/@item"/><xsl:text> </xsl:text></b>
                     <xsl:value-of select="base" disable-output-escaping="yes" />
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="save or duration">
               <div id="savedura" class="line" style="float: left;">
                  <xsl:if test="save">
                     <b>Saving Throw </b>
                     <xsl:value-of select="save" disable-output-escaping="yes" />
                     <xsl:if test="duration">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="duration">
                     <b>Duration </b>
                     <xsl:value-of select="duration" disable-output-escaping="yes" />
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="ammunition">
               <div id="ammunition" class="line" style="float: left;">
                  <b>Ammunition </b>
                  <xsl:value-of select="ammunition" />
               </div>
            </xsl:if>
            <xsl:if test="activate">
               <div id="activate" class="line" style="float: left;">
                  <b>Activate </b>
                  <span style="font-family: 'pfactions'; font-size: 150%; width:2em; text-align: center;"><xsl:value-of select="activate/action" /></span>
                  <xsl:text> </xsl:text><xsl:value-of select="activate/type" disable-output-escaping="yes" />
                  <xsl:if test="activate/trigger">
                     <xsl:text>; </xsl:text><b>Trigger </b>
                     <xsl:value-of select="activate/trigger" disable-output-escaping="yes" />
                  </xsl:if>
                  <xsl:if test="activate/requirement">
                     <xsl:text>; </xsl:text>
                     <xsl:if test="activate/requirement/@linebreak">
                        <br />
                     </xsl:if>
                     <b>Requirement </b>
                     <xsl:value-of select="activate/requirement" disable-output-escaping="yes" />
                  </xsl:if>
               </div>
            </xsl:if>

   </xsl:template>

   <xsl:template name="description">
      <div id="description" class="line" style="float: left;">
         <xsl:value-of select="line[1]" disable-output-escaping="yes"/>
      </div>
      <xsl:for-each select="line[position()>1]">
         <xsl:choose>
            <xsl:when test="@results">
               <div id="resultblock" class="line" style="float: left, padding: 0.4em;">
                  <xsl:if test="critsuccess">
                     <div id="result" class="line" style="float: left;">
                        <b>Critical Success: </b><xsl:value-of select="critsuccess" disable-output-escaping="yes" />
                     </div>
                  </xsl:if>
                  <xsl:if test="success">
                     <div id="result" class="line" style="float: left;">
                        <b>Success: </b><xsl:value-of select="success" disable-output-escaping="yes" />
                     </div>
                  </xsl:if>
                  <xsl:if test="fail">
                     <div id="result" class="line" style="float: left;">
                        <b>Failure: </b><xsl:value-of select="fail" disable-output-escaping="yes" />
                     </div>
                  </xsl:if>
                  <xsl:if test="critfail">
                     <div id="result" class="line" style="float: left;">
                        <b>Critical Failure: </b><xsl:value-of select="critfail" disable-output-escaping="yes" />
                     </div>
                  </xsl:if>
               </div>
            </xsl:when>
            <xsl:when test="@list">
               <xsl:if test="@list!=''">
                  <div id="listtitle" class="line" style="float: left; width:100%; margin-top: 0.3em;">
                     <b><xsl:value-of select="@list" /></b>
                  </div>
               </xsl:if>
               <div id="list" class="line" style="float: left; padding-left: 2.2em;">
                  <xsl:for-each select="entry">
                     <div id="listentry" clas="line" style="float: left; width:100%;">
                        &#9658;<xsl:text> </xsl:text>
                        <xsl:if test="@name">
                           <b><xsl:value-of select="@name"/></b><xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="." disable-output-escaping="yes" />
                     </div>
                  </xsl:for-each>
               </div>
            </xsl:when>
            <xsl:when test="@action">
               <div id="list" class="line" style="float: left; padding-left: 2em;">
                  <span style="font-family: 'pfactions'; font-size: 150%; width:2em; text-align: center;"><xsl:value-of select="@action" /></span>
                  <xsl:text> </xsl:text>
                  <xsl:if test="@traits">
                     <b> (<xsl:value-of select="@traits" disable-output-escaping="yes" />) </b>
                  </xsl:if>
                  <xsl:value-of select="." disable-output-escaping="yes" />
               </div>
            </xsl:when>
            <xsl:otherwise>
               <div id="description" class="line" style="float: left;">
                  <xsl:if test="@name">
                     <b><xsl:value-of select="@name"/></b><xsl:text> </xsl:text>
                  </xsl:if>
                  <xsl:value-of select="." disable-output-escaping="yes"/>
               </div>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>

</xsl:stylesheet>
