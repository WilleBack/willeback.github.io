<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
	<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<style>
			.container {

				box-sizing:border-box;
				float:left;
				page-break-inside:avoid;
			}

			.weapongroup {
				margin:0.2cm;
				width:98%;
				float:left;
				page-break-inside:avoid;
			}

			.weapon {
				margin:0.2cm;
				width:98%;
				float:left;
				page-break-inside:avoid;
			}

			.listcontainer {
				box-sizing:border-box;
				float:left;
				margin-bottom: 1em;

			}

			.groupholder {
				width:100%;
				float:left;
				page-break-inside:avoid;
			}

			.grouptitle {
				width:100%;
				font-size:1.4em;
				font-weight:bold;
				margin:0.2em 0.1em;
			}

			.list {
				margin:0.4em;
				width:97%;
				float:left;
				page-break-inside: avoid;
			}

			.groupname {
				width:100%;
				font-size:1.2em;
				font-weight:bold;
			}

			.title {
				width:10.5em;
				float:left;
			}

			.prof {
				width:3em;
				float:left;
			}

			.damage {
				width:3.5em;
				float:left;
			}

			.range {
				width:5em;
				float:left;
				text-align:center;
			}

			.price {
				width:4em;
				float:left;
			}

			.weight {
				width:3.5em;
				float:left;
			}

			.property {
				width:calc(50% - 15em);
				min-width: 8em;
				float:right;
				margin-right: 0.5em;
			}

			.category {
				width:calc(50% - 15.5em);
				min-width: 8em;
				float:right;
				margin-left: 0.5em;
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
	<body style="font-family:Candara, Trebuchet, Verdana, Arial; font-size:8pt;margin:0cm; ">
	<div class="listcontainer">

        	<xsl:for-each select="catalog/category">
			<div class="groupholder">
				<div class="grouptitle"><xsl:value-of select="@selection" /> Weapons</div>
				<xsl:call-template name="list" />
			</div>
		</xsl:for-each>

	</div> <!-- list container -->

	<div class="container">
		<div class="grouptitle">Weapons by Group</div>
		<xsl:for-each select="catalog/group">
			<div class="weapongroup">
				<b><xsl:value-of select="@selection" />: </b>
				<xsl:for-each select="//catalog/weapon[group=current()/@selection or secondary/group=current()/@selection]">
					<xsl:value-of select="./title" />
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</div>
		</xsl:for-each>
	</div>

		<div class="container">
			<div class="grouptitle">Weapon Descriptions</div>
			<xsl:for-each select="catalog/weapon">
				<xsl:call-template name="weapondesc" />
			</xsl:for-each>
		</div>
	</body>
	</html>
</xsl:template>

<xsl:template name="list">

	<xsl:if test="count(//catalog/weapon[category=current()/@selection and hand='one-handed' and type='melee'])>0">
		<div class="list">
			<div class="groupname"><xsl:text>One-handed Melee</xsl:text></div>
			<xsl:for-each select="//catalog/weapon[category=current()/@selection and hand='one-handed' and type='melee']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>

	<xsl:if test="count(//catalog/weapon[category=current()/@selection and hand='two-handed' and type='melee'])>0">
		<div class="list">
			<div class="groupname"><xsl:text>Two-handed Melee</xsl:text></div>
			<xsl:for-each select="//catalog/weapon[category=current()/@selection and hand='two-handed' and type='melee']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>

	<xsl:if test="count(//catalog/weapon[category=current()/@selection and hand='double' and type='melee'])>0">
		<div class="list">
			<div class="groupname"><xsl:text>Double Melee</xsl:text></div>
			<xsl:for-each select="//catalog/weapon[category=current()/@selection and hand='double' and type='melee']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>

	<xsl:if test="count(//catalog/weapon[category=current()/@selection and hand='one-handed' and type='ranged'])>0">
		<div class="list">
			<div class="groupname"><xsl:text>One-handed Ranged</xsl:text></div>
			<xsl:for-each select="//catalog/weapon[category=current()/@selection and hand='one-handed' and type='ranged']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>

	<xsl:if test="count(//catalog/weapon[category=current()/@selection and hand='two-handed' and type='ranged'])>0">
		<div class="list">
			<div class="groupname"><xsl:text>Two-handed Ranged</xsl:text></div>
			<xsl:for-each select="//catalog/weapon[category=current()/@selection and hand='two-handed' and type='ranged']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>

</xsl:template>

<xsl:template name="line">
	<xsl:choose>
		<xsl:when test="position() mod 2 = 1">
			<div id="line" style="width:100%; float:left; padding:0.1em; background:linear-gradient(to right, LightGrey, LightGrey, Gainsboro); box-sizing:border-box;">
				<xsl:call-template name="linecontent" />
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div id="line" style="width:100%; float:left; padding:0.1em;background:linear-gradient(to right, WhiteSmoke, WhiteSmoke, Snow); box-sizing:border-box;">
				<xsl:call-template name="linecontent" />
			</div>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

<xsl:template name="linecontent">

	<div class="title"><xsl:value-of select="title"/></div>
	<div class="prof"><xsl:text>+</xsl:text><xsl:value-of select="proficient"/></div>
	<div class="damage"><xsl:value-of select="damage"/></div>
	<div class="range"><xsl:value-of select="range"/></div>
	<div class="price"><xsl:value-of select="cost"/><xsl:text> gp</xsl:text></div>
	<div class="weight"><xsl:value-of select="weight"/><xsl:text> lb</xsl:text></div>
	<div class="category">
		<i><xsl:for-each select="group">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
		&#160;</i>
	</div>
	<div class="property">
		<xsl:for-each select="property">
			<xsl:value-of select="."/>
			<xsl:if test="position()!=last()">
				<xsl:text>, </xsl:text>
			</xsl:if>
		</xsl:for-each>
	</div>

	<xsl:for-each select="secondary">
		<div class="linecontainer" style="width:100%; float:left;">
			<div class="title"><xsl:value-of select="title"/></div>
			<div class="prof"><xsl:text>+</xsl:text><xsl:value-of select="proficient"/></div>
			<div class="damage"><xsl:value-of select="damage"/></div>
			<div class="range"><xsl:value-of select="range"/></div>
			<div class="price"><xsl:value-of select="cost"/></div>
			<div class="weight"><xsl:value-of select="weight"/></div>
			<div class="category">
				<i><xsl:for-each select="group">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
				&#160;</i>
			</div>
			<div class="property">
				<xsl:for-each select="property">
					<xsl:value-of select="."/>
					<xsl:if test="position()!=last()">
						<xsl:text>, </xsl:text>
					</xsl:if>
				</xsl:for-each>
			</div>
		</div>

	</xsl:for-each>

</xsl:template>

<xsl:template name="weapondesc">
	<div class="weapon">
		<xsl:call-template name="createheader" />
		<div class="stats" style="width:100%; margin:0.3em; float:left;">
			<b>Proficiency: </b> <xsl:text>+</xsl:text><xsl:value-of select="proficient" /><xsl:text>; </xsl:text> <b>Damage: </b> <xsl:value-of select="damage" /><xsl:text>; </xsl:text> <b>Range: </b> <xsl:value-of select="range" /> <br />
			<b>Cost: </b> <xsl:value-of select="cost" /><xsl:text> gp; </xsl:text> <b>Weight: </b> <xsl:value-of select="weight" /> <xsl:text> lb</xsl:text>
		</div>
		<xsl:for-each select="description">
			<div class="descript" style="width:100%; box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; padding-left:1.3em; float:left;">
				<xsl:value-of select="." />
			</div>
		</xsl:for-each>
		<xsl:choose>
			<xsl:when test="property='-'">
				<div class="descript" style="width:100%; box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; padding-left:1.3em; float:left;">
					<i>No properties.</i>
				</div>
			</xsl:when>
			<xsl:otherwise>
				<xsl:for-each select="property">
					<xsl:call-template name="createproperty" />
				</xsl:for-each>
			</xsl:otherwise>
		</xsl:choose>
		<div class="descript" style="width:100%; box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; padding-left:1.3em; float:left;">
			<b>Weapon Groups: </b>
			<xsl:for-each select="group">
				<xsl:value-of select="." />
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</div>
	</div>

</xsl:template>

<xsl:template name="createheader">
	<xsl:param name="bgcolor">#0f2f63</xsl:param>

	<div id="header" style="background-color:{$bgcolor}; width:100%; float:left; color:white; ">
		<div id="title" style="float:left; margin:0.3em; margin-bottom:0.1em; vertical-align:middle; font-size:1.2em; font-variant: small-caps; font-weight:bold; letter-spacing:1px; width:100%;">
			<xsl:value-of select="title"/>
		</div>
		<div id="classcat" style="width: 100%; float:left; font-size: 0.9em; margin: 0.15em 0.5em;">
			<xsl:value-of select="category"/>&#160;<xsl:value-of select="hand" />&#160;<xsl:value-of select="type" /><xsl:text> weapon</xsl:text>
		</div>
	</div>

</xsl:template>

<xsl:template name="createproperty">
	<div class="descript" style="width:100%; box-sizing:border-box; padding:0.2em 0.3em; text-indent:-1em; padding-left:1.3em; float:left;">
		<i><xsl:value-of select="." />: </i>
		<xsl:choose>
			<xsl:when test=".='Brutal 1'">
				<xsl:text>This weapon's minimum damage is higher than normal. When rolling damage, reroll any die that displays 1 until the result is higher.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Brutal 2'">
				<xsl:text>This weapon's minimum damage is higher than normal. When rolling damage, reroll any die that displays 1 or 2 until the result is higher.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Defensive'">
				<xsl:text>This weapon allows you to defend yourself. While you wield a defensive weapon that you have proficiency with in one hand and another melee weapon in your other hand, you gain a +1 bonus to AC. Wielding more than one defensive weapon does not increase this bonus, and you do not need to attack with the weapon to gain the bonus.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Free Hand'">
				<xsl:text>This weapon leaves the hand free. A free hand weapon does not need to be drawn, nor does it need to be sheathed for the wielder to use the hand that the weapon is on.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Heavy Thrown'">
				<xsl:text>This weapon this weapon can be hurled from the hand to be used as a ranged weapon. A ranged attack with a heavy thrown weapon uses your Strength modifier for the attack roll and damage roll, unless the attack used defines a different ability.</xsl:text>
			</xsl:when>
			<xsl:when test=".='High Crit'">
				<xsl:text>This weapon deals additional damage on a critical hit. When you score a critical hit with a high crit weapon, you deal an extra +1[W] damage. This increases to +2[W] at 11th level, and to +3[W] at 21st level. This is in addition to any critical damage the weapon might deal from being magical.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Light Thrown'">
				<xsl:text>This weapon this weapon can be hurled from the hand to be used as a ranged weapon. A ranged attack with a light thrown weapon uses your Dexterity modifier for the attack roll and damage roll, unless the attack used defines a different ability.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Limited'">
				<xsl:text>This weapon is limited in how it can be used. See the description for specifics.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Load Free'">
				<xsl:text>This weapon is a ranged weapon that looses projectiles, such as arrows, bolts or stones, and takes some time to load. A load free weapon can be loaded as either a free action or as part of the action used to attack with the weapon. A weapon with a load property requires two hands to load, even if you can use only one hand to attack with it.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Load Minor'">
				<xsl:text>This weapon is a ranged weapon that looses projectiles, such as arrows, bolts or stones, and takes some time to load. A load minor weapon can be loaded as a minor action, but if a power allows you to attack multiple targets, the additional load time for additional targets is accounted for in the power. A weapon with a load property requires two hands to load, even if you can use only one hand to attack with it.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Mounted'">
				<xsl:text>This weapon is most effective when used while riding a mount. When you use a mounted weapon while mounted, your charge attacks with it deal +1[W] additional damage. You take a -2 penalty to attack rolls with a mounted weapon while not mounted.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Off-Hand'">
				<xsl:text>This weapon is light enough that it can be held and attacked with effectively while also holding a weapon in the main hand. You can't attack with both weapons in the same turn unless a power allows you to do so, but you can attack with either weapon without penalty.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Reach'">
				<xsl:text disable-output-escaping="yes">This weapon can be used to attack targets further away. When using a reach weapon, you can attack enemies that are 2 squares away from you as well as adjacent enemies. You can still flank only enemies adjacent to you, and you can usually only make <![CDATA[<i>opportunity attacks</i>]]> against adjacent enemies.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Returning'">
				<xsl:text>This weapon returns to the wielder when thrown. After you have resolved a ranged attack with a returning weapon, it immediately returns to your hand.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Rogue'">
				<xsl:text>This weapon has special benefits for Rogues, usually related to the Scoundrel Weapon Talent. See the description for specifics.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Small'">
				<xsl:text>This weapon is smaller, or otherwise designed to be used by smaller characters. If you are Small size, you can use a small two-handed weapon just as a Medium character can. If you are a Small character and wield a small versatile weapon, you are not forced to wield it in two hands, and gain the bonus to damage when you do wield it with both hands.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Stout'">
				<xsl:text>This double weapon is extra sturdy. The stout end of a double weapon counts as a two-handed weapon for requirements and other abilities.</xsl:text>
			</xsl:when>
			<xsl:when test=".='Versatile'">
				<xsl:text>This weapon is one-handed, but can be wielded two-handed. When you wield a versatile weapon in two hands, you deal +1 additional damage for every two [W] of damage, rounded up. If you are a Small character, you must wield a versatile weapon in two hands, but do not gain this bonus to damage.</xsl:text>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>Not defined.</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</div>

</xsl:template>

</xsl:stylesheet>
