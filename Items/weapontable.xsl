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
			}
			
			.feat {
				margin:0.2cm; 
				width:98%;
				float:left;
				page-break-inside:avoid;
			}
			
			.power {
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
	<body style="font-family:Verdana; font-size:8pt;margin:0cm; ">
	<div class="listcontainer">
    
        <xsl:for-each select="catalog/category">
		    <div class="groupholder">
			    <div class="grouptitle">Simple Weapons</div>
			    <xsl:for-each select="catalog/weapon[category='current/']> 
				<xsl:call-template name="list" />
			</xsl:for-each>
		</div>
		
		<div class="groupholder">
			<div class="grouptitle">Military Weapons</div>
			<xsl:for-each select="catalog/weapon[category='Military'> 
				<xsl:call-template name="list" />
			</xsl:for-each>
		</div>
        
        <div class="groupholder">
			<div class="grouptitle">Superior Weapons</div>
			<xsl:for-each select="catalog/weapon[category='Superior'> 
				<xsl:call-template name="list" />
			</xsl:for-each>
		</div>
		
	</div> <!-- list container -->
	
	</body>
	</html>
</xsl:template>

<xsl:template name="list">
	
	<xsl:if test="count(//catalog/weapon[category=current()/@selection and tier='Heroic'])>0">
		<div class="list">
			<div class="groupname"> <xsl:value-of select="@selection" /> <xsl:text> - Heroic</xsl:text></div>
			<xsl:for-each select="//catalog/feat[group=current()/@selection and tier='Heroic']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>
	
	<xsl:if test="count(//catalog/feat[group=current()/@selection and tier='Paragon'])>0">
		<div class="list">
			<div class="groupname"> <xsl:value-of select="@selection" /> <xsl:text> - Paragon</xsl:text></div>
			<xsl:for-each select="//catalog/feat[group=current()/@selection and tier='Paragon']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>
	
	<xsl:if test="count(//catalog/feat[group=current()/@selection and tier='Epic'])>0">
		<div class="list">
			<div class="groupname"> <xsl:value-of select="@selection" /> <xsl:text> - Epic</xsl:text></div>
			<xsl:for-each select="//catalog/feat[group=current()/@selection and tier='Epic']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>

</xsl:template>

<xsl:template name="listcategory">
	
	<xsl:if test="count(//catalog/feat[category=current()/@selection and tier='Heroic'])>0">
		<div class="list">
			<div class="groupname"> <xsl:value-of select="@selection" /> <xsl:text> - Heroic</xsl:text></div>
			<xsl:for-each select="//catalog/feat[category=current()/@selection and tier='Heroic']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>
	
	<xsl:if test="count(//catalog/feat[category=current()/@selection and tier='Paragon'])>0">
		<div class="list">
			<div class="groupname"> <xsl:value-of select="@selection" /> <xsl:text> - Paragon</xsl:text> </div>
			<xsl:for-each select="//catalog/feat[category=current()/@selection and tier='Paragon']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>
	
	<xsl:if test="count(//catalog/feat[category=current()/@selection and tier='Epic'])>0">
		<div class="list">
			<div class="groupname"> <xsl:value-of select="@selection" /> <xsl:text> - Epic</xsl:text> </div>
			<xsl:for-each select="//catalog/feat[category=current()/@selection and tier='Epic']">
				<xsl:call-template name="line" />
			</xsl:for-each>
		</div>
	</xsl:if>

</xsl:template>

<xsl:template name="listprereq">
	
	<xsl:if test="count(//catalog/feat[prereq/name=current()/@selection and tier='Heroic'])>0">
		<div class="list">
			<div class="groupname"> <xsl:value-of select="@selection" /> <xsl:if test="@selection='Defender' or @selection='Controller' or @selection='Striker' or @selection='Leader'"> <xsl:text> role</xsl:text> </xsl:if> <xsl:text> - Heroic</xsl:text></div>
			<xsl:choose>
				<xsl:when test="@selection='Goblin' or @selection='Gnome' or @selection='Halfling'">
					<xsl:for-each select="//catalog/feat[(prereq/name=current()/@selection or prereq/name='Small or smaller') and tier='Heroic']">
						<xsl:call-template name="line" />
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="//catalog/feat[prereq/name=current()/@selection and tier='Heroic']">
						<xsl:call-template name="line" />
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:if>
	
	<xsl:if test="count(//catalog/feat[prereq/name=current()/@selection and tier='Paragon'])>0">
		<div class="list">
			<div class="groupname"> <xsl:value-of select="@selection" /> <xsl:if test="@selection='Defender' or @selection='Controller' or @selection='Striker' or @selection='Leader'"> <xsl:text> role</xsl:text> </xsl:if> <xsl:text> - Paragon</xsl:text></div>
			<xsl:choose>
				<xsl:when test="@selection='Goblin' or @selection='Gnome' or @selection='Halfling'">
					<xsl:for-each select="//catalog/feat[(prereq/name=current()/@selection or prereq/name='Small or smaller') and tier='Paragon']">
						<xsl:call-template name="line" />
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="//catalog/feat[prereq/name=current()/@selection and tier='Paragon']">
						<xsl:call-template name="line" />
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:if>
	
	<xsl:if test="count(//catalog/feat[prereq/name=current()/@selection and tier='Epic'])>0">
		<div class="list">
			<div class="groupname"> <xsl:value-of select="@selection" /> <xsl:if test="@selection='Defender' or @selection='Controller' or @selection='Striker' or @selection='Leader'"> <xsl:text> role</xsl:text> </xsl:if> <xsl:text> - Epic</xsl:text></div>
			<xsl:choose>
				<xsl:when test="@selection='Goblin' or @selection='Gnome' or @selection='Halfling'">
					<xsl:for-each select="//catalog/feat[(prereq/name=current()/@selection or prereq/name='Small or smaller') and tier='Epic']">
						<xsl:call-template name="line" />
					</xsl:for-each>
				</xsl:when>
				<xsl:otherwise>
					<xsl:for-each select="//catalog/feat[prereq/name=current()/@selection and tier='Epic']">
						<xsl:call-template name="line" />
					</xsl:for-each>
				</xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:if>

</xsl:template>

<xsl:template name="line">
	<xsl:choose>
		<xsl:when test="position() mod 2 = 1">
			<div id="line" style="width:100%; float:left; background:linear-gradient(to right, LightGrey, LightGrey, Gainsboro);">
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