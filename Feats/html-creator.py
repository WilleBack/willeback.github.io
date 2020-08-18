import lxml.html
from lxml import etree

xslt_doc = etree.parse("feat.xsl")
xslt_transformer = etree.XSLT(xslt_doc)

# Ardent
source_doc = etree.parse("ardent.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("ardent.html", pretty_print=True)

# Artificer
source_doc = etree.parse("artificer.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("artificer.html", pretty_print=True)

# Assassin
source_doc = etree.parse("assassin.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("assassin.html", pretty_print=True)

# Avenger
source_doc = etree.parse("avenger.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("avenger.html", pretty_print=True)

# Barbarian
source_doc = etree.parse("barbarian.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("barbarian.html", pretty_print=True)

# Fighter
source_doc = etree.parse("fighter.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("fighter.html", pretty_print=True)

# Monk
source_doc = etree.parse("monk.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("monk.html", pretty_print=True)

# Paladin
source_doc = etree.parse("paladin.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("paladin.html", pretty_print=True)

# Swordmage
source_doc = etree.parse("swordmage.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("swordmage.html", pretty_print=True)

# Warlock
source_doc = etree.parse("warlock.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("warlock.html", pretty_print=True)

# Warlord
source_doc = etree.parse("warlord.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("warlord.html", pretty_print=True)

# Wizard
source_doc = etree.parse("wizard.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("wizard.html", pretty_print=True)

