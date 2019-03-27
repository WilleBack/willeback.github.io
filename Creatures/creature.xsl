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
            
            .item {
               background:linear-gradient(to right, #cddbb7, #dfe8d1);
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
	<!-- <body style="font-family:Verdana; font-size:8pt;margin:0cm; ">
		<div class="listcontainer">
		   <div class="groupholder">
		      <div class="grouptitle">Lists by level</div>
		         <xsl:for-each select="list"> 
		            <xsl:call-template name="listgroup" />
		         </xsl:for-each>
		   </div> <!-- groupholder -->
		</div> -->
			
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
         <xsl:with-param name="bgcolor">##4e5c2e</xsl:with-param>
      </xsl:call-template>
      
      <div id="topbox" style="width:100%; box-sizing:border-box; padding:0.3em; float:left;"> 
         <div id="hp" class="line" style="width: calc(100% - 9em); float: left;">
            <b>HP </b> <xsl:value-of select="hp" /><xsl:text>; </xsl:text><b>Bloodied </b> <xsl:value-of select="bloodied" />
         </div>
         <div id="init" class="line" style="width: 8.5em; float: right; text-align: right;">
            <b>Initiative </b> <xsl:value-of selet="init" />
         </div>
         <div id="defense" class="line" style="width: calc(100% - 9em); float: left;">
            <b>AC </b> <xsl:value-of select="ac" /><xsl:text>, </xsl:text><b>Fortitude </b> <xsl:value-of select="fort" /><xsl:text>, </xsl:text> <b>Reflex </b> <xsl:value-of select="ref" /> <xsl:text>, </xsl:text><b>Will </b> <xsl:value-of select="will" />
            <xsl:for-each select="defmod">
               <div class="line" style="padding-left:2.3em; width:calc(100% - 9em);">
                  <xsl:value-of select="." />
               </div>
            </xsl:for-each>
         </div>
         <div id="senses" class="line" style="width: 8.5em; float: right; text-align: right;">
            <b>Perception </b> <xsl:value-of select="perception" /> <br />
            <b>Insight </b> <xsl:value-of select="insight" />
            <xsl:for-each select="sense">
               <br /> <xsl:value-of select="." />
            </xsl:for-each>
         </div>
         <div id="move" class="line" style="width: calc(100% - 9em); float: left;">
            <b>Speed </b> <xsl:value-of select="speed" />
            <xsl:if text="fly">
               <xsl:text>, </xsl:text> <i>fly </i> <xsl:value-of select="fly" />
            </xsl:if>
            <xsl:if text="climb">
               <xsl:text>, </xsl:text> <i>climb </i> <xsl:value-of select="climb" />
            </xsl:if>
            <xsl:if text="swim">
               <xsl:text>, </xsl:text> <i>swim </i> <xsl:value-of select="swim" />
            </xsl:if>
            <xsl:for-each select="speedmod">
               <div class="line" style="padding-left:2.3em; width:calc(100% - 9em);">
                  <xsl:value-of select="." />
               </div>
            </xsl:for-each>
         </div>
      </div> <!-- topbox -->
      
      <xsl:for-each select="category">
         <div id="catname" style="background-color:#4e5c2e; width:100%; padding:0.2em; font-variant:small-caps; font-size:1.1em; float:left;">
            <xsl:value-of select="category-name" />
         </div>
         
         <xsl:for-each select="block">
            <div id="blockhead" style="background:linear-gradient(to right, #EFD09F, #f4debc); width:100%; box-sizing:border-box; padding:0.3em; float:left; ">
               <div style="float:left; width: max-content; max-width: calc(100% - 14em);">
                  <b><xsl:value-of select="name" /> </b>
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
                  <div style="float:left; max-width:21em; "><b><xsl:value-of select="frequency" /></b></div>
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
            </xsl:for-each> <!-- line -->
         </xsl:for-each> <!-- block -->
      </xsl:for-each> <!-- category -->
      
   </div> 

</xsl:template>

<xsl:template name="createheader">
   <xsl:param name="bgcolor">Purple</xsl:param>
   
   <div id="header" style="background-color:{$bgcolor}; width:100%; float:left; color:white; ">
      <div id="title" style="float:left; margin:0.5em; vertical-align:middle; font-size:1.2em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; width:calc(100% - 9em);"> 
         <xsl:value-of select="title"/>
      </div>
      <div id="rolelevel" style="width: 10em; float:right; text-align:right; font-size: 0.8em; margin:0.5em; font-weight: bold;">
         <xsl:value-of select="level"/>
         <xsl:if test="rolestrength">
            <xsl:text> </xsl:text><xsl:value-of select="rolestrength"
         </xsl:if>
         <xsl:text> </xsl:text> <xsl:value-of select="role" />
         <xsl:if test="subrole">
            <xsl:text> (</xsl:text> <xsl:value-of select="subrole" /> <xsl:text>)</xsl:text>
         </xsl:if>
      </div>
      <div id="typexp" style="width: 100%; float: left;">
         <div id="type" style="float:left; margin: 0.2em; font-variant: small-caps; width:calc(100% - 8em);">
            <xsl:value-of select="size" /> <xsl:value-of select="origin" /> <xsl:value-of select="type" />
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
         <div id="xp" style="width: 7.5em; float:right; text-align: right;">
            <xsl:text>XP </xsl:text> <xsl:value-of select="xp" />
         </div>
      </div>
   </div> 
	
</xsl:template>
	
<xsl:template name="listgroup">
	
	<xsl:if test="count(//catalog/item[level/value=current()/@selection and category='Common'])>0">
		<div class="list">
			<xsl:choose>
				<xsl:when test="@selection='1'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">1</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='2'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">2</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='3'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='4'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">4</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='5'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">5</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='6'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">6</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='7'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">7</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='8'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">8</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='9'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">9</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='10'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">10</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='11'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">11</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='12'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">12</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='13'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">13</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='14'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">14</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='15'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">15</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='16'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">16</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='17'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">17</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='18'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">18</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='19'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">19</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='20'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">20</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='21'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">21</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='22'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">22</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='23'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">23</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='24'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">24</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='25'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">25</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='26'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">26</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='27'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">27</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='28'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">28</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='29'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">29</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='30'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Common</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
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
	
	<xsl:if test="count(//catalog/item[level/value=current()/@selection and category='Uncommon'])>0">
		<div class="list">
			<xsl:choose>
				<xsl:when test="@selection='1'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">1</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='2'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">2</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='3'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='4'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">4</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='5'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">5</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='6'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">6</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='7'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">7</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='8'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">8</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='9'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">9</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='10'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">10</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='11'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">11</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='12'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">12</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='13'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">13</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='14'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">14</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='15'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">15</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='16'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">16</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='17'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">17</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='18'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">18</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='19'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">19</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='20'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">20</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='21'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">21</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='22'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">22</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='23'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">23</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='24'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">24</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='25'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">25</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='26'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">26</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='27'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">27</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='28'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">28</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='29'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">29</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='30'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Uncommon</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">5</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<![CDATA[<i>Error</i>]]>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:if>
	
	<xsl:if test="count(//catalog/feat[group=current()/@selection and tier='Epic'])>0">
		<div class="list">
			<xsl:choose>
				<xsl:when test="@selection='1'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">1</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='2'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">2</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='3'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='4'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">4</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='5'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">5</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='6'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">6</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='7'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">7</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='8'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">8</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='9'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">9</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='10'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">10</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='11'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">11</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='12'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">12</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='13'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">13</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='14'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">14</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='15'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">15</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='16'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">16</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='17'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">17</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='18'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">18</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='19'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">19</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='20'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">20</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='21'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">21</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='22'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">22</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='23'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">23</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='24'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">24</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='25'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">25</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='26'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">26</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='27'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">27</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='28'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">28</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='29'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="line">
							<xsl:with-param name="levelvalue">29</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='30'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Rare</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
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
					<i><xsl:for-each select="subtype">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if> 
					</xsl:for-each></i> 
				</div>
				<div class="price" style="width:9em; float:right; text-align:right; padding:0.1em;">
					<xsl:value-of select="level[value=$levelvalue]/price"/><xsl:text>gp</xsl:text>
				</div>
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div id="line" style="width:100%; float:left; background:linear-gradient(to right, WhiteSmoke, WhiteSmoke, Snow); box-sizing:border-box; padding:0.2em;">
				<div class="title" style="width:calc(55% - 5em); float:left; padding:0.1em;"><xsl:value-of select="title"/>&#160;<xsl:value-of select="level[value=$levelvalue]/bonus" /></div>
				<div class="subtype" style="width:calc(45% - 5em); float:left; padding:0.1em;"> 
					<i><xsl:for-each select="subtype">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if> 
					</xsl:for-each></i> 
				</div>
				<div class="price" style="width:9em; float:right; text-align:right; padding:0.1em;">
					<xsl:value-of select="level[value=$levelvalue]/price"/><xsl:text>gp</xsl:text>
				</div>
			</div>
		</xsl:otherwise>
	</xsl:choose>
	
</xsl:template>
	
</xsl:stylesheet>
