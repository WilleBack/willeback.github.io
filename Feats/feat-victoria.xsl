<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="../Powers/power.xsl" />

<xsl:template match="/catalog">
	<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<style>
			.container {
            width:calc(100% - 1em);
				box-sizing:border-box;
				float:left;
			}

			.feat {
				margin:0.2cm;
				width:98%;
				float:left;
				page-break-inside:avoid;
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
				font-family:DnDLolth;
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
				font-family:DnDLolth;
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

			}


		</style>
	</head>
	<body style="font-family:MentorSansStd, Trebuchet, Verdana, Arial; font-size:9pt;margin:0cm; ">
	<!-- <div class="listcontainer">
		<div class="groupholder">
			<div class="grouptitle">Feat Groups</div>
			<xsl:for-each select="list">
				<xsl:call-template name="listgroup">
               <xsl:with-param name="tier">Heroic</xsl:with-param>
            </xsl:call-template>
				<xsl:call-template name="listgroup">
               <xsl:with-param name="tier">Paragon</xsl:with-param>
            </xsl:call-template>
				<xsl:call-template name="listgroup">
               <xsl:with-param name="tier">Epic</xsl:with-param>
            </xsl:call-template>
			</xsl:for-each>
		</div>

		<xsl:if test="count(//catalog/feat/category)>0">
			<div class="groupholder">
				<div class="grouptitle">Special Feat Categories</div>
				<xsl:for-each select="category">
					<xsl:call-template name="listcategory">
                  <xsl:with-param name="tier">Heroic</xsl:with-param>
               </xsl:call-template>
               <xsl:call-template name="listcategory">
                  <xsl:with-param name="tier">Paragon</xsl:with-param>
               </xsl:call-template>
               <xsl:call-template name="listcategory">
                  <xsl:with-param name="tier">Epic</xsl:with-param>
               </xsl:call-template>
				</xsl:for-each>
			</div>
		</xsl:if>

		<xsl:if test="count(//catalog/feat[group='Class'])>0">
			<div class="groupholder">
				<div class="grouptitle">Class Feats</div>

				<xsl:for-each select="class">
					<xsl:call-template name="listprereq">
                  <xsl:with-param name="tier">Heroic</xsl:with-param>
               </xsl:call-template>
               <xsl:call-template name="listprereq">
                  <xsl:with-param name="tier">Paragon</xsl:with-param>
               </xsl:call-template>
               <xsl:call-template name="listprereq">
                  <xsl:with-param name="tier">Epic</xsl:with-param>
               </xsl:call-template>
				</xsl:for-each>

			<xsl:if test="count(//catalog/feat[prereq='any martial' and tier='Heroic'])>0">
				<div class="list">
					<div class="groupname">Any martial class - Heroic</div>
					<xsl:for-each select="feat[prereq='any martial' and tier='Heroic']">
						<xsl:call-template name="line" />
					</xsl:for-each>
				</div>
			</xsl:if>

			<xsl:if test="count(//catalog/feat[prereq='any martial' and tier='Paragon'])>0">
				<div class="list">
					<div class="groupname">Any martial class - Paragon</div>
					<xsl:for-each select="feat[prereq='any martial' and tier='Paragon']">
						<xsl:call-template name="line" />
					</xsl:for-each>
				</div>
			</xsl:if>

			<xsl:if test="count(//catalog/feat[prereq='any martial' and tier='Epic'])>0">
				<div class="list">
					<div class="groupname">Any martial class - Epic</div>
					<xsl:for-each select="feat[prereq='any martial' and tier='Epic']">
						<xsl:call-template name="line" />
					</xsl:for-each>
				</div>
			</xsl:if>

		</div>
	</xsl:if>

		<xsl:if test="count(//catalog/feat[group='Racial'])>0">
			<div class="groupholder">
			<div class="grouptitle">Racial Feats</div>

			<xsl:for-each select="race">
				<xsl:call-template name="listprereq">
               <xsl:with-param name="tier">Heroic</xsl:with-param>
            </xsl:call-template>
				<xsl:call-template name="listprereq">
               <xsl:with-param name="tier">Paragon</xsl:with-param>
            </xsl:call-template>
				<xsl:call-template name="listprereq">
               <xsl:with-param name="tier">Epic</xsl:with-param>
            </xsl:call-template>
			</xsl:for-each>
		</div>
	</xsl:if>

	</div> -->

	<div id="headstuff" style="width:calc(100% - 1em); float:left; padding-left:1pt;">
		<div class="grouptitle">Feat descriptions</div>
	</div>

	<div class="container">
   
      <xsl:for-each select="feat[tier = 'Heroic' and not(category)]">
         <xsl:choose>
            <xsl:when test="group = 'Class'">
               <xsl:choose>
                  <xsl:when test="prereq = 'Warlord'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="prereq = 'any martial'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="prereq = 'Leader'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise />
               </xsl:choose>
            </xsl:when>
            <xsl:when test="group = 'Racial'">
               <xsl:choose>
                  <xsl:when test="prereq = 'Human'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:when test="prereq = 'humanoid'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:when test="prereq = 'natural'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:otherwise />
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:call-template name="feat" />
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
      
      <xsl:for-each select="feat[tier = 'Paragon' and not(category)]">
         <xsl:choose>
            <xsl:when test="group = 'Class'">
               <xsl:choose>
                  <xsl:when test="prereq = 'Warlord'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="prereq = 'any martial'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="prereq = 'Leader'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise />
               </xsl:choose>
            </xsl:when>
            <xsl:when test="group = 'Racial'">
               <xsl:choose>
                  <xsl:when test="prereq = 'Human'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:when test="prereq = 'humanoid'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:when test="prereq = 'natural'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:otherwise />
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:call-template name="feat" />
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
      
      <xsl:for-each select="feat[tier = 'Epic' and not(category)]">
         <xsl:choose>
            <xsl:when test="group = 'Class'">
               <xsl:choose>
                  <xsl:when test="prereq = 'Warlord'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="prereq = 'any martial'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="prereq = 'Leader'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise />
               </xsl:choose>
            </xsl:when>
            <xsl:when test="group = 'Racial'">
               <xsl:choose>
                  <xsl:when test="prereq = 'Human'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:when test="prereq = 'humanoid'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:when test="prereq = 'natural'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:otherwise />
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:call-template name="feat" />
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
      
      <div id="headstuff" style="width:calc(100% - 1em); float:left; padding-left:1pt;">
         <div class="grouptitle">Special Category Feats</div>
      </div>
      
      <xsl:for-each select="feat[tier = 'Heroic' and category]">
         <xsl:choose>
            <xsl:when test="group = 'Class'">
               <xsl:choose>
                  <xsl:when test="prereq = 'Warlord'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="prereq = 'any martial'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="prereq = 'Leader'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise />
               </xsl:choose>
            </xsl:when>
            <xsl:when test="group = 'Racial'">
               <xsl:choose>
                  <xsl:when test="prereq = 'Human'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:when test="prereq = 'humanoid'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:when test="prereq = 'natural'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:otherwise />
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:call-template name="feat" />
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
      
      <xsl:for-each select="feat[tier = 'Paragon' and category]">
         <xsl:choose>
            <xsl:when test="group = 'Class'">
               <xsl:choose>
                  <xsl:when test="prereq = 'Warlord'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="prereq = 'any martial'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="prereq = 'Leader'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise />
               </xsl:choose>
            </xsl:when>
            <xsl:when test="group = 'Racial'">
               <xsl:choose>
                  <xsl:when test="prereq = 'Human'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:when test="prereq = 'humanoid'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:when test="prereq = 'natural'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:otherwise />
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:call-template name="feat" />
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>
      
      <xsl:for-each select="feat[tier = 'Epic' and category]">
         <xsl:choose>
            <xsl:when test="group = 'Class'">
               <xsl:choose>
                  <xsl:when test="prereq = 'Warlord'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="prereq = 'any martial'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:when test="prereq = 'Leader'">
                     <xsl:choose>
                        <xsl:when test="group = 'Racial'">
                           <xsl:choose>
                              <xsl:when test="prereq = 'Human'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'humanoid'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:when test="prereq = 'natural'">
                                 <xsl:call-template name="feat" />
                              </xsl:when>
                              <xsl:otherwise />
                           </xsl:choose>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:call-template name="feat" />
                        </xsl:otherwise>
                     </xsl:choose>
                  </xsl:when>
                  <xsl:otherwise />
               </xsl:choose>
            </xsl:when>
            <xsl:when test="group = 'Racial'">
               <xsl:choose>
                  <xsl:when test="prereq = 'Human'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:when test="prereq = 'humanoid'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:when test="prereq = 'natural'">
                     <xsl:call-template name="feat" />
                  </xsl:when>
                  <xsl:otherwise />
               </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
               <xsl:call-template name="feat" />
            </xsl:otherwise>
         </xsl:choose>
      </xsl:for-each>

	</div>
	</body>
	</html>
</xsl:template>

<xsl:template name="feat">

	<div class="feat">
		<xsl:choose>
			<xsl:when test="tier = 'Heroic'">
				<xsl:call-template name="featheader" >
					<xsl:with-param name="featbg">RoyalBlue</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="tier = 'Paragon'">
				<xsl:call-template name="featheader" >
					<xsl:with-param name="featbg">MediumBlue</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="tier = 'Epic'">
				<xsl:call-template name="featheader" >
					<xsl:with-param name="featbg">Navy</xsl:with-param>
				</xsl:call-template>
			</xsl:when>
         <xsl:otherwise>
            <xsl:call-template name="featheader">
               <xsl:with-param name="featbg">Yellow</xsl:with-param>
            </xsl:call-template>
         </xsl:otherwise>
		</xsl:choose>
		<div id="categroup" style="background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro); width:100%; box-sizing:border-box; padding:0.3em; float:left;">
			<xsl:choose>
				<xsl:when test="category">
					<b>
						<div id="category" style="width:8.5em; float:left;">
							<xsl:for-each select="category">
								<xsl:value-of select="."/>
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</div>
					</b>
					<div id="blob" style="width: 1.3em; float: left; text-align:center;">
						&#x25C6;
					</div>
					<div id="group" style="width:calc(100% - 9.8em); float:left;">
						<xsl:for-each select="group">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="group" style="width:100%; float:left;">
						<xsl:for-each select="group">
							<xsl:value-of select="."/>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div> <!-- categroup -->
		<div id="featcontent" style="width:100%; box-sizing:border-box; padding:0.3em; text-indent:-0.4em; padding-left:0.7em; float:left;background:linear-gradient(to right,WhiteSmoke, WhiteSmoke,Snow);">
			<xsl:if test="prereq">
				<div style="width:100%;">
					<b>Prerequisites: </b>
					<xsl:for-each select="prereq">
						<xsl:choose>
							<xsl:when test="@type='ability'">
								<xsl:value-of select="text()"/> <xsl:text> </xsl:text> <xsl:value-of select="value"/>
							</xsl:when>
							<xsl:when test="@type='power' or @type='ritual'">
								<i><xsl:value-of select="text()"/></i> <xsl:text> </xsl:text>
                        <xsl:if test="@kind">
                           <xsl:value-of select="@kind"/> <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="@type"/>
							</xsl:when>
							<xsl:when test="@type='skill'">
								<xsl:text>trained in </xsl:text> <xsl:value-of select="text()"/>
							</xsl:when>
							<xsl:when test="@type='deity'">
								<xsl:text>must worship </xsl:text> <xsl:value-of select="text()"/>
							</xsl:when>
							<xsl:when test="@type='proficiency'">
								<xsl:text>proficiency with </xsl:text> <xsl:value-of select="text()"/>
							</xsl:when>
							<xsl:when test="@type='hidden'">
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="text()"/> <xsl:text> </xsl:text> <xsl:value-of select="@type"/>
							</xsl:otherwise>
						</xsl:choose>
                  
                  <xsl:if test="@extra">
                     <xsl:text> </xsl:text><xsl:value-of select="@extra"/>
                  </xsl:if>

						<xsl:choose>
							<xsl:when test="@combine">
								<xsl:if test="@combine!=';'">
									<xsl:text> </xsl:text>
								</xsl:if>
								<xsl:value-of select="@combine"/> <xsl:text> </xsl:text>
							</xsl:when>
							<xsl:when test="@type='hidden'">
							</xsl:when>
							<xsl:when test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:when>
							<xsl:otherwise/>
						</xsl:choose>

					</xsl:for-each>
				</div>
			</xsl:if>
			<div style="width:100%;">
            <xsl:choose>
               <xsl:when test="benefit[1]/@skill">
                  <b>Benefit: </b><xsl:text>You gain training in the </xsl:text>
                  <xsl:value-of select="benefit[1]/@skill" disable-output-escaping="yes"/>
                  <xsl:text> skill.</xsl:text>
               </xsl:when>
               <xsl:when test="benefit[1]/@skill-class">
                  <b>Benefit: </b><xsl:text>You gain training in  one skill from the </xsl:text>
                  <xsl:value-of select="benefit[1]/@skill-class" disable-output-escaping="yes"/>
                  <xsl:text>'s class skill list.</xsl:text>
               </xsl:when>
               <xsl:when test="benefit[1]/@skills">
                  <b>Benefit: </b><xsl:text>You gain training in the </xsl:text>
                  <xsl:value-of select="benefit[1]/@skills" disable-output-escaping="yes"/>
                  <xsl:text> skill.</xsl:text>
               </xsl:when>
               <xsl:when test="benefit[1]/@skills-either">
                  <b>Benefit: </b><xsl:text>You gain training in either the </xsl:text>
                  <xsl:value-of select="benefit[1]/@skills-either" disable-output-escaping="yes"/>
                  <xsl:text> skill.</xsl:text>
               </xsl:when>
               <xsl:otherwise>
                  <b>Benefit: </b><xsl:value-of select="benefit[1]" disable-output-escaping="yes"/>
               </xsl:otherwise>
            </xsl:choose>
			</div>
			<xsl:for-each select="benefit[position()>1]">
            <xsl:choose>
               <xsl:when test="@name or bullet or @bullet">
                  <div style="width:calc(100% - 2em); padding-left:1.5em;">
                     <xsl:if test="@bullet or bullet">
                        <xsl:text>&#9658; </xsl:text>
                     </xsl:if>
                     <xsl:choose>
                        <xsl:when test="@style='i'">
                           <i><xsl:value-of select="@name"/>: </i>
                        </xsl:when>
                        <xsl:when test="@name">
                           <b><xsl:value-of select="@name"/>: </b>
                        </xsl:when>
                        <xsl:otherwise>
                        </xsl:otherwise>
                     </xsl:choose>
                     <xsl:if test="trigger">
                        <i>Trigger: </i>
                        <xsl:value-of select="trigger" disable-output-escaping="yes"/>
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                     <xsl:if test="type">
                        <i><xsl:value-of select="type" disable-output-escaping="yes"/></i>
                        <xsl:text> </xsl:text>
                     </xsl:if>
                     <xsl:value-of select="text()" disable-output-escaping="yes"/> 
                  </div>
               </xsl:when>
               <xsl:when test="@skill">
                  <div style="width:100%; text-indent:0.7em;">
                     <xsl:value-of select="." disable-output-escaping="yes"/>
                     <xsl:text>, you gain training in the </xsl:text>
                     <xsl:value-of select="@skill" disable-output-escaping="yes"/>
                     <xsl:text> skill.</xsl:text>
                  </div>
               </xsl:when>
               <xsl:when test="@skill-class">
                  <div style="width:100%; text-indent:0.7em;">
                     <xsl:value-of select="." disable-output-escaping="yes"/>
                     <xsl:text>, you gain training in  one skill from the </xsl:text>
                     <xsl:value-of select="@skill" disable-output-escaping="yes"/>
                     <xsl:text>'s class skill list.</xsl:text>
                  </div>
               </xsl:when>
               <xsl:when test="@skills">
                  <div style="width:100%; text-indent:0.7em;">
                     <xsl:value-of select="." disable-output-escaping="yes"/>
                     <xsl:text>, you gain training in the </xsl:text>
                     <xsl:value-of select="@skills" disable-output-escaping="yes"/>
                     <xsl:text> skill.</xsl:text>
                  </div>
               </xsl:when>
               <xsl:when test="@skills-either">
                  <div style="width:100%; text-indent:0.7em;">
                     <xsl:value-of select="." disable-output-escaping="yes"/>
                     <xsl:text>, you gain training in either the </xsl:text>
                     <xsl:value-of select="@skills-either" disable-output-escaping="yes"/>
                     <xsl:text> skill.</xsl:text>
                  </div>
               </xsl:when>
               <xsl:otherwise>
                  <div style="width:100%; text-indent:0.7em;">
                     <xsl:if test="trigger">
                        <i>Trigger: </i>
                        <xsl:value-of select="trigger" disable-output-escaping="yes"/>
                        <xsl:text>; </xsl:text>
                     </xsl:if>
                     <xsl:if test="type">
                        <i><xsl:value-of select="type" disable-output-escaping="yes"/></i>
                        <xsl:text> </xsl:text>
                     </xsl:if>
                     <xsl:value-of select="." disable-output-escaping="yes"/>
                  </div>
               </xsl:otherwise>
            </xsl:choose>
			</xsl:for-each>
			<xsl:if test="special">
					<div style="width:100%;">
					<b>Special: </b><xsl:value-of select="special[1]" disable-output-escaping="yes"/>
				</div>
				<xsl:for-each select="special[position()>1]">
					<div style="width:100%; text-indent:0.7em;">
						<xsl:value-of select="." disable-output-escaping="yes"/>
					</div>
				</xsl:for-each>
			</xsl:if>
			<xsl:if test="associated">
				<div style="width:100%;">
					<b>Associated Powers: </b>
					<xsl:for-each select="associated">
						<i><xsl:value-of select="."/></i>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each>
				</div>
			</xsl:if>
		</div> <!-- content -->


			<xsl:apply-templates select="power" />

	</div> <!-- feat -->

</xsl:template>

<xsl:template name="featheader">
	<xsl:param name="featbg">Purple</xsl:param>

	<div id="header" style="background-color:{$featbg}; box-sizing:border-box; width:100%; float:left; color:white; ">
		<div id="title" style="float:left; margin:0.5em; vertical-align:middle; font-size:1.1em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; max-width:60%;"><xsl:value-of select="title"/></div>
		<div id="tier" style="width: 20%; float:right; text-align:right; font-size: 0.8em; margin:0.5em;"><xsl:value-of select="tier"/></div>
	</div>

</xsl:template>

<xsl:template name="listgroup">
	<xsl:param name="tier"/>

	<xsl:if test="count(//catalog/feat[group=current()/@selection and tier=$tier])>0">
		<div class="list">
			<div class="groupname"> <xsl:value-of select="@selection" /> <xsl:text> - </xsl:text><xsl:value-of select="$tier"/></div>
         <xsl:for-each select="//catalog/feat[group=current()/@selection and tier=$tier]">
            <xsl:choose>
               <xsl:when test="group = 'Class'">
                  <xsl:choose>
                     <xsl:when test="prereq = 'Warlord'">
                        <xsl:call-template name="line" />
                     </xsl:when>
                     <xsl:when test="prereq = 'any martial'">
                        <xsl:call-template name="line" />
                     </xsl:when>
                     <xsl:when test="prereq = 'Leader'">
                        <xsl:call-template name="line" />
                     </xsl:when>
                     <xsl:otherwise />
                  </xsl:choose>
               </xsl:when>
               <xsl:when test="group = 'Racial'">
                  <xsl:choose>
                     <xsl:when test="prereq = 'Human'">
                        <xsl:call-template name="line" />
                     </xsl:when>
                     <xsl:when test="prereq = 'humanoid'">
                        <xsl:call-template name="line" />
                     </xsl:when>
                     <xsl:when test="prereq = 'natural'">
                        <xsl:call-template name="line" />
                     </xsl:when>
                     <xsl:otherwise />
                  </xsl:choose>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:call-template name="line" />
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>
		</div>
	</xsl:if>

</xsl:template>

<xsl:template name="listcategory">
   <xsl:param name="tier"/>

	<xsl:if test="count(//catalog/feat[category=current()/@selection and tier=$tier])>0">
		<div class="list">
			<div class="groupname"> <xsl:value-of select="@selection" /> <xsl:text> - </xsl:text> <xsl:value-of select="$tier"/></div>
			<xsl:for-each select="//catalog/feat[category=current()/@selection and tier=$tier]">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>

</xsl:template>

<xsl:template name="listprereq">
   <xsl:param name="tier"/>

   <xsl:choose>
		<xsl:when test="@selection='Drow' or @selection='Eladrin' or @selection='Elf' or @selection='Hamadryad' or @selection='Hengeyokai' or @selection='Satyr' or @selection='Wilden'">
         <xsl:if test="count(//catalog/feat[(prereq=current()/@selection or prereq='fey') and tier=$tier])>0">
            <div class="list">
               <div class="groupname"> <xsl:value-of select="@selection" /><xsl:text> - </xsl:text><xsl:value-of select="$tier"/></div>
               <xsl:for-each select="//catalog/feat[(prereq=current()/@selection or prereq='fey') and tier=$tier]">
                  <xsl:call-template name="line" />
               </xsl:for-each>
            </div>
         </xsl:if>
		</xsl:when>
		<xsl:when test="@selection='Gnome' or @selection='Pixie' or @selection='Svirfneblin'">
         <xsl:if test="count(//catalog/feat[(prereq=current()/@selection or prereq='Small or smaller' or prereq='fey') and tier=$tier])>0">
            <div class="list">
               <div class="groupname"> <xsl:value-of select="@selection" /><xsl:text> - </xsl:text><xsl:value-of select="$tier"/></div>
               <xsl:for-each select="//catalog/feat[(prereq=current()/@selection or prereq='Small or smaller' or prereq='fey') and tier=$tier]">
                  <xsl:call-template name="line" />
               </xsl:for-each>
            </div>
         </xsl:if>
		</xsl:when>
		<xsl:when test="@selection='Goblin' or @selection='Halfling' or @selection='Kobold'">
         <xsl:if test="count(//catalog/feat[(prereq=current()/@selection or prereq='Small or smaller') and tier=$tier])>0">
            <div class="list">
               <div class="groupname"> <xsl:value-of select="@selection" /> <xsl:text> - </xsl:text><xsl:value-of select="$tier"/></div>
               <xsl:for-each select="//catalog/feat[(prereq=current()/@selection or prereq='Small or smaller') and tier=$tier]">
                  <xsl:call-template name="line" />
               </xsl:for-each>
            </div>
         </xsl:if>
		</xsl:when>
      <xsl:when test="@selection='Shadar-kai'">
         <xsl:if test="count(//catalog/feat[(prereq=current()/@selection or prereq='shadow') and tier=$tier])>0">
            <div class="list">
               <div class="groupname"> <xsl:value-of select="@selection" /> <xsl:text> - </xsl:text><xsl:value-of select="$tier"/></div>
               <xsl:for-each select="//catalog/feat[(prereq=current()/@selection or prereq='shadow') and tier=$tier]">
                  <xsl:call-template name="line" />
               </xsl:for-each>
            </div>
         </xsl:if>
      </xsl:when>
		<xsl:otherwise>
         <xsl:if test="count(//catalog/feat[prereq=current()/@selection and tier=$tier])>0">
            <div class="list">
               <div class="groupname"> <xsl:value-of select="@selection" /> <xsl:if test="@selection='Defender' or @selection='Controller' or @selection='Striker' or @selection='Leader'"> <xsl:text> role</xsl:text> </xsl:if> <xsl:text> - </xsl:text><xsl:value-of select="$tier"/></div>
               <xsl:for-each select="//catalog/feat[prereq=current()/@selection and tier=$tier]">
                  <xsl:call-template name="line" />
               </xsl:for-each>
            </div>
         </xsl:if>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

<xsl:template name="line">
	<xsl:choose>
		<xsl:when test="position() mod 2 = 1">
			<div id="line" style="width:100%; padding: 0.2em; float:left; background:linear-gradient(to right, LightGrey, LightGrey, Gainsboro);">
				<xsl:call-template name="linecontent" />
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div id="line" style="width:100%; padding: 0.1em; float:left; background:linear-gradient(to right, WhiteSmoke, WhiteSmoke, Snow);">
				<xsl:call-template name="linecontent" />
			</div>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

<xsl:template name="linecontent">

		<div class="title"><xsl:value-of select="title"/></div>
		<div class="category">
			<i><xsl:for-each select="category">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
			&#160;</i>
		</div>
		<div class="groups">
			<xsl:for-each select="group">
				<xsl:value-of select="."/>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</div>

</xsl:template>

</xsl:stylesheet>
