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

         <xsl:apply-templates select="block" />

         <xsl:call-template name="ending" />

      </div>

   </xsl:template>

   <xsl:template name="createheader">
      <xsl:if test="title or action or type or level">
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
      </xsl:if>

      <xsl:call-template name="traits" />

   </xsl:template>

   <xsl:template name="traits">
      <xsl:if test="uncommon or rare or trait">
         <div>
            <div id="traits" style="width: 100%; float: left; margin: 0.1em; margin-bottom:0em; color: white;">
               <xsl:if test="uncommon" >
                  <div id="rarity" style="float:left; margin: 0.1em 0em; border: 0.2em solid gold; background-color: #c45500; font-variant: small-caps; padding: 0.3em 0.3em;">
                     <xsl:text>Uncommon</xsl:text>
                  </div>
               </xsl:if>
               <xsl:if test="rare" >
                  <div id="rarity" style="float:left; margin: 0.1em 0em; border: 0.2em solid gold; background-color: #0c1466; font-variant: small-caps; padding: 0.3em 0.3em;">
                     <xsl:text>Rare</xsl:text>
                  </div>
               </xsl:if>
               <xsl:for-each select="trait">
                  <div id="trait" style="float:left; margin: 0.1em 0em; border: 0.2em solid gold; background-color: #5d0000; font-variant: small-caps; padding: 0.3em 0.25em;">
                     <xsl:value-of select="." />
                  </div>
               </xsl:for-each>
            </div>
         </div>
      </xsl:if>
   </xsl:template>

   <xsl:template name="topbox">

      <xsl:if test="tradition or cast or range or area or targets or save or defense or duration or prereq or frequency or trigger or requirement or craft or ammunition or usage or hands or reload or bulk or weaptype or weapcat or armorgroup or armorcat or ac or dexcap or group or activate or price or access">
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

            <xsl:if test="tradition">
               <div id="tradition" class="line" style="float: left;">
                  <b>Traditions </b>
                  <xsl:for-each select="tradition">
                     <xsl:apply-templates/>
                     <xsl:if test="position()!=last()">
                        <xsl:text>, </xsl:text>
                     </xsl:if>
                  </xsl:for-each>
               </div>
            </xsl:if>
            <xsl:if test="prereq">
               <div id="prereq" class="line" style="float: left;">
                  <b>Prerequisites </b>
                  <xsl:apply-templates select="prereq"/>
               </div>
            </xsl:if>
            <xsl:if test="price or damage or cost">
               <div id="price" class="line" style="float: left;">
                  <xsl:if test="price">
                     <b>Price </b>
                     <xsl:apply-templates select="price"/>
                     <xsl:if test="damage or cost">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="damage">
                     <b>Damage </b>
                     <xsl:apply-templates select="damage"/>
                     <xsl:if test="cost">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="cost">
                     <b>Cost </b>
                     <xsl:apply-templates select="cost"/>
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="ac or dexcap or checkpenalty or spdpenalty">
               <div id="armor" class="line" style="float:left;">
                  <xsl:if test="ac">
                     <b>AC Bonus </b>
                     <xsl:apply-templates select="ac"/>
                     <xsl:if test="dexcap or checkpenalty or spdpenalty">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="dexcap">
                     <b>Dex Cap </b>
                     <xsl:apply-templates select="dexcap"/>
                     <xsl:if test="checkpenalty or spdpenalty">
                        <xsl:text>; </xsl:text><br/>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="checkpenalty">
                     <b>Check Penalty </b>
                     <xsl:apply-templates select="checkpenalty"/>
                     <xsl:if test="spdpenalty">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="spdpenalty">
                     <b>Speed Penalty </b>
                     <xsl:apply-templates select="spdpenalty"/>
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="strreq or armorcat or armorgroup">
               <div id="armor" class="line" style="float: left;">
                  <xsl:if test="strreq">
                     <b>Strength </b>
                     <xsl:apply-templates select="strreq"/>
                     <xsl:if test="armorcat or armorgroup">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="armorcat">
                     <b>Category </b>
                     <xsl:apply-templates select="armorcat"/>
                     <xsl:if test="armorgroup">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="armorgroup">
                     <b>Group </b>
                     <xsl:apply-templates select="armorgroup"/>
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="hands or usage or bulk or hardness or shieldhp or shieldbt">
               <div id="usagebulk" class="line" style="float: left;">
                  <xsl:if test="hands">
                     <b>Hands </b>
                     <xsl:apply-templates select="hands"/>
                     <xsl:if test="usage or bulk or hardness or shieldhp or shieldbt">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="usage">
                     <b>Usage </b>
                     <xsl:apply-templates select="usage"/>
                     <xsl:if test="bulk or hardness or shieldhp or shieldbt">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="bulk">
                     <b>Bulk </b>
                     <xsl:apply-templates select="bulk"/>
                     <xsl:if test="hardness or shieldhp or shieldbt">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="hardness">
                     <b>Hardness </b>
                     <xsl:apply-templates select="hardness"/>
                     <xsl:if test="shieldhp or shieldbt">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="shieldhp">
                     <b>HP </b>
                     <xsl:if test="shieldbt">
                        <b>(BT) </b>
                     </xsl:if>
                     <xsl:apply-templates select="shieldhp"/>
                     <xsl:if test="shieldbt">
                        <xsl:text> (</xsl:text>
                        <xsl:apply-templates select="shieldbt"/>
                        <xsl:text>)</xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="shieldbt and not(shieldhp)">
                     <b>BT </b>
                     <xsl:apply-templates select="shieldbt"/>
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="frequency">
               <div id="freq" class="line" style="float: left;">
                  <b>Frequency </b>
                  <xsl:apply-templates select="frequency"/>
               </div>
            </xsl:if>
            <xsl:if test="access">
               <div id="access" class="line" style="float: left;">
                  <xsl:if test="access">
                     <b>Access </b>
                     <xsl:apply-templates select="access"/>
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
                     <xsl:apply-templates select="cast"/>
                     <xsl:if test="trigger">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="trigger">
                     <b>Trigger </b>
                     <xsl:apply-templates select="trigger"/>
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
                     <xsl:apply-templates select="requirement"/>
                     <xsl:apply-templates select="craft"/>
               </div>
            </xsl:if>
            <xsl:if test="range or targets or reload or area">
               <div id="rangereload" class="line" style="float: left;">
                  <xsl:if test="range">
                     <b>Range </b>
                     <xsl:apply-templates select="range"/>
                     <xsl:if test="reload or targets or area">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="targets">
                     <b>Targets </b>
                     <xsl:apply-templates select="targets"/>
                  </xsl:if>
                  <xsl:if test="area">
                     <b>Area </b>
                     <xsl:apply-templates select="area"/>
                  </xsl:if>
                  <xsl:if test="reload">
                     <b>Reload </b>
                     <xsl:apply-templates select="reload"/>
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="weaptype or weapcat or weapgroup">
               <div id="weapon" class="line" style="float: left;">
                  <xsl:if test="weaptype">
                     <b>Type </b>
                     <xsl:apply-templates select="weaptype"/>
                     <xsl:if test="weapcat or weapgroup">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="weapcat">
                     <b>Category </b>
                     <xsl:apply-templates select="weapcat"/>
                     <xsl:if test="weapgroup">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="weapgroup">
                     <b>Group </b>
                     <xsl:apply-templates select="weapgroup"/>
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="base">
               <div id="baseitem" class="line" style="float: left;">
                  <xsl:if test="base">
                     <b>Base <xsl:value-of select="base/@item"/><xsl:text> </xsl:text></b>
                     <xsl:apply-templates select="base"/>
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="save or defense or duration">
               <div id="savedura" class="line" style="float: left;">
                  <xsl:if test="save or defense">
                     <b>Defense </b>
                     <xsl:apply-templates select="save"/>
                     <xsl:apply-templates select="defense"/>
                     <xsl:if test="duration">
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                  </xsl:if>
                  <xsl:if test="duration">
                     <b>Duration </b>
                     <xsl:apply-templates select="duration"/>
                  </xsl:if>
               </div>
            </xsl:if>
            <xsl:if test="ammunition">
               <div id="ammunition" class="line" style="float: left;">
                  <b>Ammunition </b>
                  <xsl:apply-templates select="ammunition"/>
               </div>
            </xsl:if>
            <xsl:if test="activate">
               <div id="activate" class="line" style="float: left;">
                  <b>Activate </b>
                  <span style="font-family: 'pfactions'; font-size: 150%; width:2em; text-align: center;"><xsl:value-of select="activate/action" /></span>
                  <xsl:if test="activate/action/@to">
                     <xsl:text> to </xsl:text>
                     <span style="font-family: 'pfactions'; font-size: 150%; width:2em; text-align: center;"><xsl:value-of select="activate/action/@to" /></span>
                  </xsl:if>
                  <xsl:if test="activate/action/@or">
                     <xsl:text> or </xsl:text>
                     <span style="font-family: 'pfactions'; font-size: 150%; width:2em; text-align: center;"><xsl:value-of select="activate/action/@or" /></span>
                  </xsl:if>
                  <xsl:text> </xsl:text> <xsl:apply-templates select="activate/type"/>
                  <xsl:if test="activate/trigger">
                     <xsl:text>; </xsl:text><b>Trigger </b>
                     <xsl:apply-templates select="activate/trigger"/>
                  </xsl:if>
                  <xsl:if test="activate/requirement">
                     <xsl:text>; </xsl:text>
                     <xsl:if test="activate/requirement/@linebreak">
                        <br />
                     </xsl:if>
                     <b>Requirement </b>
                     <xsl:apply-templates select="activate/requirement"/>
                  </xsl:if>
               </div>
            </xsl:if>

   </xsl:template>

   <xsl:template name="description">
      <xsl:for-each select="line">
         <xsl:choose>
            <xsl:when test="@results">
               <div id="resultblock" class="line" style="float: left, padding: 0.4em;">
                  <xsl:if test="critsuccess">
                     <div id="result" class="line" style="float: left;">
                        <b>Critical Success: </b>
                        <xsl:apply-templates select="critsuccess[1]"/>
                        <xsl:for-each select="critsuccess[position()>1]">
                           <br/> <xsl:apply-templates/>
                        </xsl:for-each>
                     </div>
                  </xsl:if>
                  <xsl:if test="success">
                     <div id="result" class="line" style="float: left;">
                        <b>Success: </b>
                        <xsl:apply-templates select="success[1]"/>
                        <xsl:for-each select="success[position()>1]">
                           <br/> <xsl:apply-templates/>
                        </xsl:for-each>
                     </div>
                  </xsl:if>
                  <xsl:if test="fail">
                     <div id="result" class="line" style="float: left;">
                        <b>Failure: </b>
                        <xsl:apply-templates select="fail[1]"/>
                        <xsl:for-each select="fail[position()>1]">
                           <br/> <xsl:apply-templates/>
                        </xsl:for-each>
                     </div>
                  </xsl:if>
                  <xsl:if test="critfail">
                     <div id="result" class="line" style="float: left;">
                        <b>Critical Failure: </b>
                        <xsl:apply-templates select="critfail[1]"/>
                        <xsl:for-each select="critfail[position()>1]">
                           <br/><xsl:apply-templates/>
                        </xsl:for-each>
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
                        <xsl:apply-templates/>
                     </div>
                  </xsl:for-each>
               </div>
            </xsl:when>
            <xsl:when test="@action">
               <div id="list" class="line" style="float: left; padding-left: 2em;">
                  <xsl:if test="@name">
                     <b><xsl:value-of select="@name"/></b><xsl:text> </xsl:text>
                  </xsl:if>
                  <span style="font-family: 'pfactions'; font-size: 150%; width:2em; text-align: center;"><xsl:value-of select="@action" /></span>
                  <xsl:text> </xsl:text>
                  <xsl:if test="@traits">
                     <b> (<xsl:value-of select="@traits" disable-output-escaping="yes" />) </b>
                  </xsl:if>
                  <xsl:apply-templates/>
               </div>
            </xsl:when>
            <xsl:otherwise>
               <div id="description" class="line" style="float: left;">
                  <xsl:if test="@name">
                     <b><xsl:value-of select="@name"/></b><xsl:text> </xsl:text>
                  </xsl:if>
                  <xsl:apply-templates/>
               </div>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
   </xsl:template>

   <xsl:template match="block">
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
   </xsl:template>

   <xsl:template name="ending">
      <xsl:if test="special">
         <div id="special" class="line" style="float: left;">
            <b>Special&#160;</b><xsl:apply-templates select="special[1]"/>
         </div>
         <xsl:for-each select="special[position()>1]">
            <div id="special" class="line" style="float: left;">
               <xsl:apply-templates/>
            </div>
         </xsl:for-each>
      </xsl:if>
      <xsl:if test="heighten">
         <div id="topbox" style="width:100%; box-sizing:border-box; padding:0.1em; float:left; border-top: 0.1em solid black;">
            <xsl:for-each select="heighten">
               <div id="heighten" class="line" style="float: left;">
                  <b>Heightened (<xsl:value-of select="@value" />)&#160;</b>
                  <xsl:apply-templates/>
               </div>
            </xsl:for-each>
         </div>
      </xsl:if>
      <xsl:if test="levels">
         <div id="topbox" style="width:100%; box-sizing:border-box; padding:0.1em; float:left; border-top: 0.1em solid black;">
            <xsl:for-each select="levels">
               <div id="levels" class="line" style="float: left;">
                  <b>Level (<xsl:value-of select="@value" />)&#160;</b>
                  <xsl:apply-templates/>
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
   </xsl:template>

   <xsl:template match="critsuccess">
      <xsl:choose>
         <xsl:when test=".=''">
            <xsl:text>The target is unaffected.</xsl:text>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>

   <xsl:template match="text()">
      <xsl:value-of select="." disable-output-escaping="yes"/>
   </xsl:template>

   <xsl:template match="act">
      <span style="font-family: 'pfactions'; font-size: 150%; width:2em; text-align: center;"><xsl:apply-templates/></span>
   </xsl:template>

   <xsl:template match="br">
      <br/>
   </xsl:template>

   <xsl:template match="b">
      <b><xsl:apply-templates/></b>
   </xsl:template>

   <xsl:template match="i">
      <i><xsl:apply-templates/></i>
   </xsl:template>

   <xsl:template match="u">
      <u><xsl:apply-templates/></u>
   </xsl:template>

</xsl:stylesheet>
