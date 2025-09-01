import xml.etree.ElementTree as ET

SMALL_RACES = {"Gnome", "Goblin", "Halfling", "Kobold", "Pixie", "Svirfneblin"}
POWER_STRIKE_CLASSES = {"Fighter", "Ranger"}

# Crude app for creating class feat lists from full feat list

fullTree = ET.parse('description.xml')
fullRoot = fullTree.getroot()

def create_feat_file(targetClass, targetRole, targetSource):
    data = []

    for feat in fullRoot.findall(".feat[prereq='" + targetClass + "']"):
        key = feat.findtext("title")
        data.append((key, feat))

    for feat in fullRoot.findall(".feat[prereq='" + targetRole + "']"):
        key = feat.findtext("title")
        data.append((key, feat))

    for feat in fullRoot.findall(".feat[prereq='" + targetSource + "']"):
        key = feat.findtext("title")
        data.append((key, feat))

    if targetClass in POWER_STRIKE_CLASSES:
        for feat in fullRoot.findall(".feat[prereq='power strike']"):
            key = feat.findtext("title")
            data.append((key, feat))

    if targetClass in SMALL_RACES:
        for feat in fullRoot.findall(".feat[prereq='Small or smaller']"):
            key = feat.findtext("title")
            data.append((key, feat))

    data.sort()

    return remove_duplicates(data)

def update_target_file(filename: str, targetName: str, roleName: str, sourceName: str, removeFeats=None):
    """
    Load an XML file, clear its existing feats, regenerate them, and save back.
    """
    tree = ET.parse(filename)
    root = tree.getroot()

    # Remove existing feats
    for feat in list(root.findall('./feat')):
        root.remove(feat)

    # Regenerate feats
    collate = create_feat_file(targetName, roleName, sourceName)

    # Append fresh feats 
    for item in collate:
        root.append(item[-1])

    # Optionally remove false feats by title
    if removeFeats:
        for title in removeFeats:
            bad = root.find(".feat[title='" + title + "']")
            if bad is not None:
                root.remove(bad)
                print(f"Removed false feat '{title}' from {filename}")

    # Optionally remove bad feats for monk
    if targetName == "Monk":
        for bad in root.findall(".feat/prereq[name='Psionic Augmentation']..."):
            root.remove(bad)

    # Save back to the same file
    tree.write(filename, encoding='utf-8', xml_declaration=True)
    print(f"Updated {filename} feats.")

def create_character_file(targetClass, targetRole, targetSource, targetRace, targetOrigin, targetType):
    data = []

    for feat in fullRoot.findall(".feat[prereq='" + targetClass + "']"):
        key = feat.findtext("title")
        data.append((key, feat))

    for feat in fullRoot.findall(".feat[prereq='" + targetRole + "']"):
        key = feat.findtext("title")
        data.append((key, feat))

    for feat in fullRoot.findall(".feat[prereq='" + targetSource + "']"):
        key = feat.findtext("title")
        data.append((key, feat))

    for feat in fullRoot.findall(".feat[prereq='" + targetRace + "']"):
        key = feat.findtext("title")
        data.append((key, feat))

    for feat in fullRoot.findall(".feat[prereq='" + targetOrigin + "']"):
        key = feat.findtext("title")
        data.append((key, feat))

    for feat in fullRoot.findall(".feat[prereq='" + targetType + "']"):
        key = feat.findtext("title")
        data.append((key, feat))

    if targetClass == 'Fighter' or targetClass == 'Ranger':
        for feat in fullRoot.findall(".feat[prereq='power strike']"):
            key = feat.findtext("title")
            data.append((key, feat))

    if targetRace == 'Gnome' or targetRace == 'Goblin' or targetRace == 'Halfling' or targetRace == 'Kobold' or targetRace == 'Pixie' or targetRace == 'Svirfneblin':
        for feat in fullRoot.findall(".feat[prereq='Small or smaller']"):
            key = feat.findtext("title")
            data.append((key, feat))

    data.sort()

    return remove_duplicates(data)

def remove_duplicates(lst):
    return list(dict.fromkeys(lst))

def create_tier_file(targetTier):
    data = []

    for feat in fullRoot.findall(".feat[tier='" + targetTier + "']"):
        key = feat.findtext("title")
        data.append((key, feat))

    return data


## Victoria feats ##
####################
victoriaTree = ET.parse('victoria.xml')
victoriaRoot = victoriaTree.getroot()

# Empty feats from file
for feat in victoriaTree.findall(".feat"):
    victoriaRoot.remove(feat)

collate = create_character_file("Warlord", "Leader", "any martial", "Human", "natural", "humanoid")

# Add feats to victoria file
for item in collate:
    victoriaRoot.append(item[-1])

for feat in victoriaRoot.findall(".feat[group='Class' ]"):
    if not(feat.findall(".//prereq") == 'Warlord' or feat.findtext("prereq") == 'Leader' or feat.findtext("prereq") == 'any martial'):
        victoriaRoot.remove(feat)

for feat in victoriaRoot.findall(".feat[group='Racial']"):
    if not(feat.findtext("prereq") == 'Human'):
        victoriaRoot.remove(feat)

# Save file
victoriaTree.write("victoria.xml")

## Heroic tier ##
#################
heroicTree = ET.parse('heroic.xml')
heroicRoot = heroicTree.getroot()

# Empty feats from file
for feat in heroicTree.findall(".feat"):
    heroicRoot.remove(feat)

collate = create_tier_file("Heroic")

# Add feats to file
for item in collate:
    heroicRoot.append(item[-1])

# Save file
heroicTree.write("heroic.xml")

# Remove class feats
for feat in heroicRoot.findall(".feat[group='Class']"):
    heroicRoot.remove(feat)

# Remove class combination feats
for feat in heroicRoot.findall(".feat[group='Class Combination']"):
    heroicRoot.remove(feat)

# Remove racial feats
for feat in heroicRoot.findall(".feat[group='Racial']"):
    heroicRoot.remove(feat)

# Save file
heroicTree.write("heroicgen.xml")

## Paragon tier ##
##################
paragonTree = ET.parse('paragon.xml')
paragonRoot = paragonTree.getroot()

# Empty feats from file
for feat in paragonTree.findall(".feat"):
    paragonRoot.remove(feat)

collate = create_tier_file("Paragon")

# Add feats to file
for item in collate:
    paragonRoot.append(item[-1])

# Save file
paragonTree.write("paragon.xml")

# Remove class feats
for feat in paragonRoot.findall(".feat[group='Class']"):
    paragonRoot.remove(feat)

# Remove class feats
for feat in paragonRoot.findall(".feat[group='Class Combination']"):
    paragonRoot.remove(feat)

# Remove racial feats
for feat in paragonRoot.findall(".feat[group='Racial']"):
    paragonRoot.remove(feat)

# Save file
paragonTree.write("paragongen.xml")

## Epic tier ##
###############
epicTree = ET.parse('epic.xml')
epicRoot = epicTree.getroot()

# Empty feats from file
for feat in epicTree.findall(".feat"):
    epicRoot.remove(feat)

collate = create_tier_file("Epic")

# Add feats to file
for item in collate:
    epicRoot.append(item[-1])

# Save file
epicTree.write("epic.xml")

# Remove class feats
for feat in epicRoot.findall(".feat[group='Class']"):
    epicRoot.remove(feat)

# Remove class combination feats
for feat in epicRoot.findall(".feat[group='Class Combination']"):
    epicRoot.remove(feat)

# Remove racial feats
for feat in epicRoot.findall(".feat[group='Racial']"):
    epicRoot.remove(feat)

# Save file
epicTree.write("epicgen.xml")

## Ardent ##
############
update_target_file("ardent.xml", "Ardent", "Leader", "any psionic", removeFeats=["Devout Protector Expertise"])

## Artificer ##
###############
update_target_file("artificer.xml", "Artificer", "Leader", "any arcane", removeFeats=["Devout Protector Expertise"])

## Assassin ##
##############
update_target_file("assassin.xml", "Assassin", "Striker", "any shadow")

## Avenger ##
#############
update_target_file("avenger.xml", "Avenger", "Striker", "any divine", removeFeats=["Devout Protector Expertise"])

## Barbarian ##
###############
update_target_file("barbarian.xml", "Barbarian", "Striker", "any primal")

## Bard ##
##########
update_target_file("bard.xml", "Bard", "Leader", "any arcane", removeFeats=["Devout Protector Expertise"])

## Battlemind
##############
update_target_file("battlemind.xml", "Battlemind", "Defender", "any psionic", removeFeats=["Devout Protector Expertise"])

## Cleric ##
############
update_target_file("cleric.xml", "Cleric", "Leader", "any divine")

## Druid ##
###########
update_target_file("druid.xml", "Druid", "Controller", "any primal", removeFeats=["Devout Protector Expertise"])

# Fighter ##
############
update_target_file("fighter.xml", "Fighter", "Defender", "any martial", removeFeats=["Devout Protector Expertise"])

# Monk ##
#########
update_target_file("monk.xml", "Monk", "Striker", "any psionic")

# Paladin ##
############
update_target_file("paladin.xml", "Paladin", "Defender", "any divine")

# Ranger
#############
update_target_file("ranger.xml", "Ranger", "Striker", "any martial")

# Swordmage
#############
update_target_file("swordmage.xml", "Swordmage", "Defender", "any arcane", removeFeats=["Devout Protector Expertise"])

# Vampire
##############
update_target_file("vampire.xml", "Vampire", "Striker", "any shadow")

# Warlock
##############
update_target_file("warlock.xml", "Warlock", "Striker", "any arcane")

# Warlord
##############
update_target_file("warlord.xml", "Warlord", "Leader", "any martial", removeFeats=["Devout Protector Expertise"])

# Wizard
##############
update_target_file("wizard.xml", "Wizard", "Controller", "any arcane")

# Deva
##############
update_target_file("deva.xml", "Deva", "immortal", "humanoid")

# Dragonborn
##############
update_target_file("dragonborn.xml", "Dragonborn", "natural", "humanoid")

# Dwarf
##############
update_target_file("dwarf.xml", "Dwarf", "natural", "humanoid")

# Human
##############
update_target_file("human.xml", "Human", "natural", "humanoid")

# Eladrin
##############
update_target_file("eladrin.xml", "Eladrin", "fey", "humanoid")

# Elf
##############
update_target_file("elf.xml", "Elf", "fey", "humanoid")

# Halfling
##############
update_target_file("halfling.xml", "Halfling", "natural", "humanoid")

# Tiefling
##############
update_target_file("tiefling.xml", "Tiefling", "natural", "humanoid")

# Warforged
##############
update_target_file("warforged.xml", "Warforged", "natural", "humanoid")
