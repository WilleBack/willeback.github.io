<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="../Powers/power.xsl" />

	<xsl:param name="output-mode"/>
	<xsl:param name="filter-value"/>
	<xsl:param name="filter-tier"/>
	<xsl:param name="page-title"/>
	<xsl:param name="asset-prefix">../font/</xsl:param>
	<xsl:param name="index-href">featindex.html</xsl:param>
	<xsl:param name="feat-href-prefix"/>
	<xsl:param name="group-href-prefix">groups/</xsl:param>
	<xsl:param name="category-href-prefix">categories/</xsl:param>
	<xsl:param name="prereq-href-prefix">prereq/</xsl:param>
	<xsl:param name="enable-links">false</xsl:param>
	<xsl:param name="exclude-class-racial">false</xsl:param>
	<xsl:param name="index-tiers">all</xsl:param>
	<xsl:param name="show-back-link">false</xsl:param>

	<xsl:template match="/">
	  <xsl:apply-templates select="/catalog"/>
	</xsl:template>

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

			.pagesubtitle {
				width:100%;
				float:left;
				margin-bottom:0.4em;
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

			.groupname::first-letter {
				text-transform: uppercase;
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
				src: url('<xsl:value-of select="$asset-prefix"/>MentorSansStd.otf') format('opentype');
				font-weight: normal;
				font-style: normal;

			}

			@font-face {
				font-family: 'MentorSansStd';
				src: url('<xsl:value-of select="$asset-prefix"/>MentorSansStd-Bold.otf') format('opentype');
				font-weight: bold;
				font-style: normal;

			}

			@font-face {
				font-family: 'DnDLolth';
				src: url('<xsl:value-of select="$asset-prefix"/>DnDLolth.otf') format('opentype');
				font-weight: normal;
				font-style: normal;

			}

			@font-face {
				font-family: 'MentorSansStd-Light';
				src: url('<xsl:value-of select="$asset-prefix"/>MentorSansStd-Light.otf') format('opentype');
				font-weight: lighter;
				font-style: normal;

			}

			@font-face {
				font-family: 'MentorSansStd-Light';
				src: url('<xsl:value-of select="$asset-prefix"/>MentorSansStd-LightIta.otf') format('opentype');
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

			a.meta-link,
			a.meta-link:visited {
				color: inherit;
				text-decoration: none;
				font: inherit;
				font-weight: inherit;
				font-style: inherit;
			}
			a.meta-link:hover {
				text-decoration: underline;
			}


		</style>
	</head>
	<body style="font-family:MentorSansStd, Trebuchet, Verdana, Arial; font-size:9pt;margin:0cm; ">

		<xsl:choose>
			<xsl:when test="$output-mode='index'">
				<xsl:if test="$show-back-link='true'">
					<div style="width:calc(100% - 1em); float:left; padding:0.3em 0 0.6em 0.3em;">
						<a href="{$index-href}">Back to feat index</a>
					</div>
				</xsl:if>
				<xsl:if test="$page-title != ''">
					<div class="listcontainer">
						<xsl:call-template name="emit-page-title-block">
							<xsl:with-param name="title" select="$page-title"/>
							<xsl:with-param name="feats" select="//catalog/feat[not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))][not($index-tiers='Heroic' or $index-tiers='Paragon' or $index-tiers='Epic') or tier=$index-tiers]"/>
							<xsl:with-param name="show-breakdown" select="not($index-tiers='Heroic' or $index-tiers='Paragon' or $index-tiers='Epic')"/>
						</xsl:call-template>
					</div>
				</xsl:if>
				<xsl:call-template name="create-lists"/>
			</xsl:when>
			<xsl:when test="$output-mode='feat'">
				<xsl:call-template name="create-feat-page"/>
			</xsl:when>
			<xsl:when test="$output-mode='group' or $output-mode='group-tier' or $output-mode='category' or $output-mode='category-tier' or $output-mode='prereq' or $output-mode='prereq-tier'">
				<xsl:call-template name="create-filtered-list-page"/>
			</xsl:when>
			<xsl:when test="$output-mode='custom-list'">
				<xsl:call-template name="create-custom-list-page"/>
			</xsl:when>
			<xsl:when test="$output-mode='custom-list-by-group'">
				<xsl:call-template name="create-custom-list-by-group-page"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="create-lists"/>
				<xsl:call-template name="create-content"/>
			</xsl:otherwise>
		</xsl:choose>

	</body>
	</html>
</xsl:template>

<xsl:template name="format-feat-count-label">
	<xsl:param name="count"/>
	<xsl:value-of select="$count"/>
	<xsl:choose>
		<xsl:when test="$count = 1">
			<xsl:text> feat</xsl:text>
		</xsl:when>
		<xsl:otherwise>
			<xsl:text> feats</xsl:text>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="emit-tier-breakdown">
	<xsl:param name="heroic" select="0"/>
	<xsl:param name="paragon" select="0"/>
	<xsl:param name="epic" select="0"/>
	<xsl:if test="$heroic > 0">
		<xsl:value-of select="$heroic"/>
		<xsl:text> heroic</xsl:text>
		<xsl:if test="$paragon > 0 or $epic > 0">
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:if>
	<xsl:if test="$paragon > 0">
		<xsl:value-of select="$paragon"/>
		<xsl:text> paragon</xsl:text>
		<xsl:if test="$epic > 0">
			<xsl:text>, </xsl:text>
		</xsl:if>
	</xsl:if>
	<xsl:if test="$epic > 0">
		<xsl:value-of select="$epic"/>
		<xsl:text> epic</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template name="emit-feat-count-line">
	<xsl:param name="feats" select="//catalog/feat"/>
	<xsl:param name="show-breakdown">false</xsl:param>
	<xsl:variable name="total" select="count($feats)"/>
	<xsl:variable name="heroic" select="count($feats[tier='Heroic'])"/>
	<xsl:variable name="paragon" select="count($feats[tier='Paragon'])"/>
	<xsl:variable name="epic" select="count($feats[tier='Epic'])"/>
	<div class="pagesubtitle">
		<xsl:call-template name="format-feat-count-label">
			<xsl:with-param name="count" select="$total"/>
		</xsl:call-template>
		<xsl:if test="$show-breakdown='true'">
			<xsl:text> (</xsl:text>
			<xsl:call-template name="emit-tier-breakdown">
				<xsl:with-param name="heroic" select="$heroic"/>
				<xsl:with-param name="paragon" select="$paragon"/>
				<xsl:with-param name="epic" select="$epic"/>
			</xsl:call-template>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</div>
</xsl:template>

<xsl:template name="emit-page-title-block">
	<xsl:param name="title"/>
	<xsl:param name="feats" select="//catalog/feat"/>
	<xsl:param name="show-breakdown">false</xsl:param>
	<div class="groupholder">
		<div class="grouptitle"><xsl:value-of select="$title"/></div>
		<xsl:call-template name="emit-feat-count-line">
			<xsl:with-param name="feats" select="$feats"/>
			<xsl:with-param name="show-breakdown" select="$show-breakdown"/>
		</xsl:call-template>
	</div>
</xsl:template>

<xsl:template name="emit-sublist-count">
	<xsl:param name="count"/>
	<xsl:text> (</xsl:text>
	<xsl:value-of select="$count"/>
	<xsl:text>)</xsl:text>
</xsl:template>

<xsl:template name="emit-prereq-page-feat-count-line">
	<xsl:param name="selection"/>
	<xsl:param name="show-breakdown">false</xsl:param>
	<xsl:param name="tier"/>
	<xsl:choose>
		<xsl:when test="$selection='Drow' or $selection='Eladrin' or $selection='Elf' or $selection='Hamadryad' or $selection='Hengeyokai' or $selection='Satyr' or $selection='Wilden'">
			<xsl:variable name="heroic" select="count(//catalog/feat[(prereq=$selection or prereq='fey') and tier='Heroic'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
			<xsl:variable name="paragon" select="count(//catalog/feat[(prereq=$selection or prereq='fey') and tier='Paragon'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
			<xsl:variable name="epic" select="count(//catalog/feat[(prereq=$selection or prereq='fey') and tier='Epic'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
			<xsl:call-template name="emit-prereq-page-feat-count-output">
				<xsl:with-param name="heroic" select="$heroic"/>
				<xsl:with-param name="paragon" select="$paragon"/>
				<xsl:with-param name="epic" select="$epic"/>
				<xsl:with-param name="show-breakdown" select="$show-breakdown"/>
				<xsl:with-param name="tier" select="$tier"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:when test="$selection='Gnome' or $selection='Pixie' or $selection='Svirfneblin'">
			<xsl:variable name="heroic" select="count(//catalog/feat[(prereq=$selection or prereq='Small or smaller' or prereq='fey') and tier='Heroic'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
			<xsl:variable name="paragon" select="count(//catalog/feat[(prereq=$selection or prereq='Small or smaller' or prereq='fey') and tier='Paragon'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
			<xsl:variable name="epic" select="count(//catalog/feat[(prereq=$selection or prereq='Small or smaller' or prereq='fey') and tier='Epic'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
			<xsl:call-template name="emit-prereq-page-feat-count-output">
				<xsl:with-param name="heroic" select="$heroic"/>
				<xsl:with-param name="paragon" select="$paragon"/>
				<xsl:with-param name="epic" select="$epic"/>
				<xsl:with-param name="show-breakdown" select="$show-breakdown"/>
				<xsl:with-param name="tier" select="$tier"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:when test="$selection='Goblin' or $selection='Halfling' or $selection='Kobold'">
			<xsl:variable name="heroic" select="count(//catalog/feat[(prereq=$selection or prereq='Small or smaller') and tier='Heroic'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
			<xsl:variable name="paragon" select="count(//catalog/feat[(prereq=$selection or prereq='Small or smaller') and tier='Paragon'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
			<xsl:variable name="epic" select="count(//catalog/feat[(prereq=$selection or prereq='Small or smaller') and tier='Epic'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
			<xsl:call-template name="emit-prereq-page-feat-count-output">
				<xsl:with-param name="heroic" select="$heroic"/>
				<xsl:with-param name="paragon" select="$paragon"/>
				<xsl:with-param name="epic" select="$epic"/>
				<xsl:with-param name="show-breakdown" select="$show-breakdown"/>
				<xsl:with-param name="tier" select="$tier"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:when test="$selection='Shadar-kai'">
			<xsl:variable name="heroic" select="count(//catalog/feat[(prereq=$selection or prereq='shadow') and tier='Heroic'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
			<xsl:variable name="paragon" select="count(//catalog/feat[(prereq=$selection or prereq='shadow') and tier='Paragon'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
			<xsl:variable name="epic" select="count(//catalog/feat[(prereq=$selection or prereq='shadow') and tier='Epic'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
			<xsl:call-template name="emit-prereq-page-feat-count-output">
				<xsl:with-param name="heroic" select="$heroic"/>
				<xsl:with-param name="paragon" select="$paragon"/>
				<xsl:with-param name="epic" select="$epic"/>
				<xsl:with-param name="show-breakdown" select="$show-breakdown"/>
				<xsl:with-param name="tier" select="$tier"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:variable name="heroic" select="count(//catalog/feat[prereq=$selection and tier='Heroic'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
			<xsl:variable name="paragon" select="count(//catalog/feat[prereq=$selection and tier='Paragon'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
			<xsl:variable name="epic" select="count(//catalog/feat[prereq=$selection and tier='Epic'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
			<xsl:call-template name="emit-prereq-page-feat-count-output">
				<xsl:with-param name="heroic" select="$heroic"/>
				<xsl:with-param name="paragon" select="$paragon"/>
				<xsl:with-param name="epic" select="$epic"/>
				<xsl:with-param name="show-breakdown" select="$show-breakdown"/>
				<xsl:with-param name="tier" select="$tier"/>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="emit-prereq-page-feat-count-output">
	<xsl:param name="heroic" select="0"/>
	<xsl:param name="paragon" select="0"/>
	<xsl:param name="epic" select="0"/>
	<xsl:param name="show-breakdown">false</xsl:param>
	<xsl:param name="tier"/>
	<div class="pagesubtitle">
		<xsl:choose>
			<xsl:when test="$show-breakdown='true'">
				<xsl:call-template name="format-feat-count-label">
					<xsl:with-param name="count" select="$heroic + $paragon + $epic"/>
				</xsl:call-template>
				<xsl:text> (</xsl:text>
				<xsl:call-template name="emit-tier-breakdown">
					<xsl:with-param name="heroic" select="$heroic"/>
					<xsl:with-param name="paragon" select="$paragon"/>
					<xsl:with-param name="epic" select="$epic"/>
				</xsl:call-template>
				<xsl:text>)</xsl:text>
			</xsl:when>
			<xsl:when test="$tier='Heroic'">
				<xsl:call-template name="format-feat-count-label">
					<xsl:with-param name="count" select="$heroic"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$tier='Paragon'">
				<xsl:call-template name="format-feat-count-label">
					<xsl:with-param name="count" select="$paragon"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="format-feat-count-label">
					<xsl:with-param name="count" select="$epic"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
	</div>
</xsl:template>

<xsl:template name="count-prereq-feats">
	<xsl:param name="selection"/>
	<xsl:param name="tier"/>
	<xsl:choose>
		<xsl:when test="$selection='Drow' or $selection='Eladrin' or $selection='Elf' or $selection='Hamadryad' or $selection='Hengeyokai' or $selection='Satyr' or $selection='Wilden'">
			<xsl:value-of select="count(//catalog/feat[(prereq=$selection or prereq='fey') and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
		</xsl:when>
		<xsl:when test="$selection='Gnome' or $selection='Pixie' or $selection='Svirfneblin'">
			<xsl:value-of select="count(//catalog/feat[(prereq=$selection or prereq='Small or smaller' or prereq='fey') and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
		</xsl:when>
		<xsl:when test="$selection='Goblin' or $selection='Halfling' or $selection='Kobold'">
			<xsl:value-of select="count(//catalog/feat[(prereq=$selection or prereq='Small or smaller') and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
		</xsl:when>
		<xsl:when test="$selection='Shadar-kai'">
			<xsl:value-of select="count(//catalog/feat[(prereq=$selection or prereq='shadow') and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="count(//catalog/feat[prereq=$selection and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="create-lists">
	<div class="listcontainer">
		<xsl:call-template name="create-lists-sections"/>
	</div>
</xsl:template>

<xsl:template name="create-lists-sections">
	<div class="groupholder">
		<div class="grouptitle">Feat Groups</div>
		<xsl:for-each select="list">
			<xsl:call-template name="emit-listgroup-for-index-tiers"/>
		</xsl:for-each>
	</div>

	<xsl:if test="count(//catalog/feat[category][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])>0">
		<div class="groupholder">
			<div class="grouptitle">Special Feat Categories</div>
			<xsl:for-each select="category">
				<xsl:call-template name="emit-listcategory-for-index-tiers"/>
			</xsl:for-each>
		</div>
	</xsl:if>

	<xsl:if test="count(//catalog/feat[group='Class'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])>0">
		<div class="groupholder">
			<div class="grouptitle">Class Feats</div>

			<xsl:for-each select="class">
				<xsl:call-template name="emit-listprereq-for-index-tiers"/>
			</xsl:for-each>

	</div>
</xsl:if>

	<xsl:if test="count(//catalog/feat[group='Racial'][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])>0">
		<div class="groupholder">
		<div class="grouptitle">Racial Feats</div>

		<xsl:for-each select="race">
			<xsl:call-template name="emit-listprereq-for-index-tiers"/>
		</xsl:for-each>
	</div>
</xsl:if>
</xsl:template>

<xsl:template name="emit-listgroup-for-index-tiers">
	<xsl:choose>
		<xsl:when test="$index-tiers='Heroic' or $index-tiers='Paragon' or $index-tiers='Epic'">
			<xsl:call-template name="listgroup">
				<xsl:with-param name="tier" select="$index-tiers"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="listgroup">
				<xsl:with-param name="tier">Heroic</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="listgroup">
				<xsl:with-param name="tier">Paragon</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="listgroup">
				<xsl:with-param name="tier">Epic</xsl:with-param>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="emit-listcategory-for-index-tiers">
	<xsl:choose>
		<xsl:when test="$index-tiers='Heroic' or $index-tiers='Paragon' or $index-tiers='Epic'">
			<xsl:call-template name="listcategory">
				<xsl:with-param name="tier" select="$index-tiers"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="listcategory">
				<xsl:with-param name="tier">Heroic</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="listcategory">
				<xsl:with-param name="tier">Paragon</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="listcategory">
				<xsl:with-param name="tier">Epic</xsl:with-param>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="emit-listprereq-for-index-tiers">
	<xsl:choose>
		<xsl:when test="$index-tiers='Heroic' or $index-tiers='Paragon' or $index-tiers='Epic'">
			<xsl:call-template name="listprereq">
				<xsl:with-param name="tier" select="$index-tiers"/>
			</xsl:call-template>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="listprereq">
				<xsl:with-param name="tier">Heroic</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="listprereq">
				<xsl:with-param name="tier">Paragon</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="listprereq">
				<xsl:with-param name="tier">Epic</xsl:with-param>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="create-feat-page">
	<div style="width:calc(100% - 1em); float:left; padding:0.3em 0 0.6em 0.3em;">
		<a href="{$index-href}">Back to feat index</a>
	</div>
	<div class="container">
		<xsl:apply-templates select="feat[slug=$filter-value or title=$filter-value or @id=$filter-value]"/>
	</div>
</xsl:template>

<xsl:template name="create-filtered-list-page">
	<div style="width:calc(100% - 1em); float:left; padding:0.3em 0 0.6em 0.3em;">
		<a href="{$index-href}">Back to feat index</a>
	</div>
	<div class="listcontainer">
		<div class="groupholder">
			<div class="grouptitle"><xsl:value-of select="$page-title"/></div>
			<xsl:choose>
				<xsl:when test="$output-mode='group'">
					<xsl:call-template name="emit-feat-count-line">
						<xsl:with-param name="feats" select="//catalog/feat[group=$filter-value][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))]"/>
						<xsl:with-param name="show-breakdown">true</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$output-mode='group-tier'">
					<xsl:call-template name="emit-feat-count-line">
						<xsl:with-param name="feats" select="//catalog/feat[group=$filter-value and tier=$filter-tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))]"/>
						<xsl:with-param name="show-breakdown">false</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$output-mode='category'">
					<xsl:call-template name="emit-feat-count-line">
						<xsl:with-param name="feats" select="//catalog/feat[category=$filter-value][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))]"/>
						<xsl:with-param name="show-breakdown">true</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$output-mode='category-tier'">
					<xsl:call-template name="emit-feat-count-line">
						<xsl:with-param name="feats" select="//catalog/feat[category=$filter-value and tier=$filter-tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))]"/>
						<xsl:with-param name="show-breakdown">false</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$output-mode='prereq'">
					<xsl:call-template name="emit-prereq-page-feat-count-line">
						<xsl:with-param name="selection" select="$filter-value"/>
						<xsl:with-param name="show-breakdown">true</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$output-mode='prereq-tier'">
					<xsl:call-template name="emit-prereq-page-feat-count-line">
						<xsl:with-param name="selection" select="$filter-value"/>
						<xsl:with-param name="show-breakdown">false</xsl:with-param>
						<xsl:with-param name="tier" select="$filter-tier"/>
					</xsl:call-template>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$output-mode='group-tier'">
					<xsl:call-template name="listgroup">
						<xsl:with-param name="tier" select="$filter-tier"/>
						<xsl:with-param name="selection" select="$filter-value"/>
						<xsl:with-param name="show-groupname">false</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$output-mode='group'">
					<xsl:call-template name="listgroup">
						<xsl:with-param name="tier">Heroic</xsl:with-param>
						<xsl:with-param name="selection" select="$filter-value"/>
					</xsl:call-template>
					<xsl:call-template name="listgroup">
						<xsl:with-param name="tier">Paragon</xsl:with-param>
						<xsl:with-param name="selection" select="$filter-value"/>
					</xsl:call-template>
					<xsl:call-template name="listgroup">
						<xsl:with-param name="tier">Epic</xsl:with-param>
						<xsl:with-param name="selection" select="$filter-value"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$output-mode='category-tier'">
					<xsl:call-template name="listcategory">
						<xsl:with-param name="tier" select="$filter-tier"/>
						<xsl:with-param name="selection" select="$filter-value"/>
						<xsl:with-param name="show-groupname">false</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$output-mode='category'">
					<xsl:call-template name="listcategory">
						<xsl:with-param name="tier">Heroic</xsl:with-param>
						<xsl:with-param name="selection" select="$filter-value"/>
					</xsl:call-template>
					<xsl:call-template name="listcategory">
						<xsl:with-param name="tier">Paragon</xsl:with-param>
						<xsl:with-param name="selection" select="$filter-value"/>
					</xsl:call-template>
					<xsl:call-template name="listcategory">
						<xsl:with-param name="tier">Epic</xsl:with-param>
						<xsl:with-param name="selection" select="$filter-value"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$output-mode='prereq-tier'">
					<xsl:call-template name="listprereq">
						<xsl:with-param name="tier" select="$filter-tier"/>
						<xsl:with-param name="selection" select="$filter-value"/>
						<xsl:with-param name="show-groupname">false</xsl:with-param>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$output-mode='prereq'">
					<xsl:call-template name="listprereq">
						<xsl:with-param name="tier">Heroic</xsl:with-param>
						<xsl:with-param name="selection" select="$filter-value"/>
					</xsl:call-template>
					<xsl:call-template name="listprereq">
						<xsl:with-param name="tier">Paragon</xsl:with-param>
						<xsl:with-param name="selection" select="$filter-value"/>
					</xsl:call-template>
					<xsl:call-template name="listprereq">
						<xsl:with-param name="tier">Epic</xsl:with-param>
						<xsl:with-param name="selection" select="$filter-value"/>
					</xsl:call-template>
				</xsl:when>
			</xsl:choose>
		</div>
	</div>
</xsl:template>

<xsl:template name="create-custom-list-page">
	<div style="width:calc(100% - 1em); float:left; padding:0.3em 0 0.6em 0.3em;">
		<a href="{$index-href}">Back to feat index</a>
	</div>
	<div class="listcontainer">
		<div class="groupholder">
			<div class="grouptitle"><xsl:value-of select="$page-title"/></div>
			<xsl:call-template name="emit-feat-count-line">
				<xsl:with-param name="feats" select="//catalog/feat"/>
				<xsl:with-param name="show-breakdown">true</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="listtier">
				<xsl:with-param name="tier">Heroic</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="listtier">
				<xsl:with-param name="tier">Paragon</xsl:with-param>
			</xsl:call-template>
			<xsl:call-template name="listtier">
				<xsl:with-param name="tier">Epic</xsl:with-param>
			</xsl:call-template>
		</div>
	</div>
</xsl:template>

<xsl:template name="create-custom-list-by-group-page">
	<div style="width:calc(100% - 1em); float:left; padding:0.3em 0 0.6em 0.3em;">
		<a href="{$index-href}">Back to feat index</a>
	</div>
	<div class="listcontainer">
		<xsl:call-template name="emit-page-title-block">
			<xsl:with-param name="title" select="$page-title"/>
			<xsl:with-param name="feats" select="//catalog/feat"/>
			<xsl:with-param name="show-breakdown">true</xsl:with-param>
		</xsl:call-template>
		<xsl:call-template name="create-lists-sections"/>
	</div>
</xsl:template>

<xsl:template name="listtier">
	<xsl:param name="tier"/>

	<xsl:if test="count(feat[translate(tier,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')=translate($tier,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')])>0">
		<div class="list">
			<div class="groupname">
				<xsl:value-of select="$tier"/>
				<xsl:call-template name="emit-sublist-count">
					<xsl:with-param name="count" select="count(feat[translate(tier,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')=translate($tier,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')])"/>
				</xsl:call-template>
			</div>
			<xsl:for-each select="feat[translate(tier,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')=translate($tier,'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')]">
				<xsl:sort select="title"/>
				<xsl:call-template name="line"/>
			</xsl:for-each>
		</div>
	</xsl:if>
</xsl:template>

<xsl:template name="create-content">
	<div id="headstuff" style="width:calc(100% - 1em); float:left; padding-left:1pt;">
		<div class="grouptitle">Feat descriptions</div>
		<xsl:text>Total number of feats: </xsl:text> <xsl:value-of select="count(feat)" />
		<xsl:text> (</xsl:text><xsl:value-of select="count(feat[tier='Heroic'])" /> <xsl:text> heroic, </xsl:text> <xsl:value-of select="count(feat[tier='Paragon'])" /> <xsl:text> paragon, </xsl:text> <xsl:value-of select="count(feat[tier='Epic'])" /> <xsl:text> epic)</xsl:text>
	</div>

	<div class="container">

		<xsl:apply-templates select="feat" />

	</div>
</xsl:template>

<xsl:template match="feat">

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
			<xsl:otherwise>
				<xsl:call-template name="featheader" >
					<xsl:with-param name="featbg">Navy</xsl:with-param>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
		<div id="categroup" style="background:linear-gradient(to right,LightGrey, LightGrey,Gainsboro); width:100%; box-sizing:border-box; padding:0.3em; float:left;">
			<xsl:choose>
				<xsl:when test="category">
					<b>
						<div id="category" style="width:8.5em; float:left;">
							<xsl:for-each select="category">
								<xsl:call-template name="category-link">
									<xsl:with-param name="name" select="."/>
								</xsl:call-template>
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
							<xsl:call-template name="group-link">
								<xsl:with-param name="name" select="."/>
							</xsl:call-template>
							<xsl:if test="position()!=last()">
								<xsl:text>, </xsl:text>
							</xsl:if>
						</xsl:for-each>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div id="group" style="width:100%; float:left;">
						<xsl:for-each select="group">
							<xsl:call-template name="group-link">
								<xsl:with-param name="name" select="."/>
							</xsl:call-template>
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
         <xsl:for-each select="benefit">
            <xsl:choose>
               <xsl:when test="position()=1">
                  <div style="width=100%;">
                     <b>Benefit: </b>
                     <xsl:choose>
                        <xsl:when test="@skill">
                           <xsl:text>You gain training in the </xsl:text>
                           <xsl:value-of select="@skill" disable-output-escaping="yes"/>
                           <xsl:text> skill.</xsl:text>
                        </xsl:when>
                        <xsl:when test="@skill-class">
                           <xsl:text>You gain training in one skill from the </xsl:text>
                           <xsl:value-of select="@skill-class" disable-output-escaping="yes"/>
                           <xsl:text>'s class skill list.</xsl:text>
                        </xsl:when>
                        <xsl:when test="@skills">
                           <xsl:text>You gain training in the </xsl:text>
                           <xsl:value-of select="@skills" disable-output-escaping="yes"/>
                           <xsl:text> skills.</xsl:text>
                        </xsl:when>
                        <xsl:when test="@skills-either">
                           <xsl:text>You gain training in either the </xsl:text>
                           <xsl:value-of select="@skills-either" disable-output-escaping="yes"/>
                           <xsl:text> skill.</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:apply-templates />
                        </xsl:otherwise>
                     </xsl:choose>
                  </div>
               </xsl:when>
               <xsl:when test="@name or bullet or @bullet or @vestige">
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
                        <xsl:when test="@vestige">
                           <b><i>Eyes of the Vestige</i> Augment: </b>
                        </xsl:when>
                        <xsl:otherwise/>
                     </xsl:choose>
                     <xsl:apply-templates />
                  </div>
               </xsl:when>
               <xsl:otherwise>
                  <div style="width:100%; text-indent:0.7em;">
                     <xsl:choose>
                        <xsl:when test="@skill">
                           <xsl:value-of select="." disable-output-escaping="yes"/>
                           <xsl:text>, you gain training in the </xsl:text>
                           <xsl:value-of select="@skill" disable-output-escaping="yes"/>
                           <xsl:text> skill.</xsl:text>
                        </xsl:when>
                        <xsl:when test="@skill-class">
                           <xsl:value-of select="." disable-output-escaping="yes"/>
                           <xsl:text>, you gain training in one skill from the </xsl:text>
                           <xsl:value-of select="@skill" disable-output-escaping="yes"/>
                           <xsl:text>'s class skill list.</xsl:text>
                        </xsl:when>
                        <xsl:when test="@skills">
                           <xsl:value-of select="." disable-output-escaping="yes"/>
                           <xsl:text>, you gain training in the </xsl:text>
                           <xsl:value-of select="@skills" disable-output-escaping="yes"/>
                           <xsl:text> skills.</xsl:text>
                        </xsl:when>
                        <xsl:when test="@skills-either">
                           <xsl:value-of select="." disable-output-escaping="yes"/>
                           <xsl:text>, you gain training in either the </xsl:text>
                           <xsl:value-of select="benefit[1]/@skills-either" disable-output-escaping="yes"/>
                           <xsl:text> skill.</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                           <xsl:apply-templates />
                        </xsl:otherwise>
                     </xsl:choose>
                  </div>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>
			<xsl:for-each select="special">
            <xsl:choose>
               <xsl:when test="position()=1">
                  <div style="width=100%;">
                     <b>Special: </b>
                     <xsl:apply-templates />
                  </div>
               </xsl:when>
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
                     <xsl:apply-templates />
                  </div>
               </xsl:when>
               <xsl:otherwise>
                  <div style="width:100%; text-indent:0.7em;">
                     <xsl:apply-templates />
                  </div>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:for-each>
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

<xsl:template name="slugify">
	<xsl:param name="text"/>
	<xsl:value-of select="translate(normalize-space($text), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ _', 'abcdefghijklmnopqrstuvwxyz--')"/>
</xsl:template>

<xsl:template name="tier-slug">
	<xsl:param name="tier"/>
	<xsl:value-of select="translate($tier, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
</xsl:template>

<xsl:template name="prereq-display-label">
	<xsl:param name="selection"/>
	<xsl:value-of select="$selection"/>
	<xsl:if test="$selection='Defender' or $selection='Controller' or $selection='Striker' or $selection='Leader'">
		<xsl:text> role</xsl:text>
	</xsl:if>
	<xsl:if test="$selection='any arcane' or $selection='any divine' or $selection='any martial' or $selection='any primal' or $selection='any psionic' or $selection='any shadow'">
		<xsl:text> class</xsl:text>
	</xsl:if>
</xsl:template>

<xsl:template name="group-link">
	<xsl:param name="name"/>
	<xsl:choose>
		<xsl:when test="$enable-links='true'">
			<a class="meta-link">
				<xsl:attribute name="href">
					<xsl:value-of select="$group-href-prefix"/>
					<xsl:call-template name="slugify">
						<xsl:with-param name="text" select="$name"/>
					</xsl:call-template>
					<xsl:text>.html</xsl:text>
				</xsl:attribute>
				<xsl:value-of select="$name"/>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$name"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="category-link">
	<xsl:param name="name"/>
	<xsl:choose>
		<xsl:when test="$enable-links='true'">
			<a class="meta-link">
				<xsl:attribute name="href">
					<xsl:value-of select="$category-href-prefix"/>
					<xsl:call-template name="slugify">
						<xsl:with-param name="text" select="$name"/>
					</xsl:call-template>
					<xsl:text>.html</xsl:text>
				</xsl:attribute>
				<xsl:value-of select="$name"/>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$name"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="prereq-link">
	<xsl:param name="selection"/>
	<xsl:choose>
		<xsl:when test="$enable-links='true'">
			<a class="meta-link">
				<xsl:attribute name="href">
					<xsl:value-of select="$prereq-href-prefix"/>
					<xsl:call-template name="slugify">
						<xsl:with-param name="text" select="$selection"/>
					</xsl:call-template>
					<xsl:text>.html</xsl:text>
				</xsl:attribute>
				<xsl:call-template name="prereq-display-label">
					<xsl:with-param name="selection" select="$selection"/>
				</xsl:call-template>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<xsl:call-template name="prereq-display-label">
				<xsl:with-param name="selection" select="$selection"/>
			</xsl:call-template>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="group-tier-link">
	<xsl:param name="selection"/>
	<xsl:param name="tier"/>
	<xsl:choose>
		<xsl:when test="$enable-links='true'">
			<a class="meta-link">
				<xsl:attribute name="href">
					<xsl:value-of select="$group-href-prefix"/>
					<xsl:call-template name="slugify">
						<xsl:with-param name="text" select="$selection"/>
					</xsl:call-template>
					<xsl:text>-</xsl:text>
					<xsl:call-template name="tier-slug">
						<xsl:with-param name="tier" select="$tier"/>
					</xsl:call-template>
					<xsl:text>.html</xsl:text>
				</xsl:attribute>
				<xsl:value-of select="$tier"/>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$tier"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="category-tier-link">
	<xsl:param name="selection"/>
	<xsl:param name="tier"/>
	<xsl:choose>
		<xsl:when test="$enable-links='true'">
			<a class="meta-link">
				<xsl:attribute name="href">
					<xsl:value-of select="$category-href-prefix"/>
					<xsl:call-template name="slugify">
						<xsl:with-param name="text" select="$selection"/>
					</xsl:call-template>
					<xsl:text>-</xsl:text>
					<xsl:call-template name="tier-slug">
						<xsl:with-param name="tier" select="$tier"/>
					</xsl:call-template>
					<xsl:text>.html</xsl:text>
				</xsl:attribute>
				<xsl:value-of select="$tier"/>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$tier"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="prereq-tier-link">
	<xsl:param name="selection"/>
	<xsl:param name="tier"/>
	<xsl:choose>
		<xsl:when test="$enable-links='true'">
			<a class="meta-link">
				<xsl:attribute name="href">
					<xsl:value-of select="$prereq-href-prefix"/>
					<xsl:call-template name="slugify">
						<xsl:with-param name="text" select="$selection"/>
					</xsl:call-template>
					<xsl:text>-</xsl:text>
					<xsl:call-template name="tier-slug">
						<xsl:with-param name="tier" select="$tier"/>
					</xsl:call-template>
					<xsl:text>.html</xsl:text>
				</xsl:attribute>
				<xsl:value-of select="$tier"/>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$tier"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="feat-link">
	<xsl:param name="feat" select="."/>
	<xsl:choose>
		<xsl:when test="$enable-links='true' and ($feat/slug or $feat/title)">
			<a class="meta-link">
				<xsl:attribute name="href">
					<xsl:value-of select="$feat-href-prefix"/>
					<xsl:choose>
						<xsl:when test="$feat/slug">
							<xsl:value-of select="$feat/slug"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="slugify">
								<xsl:with-param name="text" select="$feat/title"/>
							</xsl:call-template>
						</xsl:otherwise>
					</xsl:choose>
					<xsl:text>.html</xsl:text>
				</xsl:attribute>
				<xsl:value-of select="$feat/title"/>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<xsl:value-of select="$feat/title"/>
		</xsl:otherwise>
	</xsl:choose>
</xsl:template>

<xsl:template name="emit-list-title">
	<xsl:param name="link-type"/>
	<xsl:param name="selection"/>
	<xsl:param name="tier"/>
	<div class="groupname">
		<xsl:choose>
			<xsl:when test="$link-type='group'">
				<xsl:call-template name="group-link">
					<xsl:with-param name="name" select="$selection"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$link-type='category'">
				<xsl:call-template name="category-link">
					<xsl:with-param name="name" select="$selection"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="prereq-link">
					<xsl:with-param name="selection" select="$selection"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:text> - </xsl:text>
		<xsl:choose>
			<xsl:when test="$link-type='group'">
				<xsl:call-template name="group-tier-link">
					<xsl:with-param name="selection" select="$selection"/>
					<xsl:with-param name="tier" select="$tier"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$link-type='category'">
				<xsl:call-template name="category-tier-link">
					<xsl:with-param name="selection" select="$selection"/>
					<xsl:with-param name="tier" select="$tier"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="prereq-tier-link">
					<xsl:with-param name="selection" select="$selection"/>
					<xsl:with-param name="tier" select="$tier"/>
				</xsl:call-template>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="$link-type='group'">
				<xsl:call-template name="emit-sublist-count">
					<xsl:with-param name="count" select="count(//catalog/feat[group=$selection and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:when test="$link-type='category'">
				<xsl:call-template name="emit-sublist-count">
					<xsl:with-param name="count" select="count(//catalog/feat[category=$selection and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])"/>
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text> (</xsl:text>
				<xsl:call-template name="count-prereq-feats">
					<xsl:with-param name="selection" select="$selection"/>
					<xsl:with-param name="tier" select="$tier"/>
				</xsl:call-template>
				<xsl:text>)</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
	</div>
</xsl:template>

<xsl:template name="listgroup">
	<xsl:param name="tier"/>
	<xsl:param name="selection" select="current()/@selection"/>
	<xsl:param name="show-groupname">true</xsl:param>

	<xsl:if test="count(//catalog/feat[group=$selection and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])>0">
		<div class="list">
			<xsl:if test="$show-groupname='true'">
				<xsl:call-template name="emit-list-title">
					<xsl:with-param name="link-type">group</xsl:with-param>
					<xsl:with-param name="selection" select="$selection"/>
					<xsl:with-param name="tier" select="$tier"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:for-each select="//catalog/feat[group=$selection and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))]">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>

</xsl:template>

<xsl:template name="listcategory">
   <xsl:param name="tier"/>
   <xsl:param name="selection" select="current()/@selection"/>
   <xsl:param name="show-groupname">true</xsl:param>

	<xsl:if test="count(//catalog/feat[category=$selection and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])>0">
		<div class="list">
			<xsl:if test="$show-groupname='true'">
				<xsl:call-template name="emit-list-title">
					<xsl:with-param name="link-type">category</xsl:with-param>
					<xsl:with-param name="selection" select="$selection"/>
					<xsl:with-param name="tier" select="$tier"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:for-each select="//catalog/feat[category=$selection and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))]">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>

</xsl:template>

<xsl:template name="listprereq">
   <xsl:param name="tier"/>
   <xsl:param name="selection" select="current()/@selection"/>
   <xsl:param name="show-groupname">true</xsl:param>

   <xsl:call-template name="prereq-feats">
      <xsl:with-param name="selection" select="$selection"/>
      <xsl:with-param name="tier" select="$tier"/>
      <xsl:with-param name="show-groupname" select="$show-groupname"/>
   </xsl:call-template>

</xsl:template>

<xsl:template name="prereq-feats">
   <xsl:param name="selection"/>
   <xsl:param name="tier"/>
   <xsl:param name="show-groupname">true</xsl:param>

   <xsl:choose>
		<xsl:when test="$selection='Drow' or $selection='Eladrin' or $selection='Elf' or $selection='Hamadryad' or $selection='Hengeyokai' or $selection='Satyr' or $selection='Wilden'">
         <xsl:if test="count(//catalog/feat[(prereq=$selection or prereq='fey') and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])>0">
            <div class="list">
               <xsl:if test="$show-groupname='true'">
                  <xsl:call-template name="emit-list-title">
                     <xsl:with-param name="link-type">prereq</xsl:with-param>
                     <xsl:with-param name="selection" select="$selection"/>
                     <xsl:with-param name="tier" select="$tier"/>
                  </xsl:call-template>
               </xsl:if>
               <xsl:for-each select="//catalog/feat[(prereq=$selection or prereq='fey') and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))]">
                  <xsl:call-template name="line" />
               </xsl:for-each>
            </div>
         </xsl:if>
		</xsl:when>
		<xsl:when test="$selection='Gnome' or $selection='Pixie' or $selection='Svirfneblin'">
         <xsl:if test="count(//catalog/feat[(prereq=$selection or prereq='Small or smaller' or prereq='fey') and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])>0">
            <div class="list">
               <xsl:if test="$show-groupname='true'">
                  <xsl:call-template name="emit-list-title">
                     <xsl:with-param name="link-type">prereq</xsl:with-param>
                     <xsl:with-param name="selection" select="$selection"/>
                     <xsl:with-param name="tier" select="$tier"/>
                  </xsl:call-template>
               </xsl:if>
               <xsl:for-each select="//catalog/feat[(prereq=$selection or prereq='Small or smaller' or prereq='fey') and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))]">
                  <xsl:call-template name="line" />
               </xsl:for-each>
            </div>
         </xsl:if>
		</xsl:when>
		<xsl:when test="$selection='Goblin' or $selection='Halfling' or $selection='Kobold'">
         <xsl:if test="count(//catalog/feat[(prereq=$selection or prereq='Small or smaller') and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])>0">
            <div class="list">
               <xsl:if test="$show-groupname='true'">
                  <xsl:call-template name="emit-list-title">
                     <xsl:with-param name="link-type">prereq</xsl:with-param>
                     <xsl:with-param name="selection" select="$selection"/>
                     <xsl:with-param name="tier" select="$tier"/>
                  </xsl:call-template>
               </xsl:if>
               <xsl:for-each select="//catalog/feat[(prereq=$selection or prereq='Small or smaller') and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))]">
                  <xsl:call-template name="line" />
               </xsl:for-each>
            </div>
         </xsl:if>
		</xsl:when>
      <xsl:when test="$selection='Shadar-kai'">
         <xsl:if test="count(//catalog/feat[(prereq=$selection or prereq='shadow') and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])>0">
            <div class="list">
               <xsl:if test="$show-groupname='true'">
                  <xsl:call-template name="emit-list-title">
                     <xsl:with-param name="link-type">prereq</xsl:with-param>
                     <xsl:with-param name="selection" select="$selection"/>
                     <xsl:with-param name="tier" select="$tier"/>
                  </xsl:call-template>
               </xsl:if>
               <xsl:for-each select="//catalog/feat[(prereq=$selection or prereq='shadow') and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))]">
                  <xsl:call-template name="line" />
               </xsl:for-each>
            </div>
         </xsl:if>
      </xsl:when>
		<xsl:otherwise>
         <xsl:if test="count(//catalog/feat[prereq=$selection and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))])>0">
            <div class="list">
               <xsl:if test="$show-groupname='true'">
                  <xsl:call-template name="emit-list-title">
                     <xsl:with-param name="link-type">prereq</xsl:with-param>
                     <xsl:with-param name="selection" select="$selection"/>
                     <xsl:with-param name="tier" select="$tier"/>
                  </xsl:call-template>
               </xsl:if>
               <xsl:for-each select="//catalog/feat[prereq=$selection and tier=$tier][not($exclude-class-racial='true') or (not(group='Class') and not(group='Racial'))]">
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
			<div id="line" style="width:100%; padding: 0.1.em; float:left; background:linear-gradient(to right, LightGrey, LightGrey, Gainsboro);">
				<xsl:call-template name="linecontent" />
			</div>
		</xsl:when>
		<xsl:otherwise>
			<div id="line" style="width:100%; float:left; background:linear-gradient(to right, WhiteSmoke, WhiteSmoke, Snow);">
				<xsl:call-template name="linecontent" />
			</div>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>

<xsl:template name="linecontent">

		<div class="title">
			<xsl:call-template name="feat-link">
				<xsl:with-param name="feat" select="."/>
			</xsl:call-template>
		</div>
		<div class="category">
			<i><xsl:for-each select="category">
				<xsl:call-template name="category-link">
					<xsl:with-param name="name" select="."/>
				</xsl:call-template>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
			&#160;</i>
		</div>
		<div class="groups">
			<xsl:for-each select="group">
				<xsl:call-template name="group-link">
					<xsl:with-param name="name" select="."/>
				</xsl:call-template>
				<xsl:if test="position()!=last()">
					<xsl:text>, </xsl:text>
				</xsl:if>
			</xsl:for-each>
		</div>

</xsl:template>

<xsl:template match="trigger">
   <i>Trigger: </i>
   <xsl:apply-templates />
   <xsl:text>; </xsl:text>
</xsl:template>

<xsl:template match="aug">
   <span class="augment" style="float:none; font-variant: small-caps; font-size: 1.1em; width:calc(100% - 0.5em); margin:0.2em;"><b><xsl:apply-templates/></b></span>
</xsl:template>

</xsl:stylesheet>
