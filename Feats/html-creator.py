import lxml.html
from lxml import etree

xslt_doc = etree.parse("feat.xsl")
xslt_transformer = etree.XSLT(xslt_doc)

# Full file
source_doc = etree.parse("description.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("featlist.html", pretty_print=True)

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

# Bard
source_doc = etree.parse("bard.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("bard.html", pretty_print=True)

# Battlemind
source_doc = etree.parse("battlemind.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("battlemind.html", pretty_print=True)

# Cleric
source_doc = etree.parse("cleric.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("cleric.html", pretty_print=True)

# Dragonborn
source_doc = etree.parse("dragonborn.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("dragonborn.html", pretty_print=True)

# Druid
source_doc = etree.parse("druid.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("druid.html", pretty_print=True)

# Dwarf
source_doc = etree.parse("dwarf.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("dwarf.html", pretty_print=True)

# Eladrin
source_doc = etree.parse("eladrin.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("eladrin.html", pretty_print=True)

# Elf
source_doc = etree.parse("elf.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("elf.html", pretty_print=True)

# Halfling
source_doc = etree.parse("halfling.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("halfling.html", pretty_print=True)

# Fighter
source_doc = etree.parse("fighter.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("fighter.html", pretty_print=True)

# Human
source_doc = etree.parse("human.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("human.html", pretty_print=True)

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

# Tiefling
source_doc = etree.parse("tiefling.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("tiefling.html", pretty_print=True)

# Vampire
source_doc = etree.parse("vampire.xml")
output_doc = xslt_transformer(source_doc)

print(str(output_doc))
output_doc.write("vampire.html", pretty_print=True)

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

