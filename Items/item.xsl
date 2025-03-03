<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/catalog">
	<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<xsl:if test="collection">
			<title><xsl:value-of select="collection" /></title>
		</xsl:if>
		<style>
			.container {
				width: 100%;
				box-sizing:border-box;
				float:left;
			}

			.item {
				background:linear-gradient(to right, #f8e9d5, #fcf4eb);
				margin:0.2cm;
				width:calc(100% - 1.2em);
				float:left;
				break-inside:avoid;
				border: 0.25em solid #DA9722;
				border-radius: 0.2em;
			}

			.pricetable {
				box-sizing:border-box;
				width: 100%;
				column-count: 2;
				column-gap:.2em;
			}

			.priceline {
				width:100%;
				box-sizing:border-box;
				float:left;
				page-break-inside:avoid;
				margin:0.25em;
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
				width:100%;
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
					column-gap:0.4em;
				}

				.listcontainer {
					column-count: 2;
					column-gap:0.4em;
				}
			}

			@media only screen and (min-width:1300px) {
				.container {
					column-count: 4;
					column-gap:0.4em;
				}

			}
			@page {
				size: auto;
				margin: 0.7cm 0.6cm 0.9cm;
			}

			@media print {
				.container {
					column-count: 2;
					column-gap:0.4em;
					margin:0cm;
				}

				.listcontainer {
					column-count: 2;
					column-gap:0.5em;
					margin:0cm;
				}

			}


		</style>
	</head>
	<body style="font-family:MentorSansStd, Trebuchet, Verdana, Arial; font-size:9pt;margin:0cm; ">
		<!-- <div class="listcontainer">
		   <div class="groupholder">
		      <div class="grouptitle">Lists by level</div>
		         <xsl:for-each select="list">
		            <xsl:call-template name="listgroup" />
		         </xsl:for-each>
		   </div>
		</div> -->

		<div class="grouptitle">
			Item Descriptions
		</div>

		<div class="container">
			<xsl:apply-templates select="item"/>
		</div> <!-- container -->
	</body>
	</html>
</xsl:template>

<xsl:template match="item">

	<div class="item">
		<xsl:call-template name="createheader">
			<xsl:with-param name="bgcolor">#DA9722</xsl:with-param>
		</xsl:call-template>


		<div id="fluff" style="font-family:MentorSansStd-Light; background:linear-gradient(to right, #EFD09F, #f4debc); width:100%; box-sizing:border-box; padding:0.3em; float:left;">
			<i><xsl:apply-templates select="fluff"/></i>
		</div>
		<xsl:choose>
			<xsl:when test="count(level)>1 or type='Alchemical'">
				<div class="pricetable" style="column-count:1; column-gap: 0;">
					<xsl:for-each select="level">
						<div class="priceline" style="width: calc(50% - 0.5em);">
							<div id="lvl" style="width: 4em; float: left; padding-left: 0.1em;"><xsl:text>Lvl </xsl:text><xsl:apply-templates select="value" /></div>
							<div id="enh" style="width: 3em; float:left;"><xsl:apply-templates select="bonus" />&#160;</div>
							<div id="price" style="width:calc(100% - 7.5em); float: left; text-align:right;"><xsl:apply-templates select="price" /><xsl:text>gp</xsl:text></div>
						</div>
					</xsl:for-each>
				</div>
				<xsl:if test="type!='Alchemical'">
					<div class="line">
						<b><xsl:apply-templates select="type" /></b>
						<xsl:if test="subtype">
							<b><xsl:text>: </xsl:text></b>
							<xsl:for-each select="subtype">
								<xsl:apply-templates select="." />
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</div>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<div class="pricetable">
					<div class="line">
				     	<b><xsl:apply-templates select="type" /></b>
						<xsl:if test="subtype">
							<b><xsl:text>: </xsl:text></b>
							<xsl:for-each select="subtype">
								<xsl:apply-templates select="." />
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</div>
					<div class="line">
						<xsl:apply-templates select="level/price" /><xsl:text>gp</xsl:text>
					</div>
				</div>
			</xsl:otherwise>
		</xsl:choose>

		<xsl:choose>
			<xsl:when test="type='Alchemical'">
				<div class="pricetable">
					<div class="line">
						<b><xsl:apply-templates select="type" /></b>
						<xsl:if test="subtype">
							<b><xsl:text>: </xsl:text></b>
							<xsl:for-each select="subtype">
								<xsl:apply-templates select="." />
								<xsl:if test="position()!=last()">
									<xsl:text>, </xsl:text>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</div>
					<xsl:apply-templates select="headline[1]" />
					<xsl:apply-templates select="headline[2]" />
					<xsl:apply-templates select="headline[3]" />
				</div>
				<xsl:for-each select="headline[position()>3]">
					<xsl:apply-templates select="."/>
				</xsl:for-each>
			</xsl:when>
			<xsl:otherwise>
				<!-- <xsl:if test="subtype='Primordial Shard'">
					<div class="line">
						<b>Primordial Shard: </b> <xsl:text>You can benefit from only one primordial shard at a time. If you carry more than one, none of them function.</xsl:text>
					</div>
				</xsl:if> -->
				<xsl:apply-templates select="headline" />
			</xsl:otherwise>
		</xsl:choose>

		<xsl:for-each select="block">
			<div id="blockhead" style="background:linear-gradient(to right, #EFD09F, #f4debc); width:100%; box-sizing:border-box; padding:0.3em; float:left; ">
				<div style="float:left; width:100%;">
					<xsl:choose>
						<xsl:when test="not(action)">
							<b><xsl:apply-templates select="name" /> </b>
							<xsl:if test="keyword">
								&#x25C6;
								<span class="keyword" style="font-variant: small-caps; width:calc(100% - 0.5em); margin:0.2em;">
									<b><xsl:for-each select="keyword">
										<xsl:apply-templates select="."/>
										<xsl:if test="position()!=last()">
											<xsl:text>, </xsl:text>
										</xsl:if>
									</xsl:for-each></b>
								</span>
							</xsl:if>
						</xsl:when>
						<xsl:otherwise>
							<span class="keyword" style="font-variant: font-size: 1.2em; small-caps; width:calc(100% - 0.5em);"><b><xsl:value-of select="name" /></b></span>
							<div style="float:left; width:100%; ">
								<b><xsl:value-of select="frequency" /></b>
								&#x25C6;
								<b> <xsl:value-of select="action" /></b><xsl:text> </xsl:text>
								<xsl:choose>
									<xsl:when test="subaction=''">
										<xsl:text>Action</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="subaction" />
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</xsl:otherwise>
					</xsl:choose>

				</div>
			</div>
			<xsl:if test="keyword and action">
				<div class="keyword" style="font-variant: small-caps; float:left; width:calc(100% - 0.5em); margin:0.2em;">
					<b><xsl:for-each select="keyword">
						<xsl:value-of select="."/>
						<xsl:if test="position()!=last()">
							<xsl:text>, </xsl:text>
						</xsl:if>
					</xsl:for-each></b>
				</div>
			</xsl:if>
			<xsl:choose>
				<xsl:when test="spellbook">
					<div class="line">
						<xsl:text>This tome contains two wizard daily </xsl:text>
						<xsl:value-of select="spellbook"/>
						<xsl:text> attack powers, chosen when it was created. Both powers must be of a level equal to or lower than that of the tome. If the tome's level is incresed, one or both powers can be exchanged for new ones.</xsl:text>
					</div>
					<xsl:if test="levels">
						<div class="line" style="padding-left:2.3em;">
							<i><xsl:text>Level </xsl:text><xsl:value-of select="levels"/>: </i>
							<xsl:text>Three </xsl:text>
							<xsl:value-of select="spellbook"/>
							<xsl:text> attack powers, one of which can be an encounter power.</xsl:text>
						</div>
					</xsl:if>
					<div class="line">
						<xsl:text>If you have the wizard class feature Arcane Spellbook, these spells count as being in your spellbook.</xsl:text>
					</div>
				</xsl:when>
				<xsl:when test="spellbook-specific">
					<div class="line">
						<xsl:text>This tome contains the </xsl:text>
						<xsl:for-each select="spellbook-specific">
							<i><xsl:value-of select="."/></i>
							<xsl:if test="@level">
								<xsl:text> level </xsl:text><xsl:value-of select="@level"/>
							</xsl:if>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
						<xsl:text> wizard </xsl:text>
						<xsl:if test="limit">
							<xsl:value-of select="limit"/>
							<xsl:text> </xsl:text>
						</xsl:if>
						<xsl:text>power</xsl:text>
						<xsl:if test="count(spellbook-specific)>1">
							<xsl:text>s</xsl:text>
						</xsl:if>
						<xsl:text>.</xsl:text>
					</div>
					<div class="line">
						<xsl:text>If you have the wizard class feature Arcane Spellbook, </xsl:text>
						<xsl:choose>
							<xsl:when test="count(spellbook-specific)>1">
								<xsl:text>these spells</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text>this spell</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:text> count as being in your spellbook.</xsl:text>
					</div>
				</xsl:when>
				<xsl:when test="bookpower">
					<div class="line"><b>Requirement: </b>You must have implement proficiency with this tome.</div>
					<div class="line"><b>Effect: </b>Choose a power contained in this tome, and expend an unused arcane daily attack power of an equal or higher level.</div>
					<xsl:if test="preceding-sibling::block/levels">
						<div class="line" style="padding-left:2.3em;">
							<i><xsl:text>Level </xsl:text><xsl:value-of select="preceding-sibling::block/levels"/>: </i>
							<xsl:text>If you chose an encounter power contained in this tome, you expend an encounter attack power of an equal or higher level.</xsl:text>
						</div>
					</xsl:if>
					<div class="line">You gain the use of the chosen power during this encounter. The power is lost if not used before the end of the encounter.</div>
				</xsl:when>
				<xsl:when test="bookpower-single">
					<div class="line"><b>Requirement: </b>You must have implement proficiency with this tome.</div>
					<div class="line"><b>Effect: </b><xsl:text>You expend an unused arcane </xsl:text>
						<xsl:value-of select="bookpower-single/@limit"/>
						<xsl:text> power of </xsl:text>
						<xsl:value-of select="bookpower-single/@level"/><xsl:text> level or higher, and gain use of </xsl:text>
						<xsl:value-of select="bookpower-single"/>
						<xsl:text>. If you do not use it by the end of the encounter, it is lost without effect.</xsl:text>
					</div>
				</xsl:when>
				<xsl:when test="poison-fooddrink">
					<div class="line"><b>Effect: </b>Melee touch (one item of food or drink); You apply the poison to the target. The poison retains potency until the end of the encounter.</div>
					<div class="line">
						<xsl:text>When a creature consumes the target food or drink while the poison retains potency, you make the following attack against that creature</xsl:text>
						<xsl:if test="poison-fooddrink!=''">
							<xsl:text> </xsl:text><xsl:apply-templates select="poison-fooddrink" />
							<xsl:text> later</xsl:text>
						</xsl:if>
						<xsl:text>:</xsl:text></div>
				</xsl:when>
			</xsl:choose>
			<xsl:for-each select="line">
				<xsl:choose>
					<xsl:when test="@indent='1'">
						<div class="line" style="padding-left:2.3em;">
							<xsl:apply-templates select="."/>
						</div>
					</xsl:when>
					<xsl:when test="@indent='2'">
						<div class="line" style="padding-left:3.3em;">
							<xsl:apply-templates select="."/>
						</div>
					</xsl:when>
					<xsl:when test="@indent='3'">
						<div class="line" style="padding-left:4.3em;">
							<xsl:apply-templates select="."/>
						</div>
					</xsl:when>
					<xsl:when test="@indent='4'">
						<div class="line" style="padding-left:5.3em;">
							<xsl:apply-templates select="."/>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<div class="line">
							<xsl:apply-templates select="."/>
						</div>
					</xsl:otherwise>
				</xsl:choose>
			</xsl:for-each>
			<xsl:if test="poison-fooddrink">
				<div class="line">
					<b>Special: </b>If you want to apply the poison without being noticed, attempt a Thievery check against any observing creature's Passive Perception.
				</div>
			</xsl:if>
		</xsl:for-each>

	</div>

</xsl:template>

<xsl:template match="line">
	<xsl:if test="@auto">
		<xsl:apply-templates select="bullet" />
	</xsl:if>

	<xsl:choose>
		<xsl:when test="@auto='bard'">
			<xsl:text>If you are a Bard who has proficiency with this weapon, you also have proficiency in this weapon as an implement.</xsl:text>
		</xsl:when>
		<xsl:when test="@auto='bardinstrument'">
			<xsl:text>If you are a Bard, you can use this instrument as an implement for Bard powers.</xsl:text>
		</xsl:when>
		<xsl:when test="@auto='weapliment'">
			<xsl:text>If you are </xsl:text>
			<xsl:apply-templates select="text()"/>
			<xsl:text> who has proficiency with this weapon, you also have proficiency in this weapon as an implement.</xsl:text>
		</xsl:when>
		<xsl:when test="@auto='crit'">
			<xsl:text>When you score a critical hit using this weapon, </xsl:text>
			<xsl:apply-templates />
		</xsl:when>
		<xsl:when test="@auto='critweap'">
			<xsl:text>When you score a critical hit with a Weapon attack using this weapon, </xsl:text>
			<xsl:apply-templates/>
		</xsl:when>
		<xsl:when test="@auto='critimpl'">
			<xsl:text>When you score a critical hit with an Implement attack using this implement, </xsl:text>
			<xsl:apply-templates />
		</xsl:when>
		<xsl:when test="@auto='no-opportunity'">
			<xsl:text>Using this power does not trigger </xsl:text><i>reactive strikes</i>
		</xsl:when>
		<xsl:when test="@auto='no-opportunity-target'">
			<xsl:text>Using this power does not trigger </xsl:text><i>reactive strikes</i><xsl:text> from the target</xsl:text>
		</xsl:when>
		<xsl:when test="@auto='ammo'">
			<xsl:text>When using this ammunition, you use the listed attack bonus instead of your own. You add your weapon's proficiency bonus to attack, but not its enhancement bonus or other modifiers.</xsl:text>
		</xsl:when>
		<xsl:when test="@auto='short-surge'">
			<b>Special: </b>
			<xsl:text>As part of a short rest, you can expend a healing surge to recharge this power.</xsl:text>
		</xsl:when>
		<xsl:when test="@auto='telepathy'">
			<xsl:text>You gain telepathy </xsl:text>
			<xsl:apply-templates select="text()"/>
			<xsl:text>, allowing you to communicate with any other creature in your telepathy range that has a language and is within line of sight.</xsl:text>
		</xsl:when>
		<xsl:when test="@auto='limittelepathy'">
			<xsl:text>You gain limited telepathy </xsl:text>
			<xsl:apply-templates select="text()"/>
			<xsl:text>, allowing you to communicate with any </xsl:text>
			<xsl:apply-templates select="@creature" />
			<xsl:apply-templates select="@limittelepathy" />
			<xsl:text> in your telepathy range that shares a language with you and is within line of sight.</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:apply-templates />
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

	<xsl:template match="headline">
		<xsl:choose>
			<xsl:when test="@auto='attached'">
				<div class="line">
					<b>Attached Component: </b><xsl:text>You must have the Living Construct racial trait to use this item.</xsl:text>
				</div>
			</xsl:when>
			<xsl:when test="@auto='ammo'">
				<div class="line">
					<b>Ammunition: </b><xsl:text>If you know this formula, you can also create </xsl:text><i><xsl:value-of select="text()" /></i>.
				</div>
			</xsl:when>
			<xsl:when test="@auto='losttech'">
				<div class="line">
					<b>Lost Technology: </b><xsl:text>This item is created using lost technology. Each time the item's power is used, there is a chance the item malfunctions or even detonates.</xsl:text>
				</div>
			</xsl:when>
			<xsl:when test="@auto='attackenh'">
				<div class="line">
					<b>Enhancement Bonus: </b><xsl:text>Attack rolls and damage rolls</xsl:text>
					<xsl:if test="@limit">
						<xsl:text> with the weapon from this </xsl:text>
						<xsl:apply-templates select="@limit"/>
						<xsl:text>'s property</xsl:text>
					</xsl:if>
					<xsl:if test="@power">
						<xsl:text> with the attack from this </xsl:text>
						<xsl:apply-templates select="@item"/>
						<xsl:text>'s </xsl:text>
						<xsl:value-of select="@power"/>
						<xsl:text> attack power</xsl:text>
					</xsl:if>
				</div>
			</xsl:when>
			<xsl:when test="@auto='armorenh'">
				<div class="line">
					<b>Enhancement Bonus: </b><xsl:text>AC</xsl:text>
				</div>
			</xsl:when>
			<xsl:when test="@auto='neckenh'">
				<div class="line">
					<b>Enhancement Bonus: </b><xsl:text>Fortitude, Reflex, and Will</xsl:text>
				</div>
			</xsl:when>
			<xsl:when test="@itemdamage">
				<div class="line">
					<b>Item Bonus: </b>
					<xsl:text>Damage rolls with </xsl:text>
					<xsl:apply-templates select="text()" />
					<xsl:text> powers</xsl:text>
					<xsl:if test="@itemdamage!=''">
						<xsl:text> using this </xsl:text>
						<xsl:apply-templates select="@itemdamage" />
					</xsl:if>
				</div>
			</xsl:when>
			<xsl:when test="@itembonus">
				<div class="line">
					<b>Item Bonus: </b>
					<xsl:apply-templates select="text()" />
				</div>
			</xsl:when>
			<xsl:when test="@crit">
				<div class="line">
					<b>Critical: </b><xsl:text>+1</xsl:text>
					<xsl:apply-templates select="@crit"/>
					<xsl:if test="text()">
						<xsl:text> </xsl:text><xsl:apply-templates select="text()"/>
					</xsl:if>
					<xsl:text> damage per plus</xsl:text>
					<xsl:if test="@limit">
						<xsl:text> with the weapon from this </xsl:text>
						<xsl:apply-templates select="@limit"/>
						<xsl:text>'s property</xsl:text>
					</xsl:if>
					<xsl:if test="@power">
						<xsl:text> with the attack from this </xsl:text>
						<xsl:apply-templates select="@item"/>
						<xsl:text>'s </xsl:text>
						<xsl:value-of select="@power"/>
						<xsl:text> attack power</xsl:text>
					</xsl:if>
					<xsl:if test="@alt">
						<xsl:text>, or +1</xsl:text>
						<xsl:apply-templates select="@alt"/><xsl:text> damage per plus </xsl:text>
						<xsl:apply-templates select="@condition" />
					</xsl:if>
					<xsl:if test="@alt2">
						<xsl:text>, or +1</xsl:text>
						<xsl:apply-templates select="@alt2"/><xsl:text> damage per plus </xsl:text>
						<xsl:apply-templates select="@condition2" />
					</xsl:if>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<div class="line">
					<xsl:apply-templates />
				</div>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

<xsl:template name="createheader">
	<xsl:param name="bgcolor">Purple</xsl:param>

	<div id="header" style="background-color:{$bgcolor}; width:100%; float:left; color:white; ">
		<div id="title" style="float:left; margin:0.4em; margin-top:0.3em; vertical-align:middle; font-size:1.2em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; width:calc(100% - 9.5em);">
			<xsl:value-of select="title"/>
		</div>
		<div id="classcat" style="width: 10em; float:right; text-align:right; font-size: 0.8em; margin:0.5em;">
			<xsl:value-of select="category"/><br />
			<xsl:text>Level </xsl:text><xsl:value-of select="level[1]/value"/>
			<xsl:if test="count(level)>1">
				<xsl:text>+</xsl:text>
			</xsl:if>
		</div>
	</div>

</xsl:template>

<xsl:template name="listgroup">

	<xsl:if test="count(//catalog/item[level/value=current()/@selection and category='Common'])>0">
		<div class="list">
			<div class="groupname"> <b><xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> </b><xsl:text> - Common</xsl:text></div>
			<xsl:choose>
				<xsl:when test="@selection='1'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">1</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='2'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">2</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='3'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='4'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">4</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='5'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">5</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='6'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">6</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='7'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">7</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='8'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">8</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='9'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">9</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='10'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">10</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='11'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">11</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='12'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">12</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='13'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">13</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='14'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">14</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='15'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">15</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='16'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">16</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='17'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">17</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='18'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">18</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='19'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">19</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='20'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">20</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='21'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">21</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='22'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">22</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='23'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">23</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='24'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">24</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='25'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">25</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='26'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">26</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='27'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">27</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='28'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">28</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='29'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">29</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='30'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Common']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">30</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<i>Error</i>
				</xsl:otherwise>
			</xsl:choose>

		</div>
	</xsl:if>

	<xsl:if test="count(//catalog/item[level/value=current()/@selection and category='Uncommon'])>0">
		<div class="list">
			<div class="groupname"> <b><xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> </b><xsl:text> - Uncommon</xsl:text></div>
			<xsl:choose>
				<xsl:when test="@selection='1'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">1</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='2'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">2</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='3'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='4'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">4</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='5'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">5</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='6'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">6</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='7'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">7</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='8'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">8</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='9'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">9</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='10'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">10</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='11'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">11</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='12'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">12</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='13'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">13</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='14'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">14</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='15'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">15</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='16'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">16</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='17'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">17</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='18'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">18</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='19'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">19</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='20'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">20</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='21'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">21</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='22'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">22</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='23'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">23</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='24'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">24</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='25'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">25</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='26'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">26</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='27'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">27</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='28'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">28</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='29'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">29</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='30'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Uncommon']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">30</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<i>Error</i>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:if>

	<xsl:if test="count(//catalog/item[level/value=current()/@selection and category='Rare'])>0">
		<div class="list">
			<div class="groupname"> <b><xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> </b><xsl:text> - Rare</xsl:text></div>
			<xsl:choose>
				<xsl:when test="@selection='1'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">1</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='2'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">2</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='3'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='4'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">4</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='5'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">5</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='6'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">6</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='7'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">7</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='8'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">8</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='9'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">9</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='10'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">10</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='11'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">11</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='12'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">12</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='13'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">13</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='14'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">14</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='15'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">15</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='16'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">16</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='17'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">17</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='18'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">18</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='19'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">19</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='20'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">20</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='21'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">21</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='22'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">22</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='23'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">23</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='24'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">24</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='25'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">25</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='26'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">26</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='27'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">27</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='28'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">28</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='29'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">29</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='30'">
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Rare']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">30</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<i>Error</i>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:if>

	<xsl:if test="count(//catalog/item[level/value=current()/@selection and category='Unique'])>0">
		<div class="list">
			<xsl:choose>
				<xsl:when test="@selection='1'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">1</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='2'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">2</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='3'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">3</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='4'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">4</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='5'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">5</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='6'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">6</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='7'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">7</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='8'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">8</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='9'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">9</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='10'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">10</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='11'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">11</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='12'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">12</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='13'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">13</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='14'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">14</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='15'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">15</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='16'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">16</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='17'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">17</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='18'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">18</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='19'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">19</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='20'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">20</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='21'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">21</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='22'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">22</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='23'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">23</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='24'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">24</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='25'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">25</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='26'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">26</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='27'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">27</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='28'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">28</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='29'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">29</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:when test="@selection='30'">
					<div class="groupname"> <xsl:text>Level </xsl:text><xsl:value-of select="@selection" /> <xsl:text> - Unique</xsl:text></div>
					<xsl:for-each select="//catalog/item[level/value=current()/@selection and category='Unique']">
						<xsl:call-template name="listline">
							<xsl:with-param name="levelvalue">30</xsl:with-param>
						</xsl:call-template>
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<i>Error</i>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:if>

</xsl:template>

<xsl:template name="listline">
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
					<xsl:if test="headline/@auto='attached'">
						<xsl:if test="count(subtype)>0">
							<br />
						</xsl:if>
						<xsl:text>[Attached Component]</xsl:text>
					</xsl:if>
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
					<xsl:if test="headline/@auto='attached'">
						<xsl:if test="count(subtype)>0">
							<br />
						</xsl:if>
						<xsl:text>[Attached Component]</xsl:text>
					</xsl:if>
				</div>
				<div class="price" style="width:9em; float:right; text-align:right; padding:0.1em;">
					<xsl:value-of select="level[value=$levelvalue]/price"/><xsl:text>gp</xsl:text>
				</div>
			</div>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

<xsl:template match="bullet">
	&#9658;<xsl:text> </xsl:text>
</xsl:template>

<xsl:template match="name">
	<xsl:choose>
		<xsl:when test="contains(., 'Miss (Level')">
			<b><xsl:apply-templates />: </b>
		</xsl:when>
		<xsl:when test="contains(., 'Effect (Level')">
			<b><xsl:apply-templates />: </b>
		</xsl:when>
		<xsl:when test="contains(., 'Special (Level')">
			<b><xsl:apply-templates />: </b>
		</xsl:when>
		<xsl:when test="contains(., 'Aftereffect')">
			<i><xsl:apply-templates />: </i>
		</xsl:when>
		<xsl:when test="contains(., 'Failed Save')">
			<i><xsl:apply-templates />: </i>
		</xsl:when>
		<xsl:when test="contains(., 'Level')">
			<i><xsl:apply-templates />: </i>
		</xsl:when>
		<xsl:when test="./@style='italic'">
			<i><xsl:apply-templates />: </i>
		</xsl:when>
		<xsl:when test="./@style='under'">
			<u><xsl:apply-templates />:</u><xsl:text> </xsl:text>
		</xsl:when>
		<xsl:when test="name(parent::*) = 'block'">
			<xsl:apply-templates />
		</xsl:when>
		<xsl:otherwise>
			<b><xsl:apply-templates />: </b>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template match="augment">
	<span style="font-variant:small-caps;"><b>Augment <xsl:apply-templates />: </b></span>
</xsl:template>

<xsl:template match="key">
	<b><span class="keyword" style="float:none; font-variant: small-caps; font-size: 1.05em; width:calc(100% - 0.5em); margin:0.1em;"><xsl:apply-templates/></span></b>
</xsl:template>

<xsl:template match="text()">
   <xsl:value-of select="." disable-output-escaping="yes" />
</xsl:template>

<xsl:template match="b">
   <b><xsl:apply-templates /></b>
</xsl:template>

<xsl:template match="i">
   <i><xsl:apply-templates /></i>
</xsl:template>

<xsl:template match="br">
   <br />
</xsl:template>

</xsl:stylesheet>
