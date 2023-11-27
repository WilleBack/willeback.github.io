import xml.etree.ElementTree as ET

# Crude app for creating class feat lists from full feat list

fullTree = ET.parse('description.xml')
fullRoot = fullTree.getroot()

def create_feat_file(targetClass, targetRole, targetSource):
    data = []

    for feat in fullRoot.findall(".feat/prereq[name='" + targetClass + "']..."):
        key = feat.findtext("title")
        data.append((key, feat))

    for feat in fullRoot.findall(".feat/prereq[name='" + targetRole + "']..."):
        key = feat.findtext("title")
        data.append((key, feat))

    for feat in fullRoot.findall(".feat/prereq[name='" + targetSource + "']..."):
        key = feat.findtext("title")
        data.append((key, feat))

    if targetClass == 'Fighter':
        for feat in fullRoot.findall(".feat/prereq[name='power strike']..."):
            key = feat.findtext("title")
            data.append((key, feat))

    if targetClass == 'Gnome' or targetClass == 'Goblin' or targetClass == 'Halfling' or targetClass == 'Kobold' or targetClass == 'Pixie' or targetClass == 'Svirfneblin':
        for feat in fullRoot.findall(".feat/prereq[name='Small or smaller']..."):
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
ardentTree = ET.parse('ardent.xml')
ardentRoot = ardentTree.getroot()

# Empty feats from Ardent file
for feat in ardentTree.findall(".feat"):
    ardentRoot.remove(feat)

collate = create_feat_file("Ardent", "Leader", "any psionic")

# Add feats to barbarian file
for item in collate:
    ardentRoot.append(item[-1])

# Remove known false feat
extra = ardentRoot.find(".feat[title='Devout Protector Expertise']")
ardentRoot.remove(extra)

# Save file
ardentTree.write("ardent.xml")

## Artificer ##
###############
artificerTree = ET.parse('artificer.xml')
artificerRoot = artificerTree.getroot()

# Empty feats from Artificer file
for feat in artificerTree.findall(".feat"):
    artificerRoot.remove(feat)

collate = create_feat_file("Artificer", "Leader", "any arcane")

# Add feats to barbarian file
for item in collate:
    artificerRoot.append(item[-1])

# Remove known false feat
extra = artificerRoot.find(".feat[title='Devout Protector Expertise']")
artificerRoot.remove(extra)

# Save file
artificerTree.write("artificer.xml")

## Assassin ##
##############
assassinTree = ET.parse('assassin.xml')
assassinRoot = assassinTree.getroot()

# Empty feats from Assassin file
for feat in assassinTree.findall(".feat"):
    assassinRoot.remove(feat)

collate = create_feat_file("Assassin", "Striker", "any shadow")

# Add feats to Assassin file
for item in collate:
    assassinRoot.append(item[-1])

# Remove known false feat
# extra = avengerRoot.find(".feat[title='Devout Protector Expertise']")
# avengerRoot.remove(extra)

# Save file
assassinTree.write("assassin.xml")

## Avenger ##
#############
avengerTree = ET.parse('avenger.xml')
avengerRoot = avengerTree.getroot()

# Empty feats from Avenger file
for feat in avengerTree.findall(".feat"):
    avengerRoot.remove(feat)

collate = create_feat_file("Avenger", "Striker", "any divine")

# Add feats to Avenger file
for item in collate:
    avengerRoot.append(item[-1])

# Remove known false feat
extra = avengerRoot.find(".feat[title='Devout Protector Expertise']")
avengerRoot.remove(extra)

# Save file
avengerTree.write("avenger.xml")

## Barbarian ##
###############
barbarianTree = ET.parse('barbarian.xml')
barbarianRoot = barbarianTree.getroot()

# Empty feats from Barbarian file
for feat in barbarianTree.findall(".feat"):
    barbarianRoot.remove(feat)

collate = create_feat_file("Barbarian", "Striker", "any primal")

# Add feats to barbarian file
for item in collate:
    barbarianRoot.append(item[-1])

# Remove known false feat
# extra = fighterRoot.find(".feat[title='Devout Protector Expertise']")
# fighterRoot.remove(extra)

# Save file
barbarianTree.write("barbarian.xml")

## Bard ##
##########
bardTree = ET.parse('bard.xml')
bardRoot = bardTree.getroot()

# Empty feats from Bard file
for feat in bardTree.findall(".feat"):
    bardRoot.remove(feat)

collate = create_feat_file("Bard", "Leader", "any arcane")

# Add feats to barbarian file
for item in collate:
    bardRoot.append(item[-1])

# Remove known false feat
extra = bardRoot.find(".feat[title='Devout Protector Expertise']")
bardRoot.remove(extra)

# Save file
bardTree.write("bard.xml")

## Battlemind
##############
bmindTree = ET.parse('battlemind.xml')
bmindRoot = bmindTree.getroot()

# Empty feats from Bard file
for feat in bmindTree.findall(".feat"):
    bmindRoot.remove(feat)

collate = create_feat_file("Battlemind", "Defender", "any psionic")

# Add feats to barbarian file
for item in collate:
    bmindRoot.append(item[-1])

# Remove known false feat
extra = bmindRoot.find(".feat[title='Devout Protector Expertise']")
bmindRoot.remove(extra)

# Save file
bmindTree.write("battlemind.xml")

## Cleric ##
############
clericTree = ET.parse('cleric.xml')
clericRoot = clericTree.getroot()

# Empty feats from Cleric file
for feat in clericTree.findall(".feat"):
    clericRoot.remove(feat)

collate = create_feat_file("Cleric", "Leader", "any divine")

# Add feats to cleric file
for item in collate:
    clericRoot.append(item[-1])

# Remove known false feat
# extra = artificerRoot.find(".feat[title='Devout Protector Expertise']")
# artificerRoot.remove(extra)

# Save file
clericTree.write("cleric.xml")

## Druid ##
###########
druidTree = ET.parse('druid.xml')
druidRoot = druidTree.getroot()

# Empty feats from Cleric file
for feat in druidTree.findall(".feat"):
    druidRoot.remove(feat)

collate = create_feat_file("Druid", "Controller", "any primal")

# Add feats to cleric file
for item in collate:
    druidRoot.append(item[-1])

# Remove known false feat
# extra = artificerRoot.find(".feat[title='Devout Protector Expertise']")
# artificerRoot.remove(extra)

# Save file
druidTree.write("druid.xml")

# Fighter ##
############
fighterTree = ET.parse('fighter.xml')
fighterRoot = fighterTree.getroot()

# Empty feats from Fighter file
for feat in fighterRoot.findall(".feat"):
    fighterRoot.remove(feat)

collate = create_feat_file("Fighter", "Defender", "any martial")

# Add feats to fighter file
for item in collate:
    fighterRoot.append(item[-1])

# Remove known false feat
extra = fighterRoot.find(".feat[title='Devout Protector Expertise']")
fighterRoot.remove(extra)

# Save file
fighterTree.write("fighter.xml")

# Monk ##
#########
monkTree = ET.parse('monk.xml')
monkRoot = monkTree.getroot()

# Empty feats from Monk file
for feat in monkRoot.findall(".feat"):
    monkRoot.remove(feat)

collate = create_feat_file("Monk", "Striker", "any psionic")

# Add feats to Monk file
for item in collate:
    monkRoot.append(item[-1])

# Remove known false feats
for feat in monkRoot.findall(".feat/prereq[name='Psionic Augmentation']..."):
    monkRoot.remove(feat)

# Save file
monkTree.write("monk.xml")

# Paladin ##
############
paladinTree = ET.parse('paladin.xml')
paladinRoot = paladinTree.getroot()

# Empty feats from Paladin file
for feat in paladinRoot.findall(".feat"):
    paladinRoot.remove(feat)

collate = create_feat_file("Paladin", "Defender", "any divine")

# Add feats to Paladin file
for item in collate:
    paladinRoot.append(item[-1])

# Remove known false feat
# extra = fighterRoot.find(".feat[title='Devout Protector Expertise']")
# fighterRoot.remove(extra)

# Save file
paladinTree.write("paladin.xml")

# Ranger
#############
rangerTree = ET.parse('ranger.xml')
rangerRoot = rangerTree.getroot()

# Empty feats from Swordmage file
for feat in rangerRoot.findall(".feat"):
    rangerRoot.remove(feat)

collate = create_feat_file("Ranger", "Striker", "any martial")

# Add feats to swordmage file
for item in collate:
    rangerRoot.append(item[-1])

# Remove known false feat
# extra = smageRoot.find(".feat[title='Devout Protector Expertise']")
# smageRoot.remove(extra)

# Save file
rangerTree.write("ranger.xml")

# Swordmage
#############
smageTree = ET.parse('swordmage.xml')
smageRoot = smageTree.getroot()

# Empty feats from Swordmage file
for feat in smageRoot.findall(".feat"):
    smageRoot.remove(feat)

collate = create_feat_file("Swordmage", "Defender", "any arcane")

# Add feats to swordmage file
for item in collate:
    smageRoot.append(item[-1])

# Remove known false feat
extra = smageRoot.find(".feat[title='Devout Protector Expertise']")
smageRoot.remove(extra)

# Save file
smageTree.write("swordmage.xml")

# Vampire
##############
vampireTree = ET.parse('vampire.xml')
vampireRoot = vampireTree.getroot()

# Empty feats from vampire file
for feat in vampireRoot.findall(".feat"):
    vampireRoot.remove(feat)

collate = create_feat_file("Vampire", "Striker", "any shadow")

# Add feats to warlock file
for item in collate:
    vampireRoot.append(item[-1])

# Remove known false feat
# extra = smageRoot.find(".feat[title='Devout Protector Expertise']")
# smageRoot.remove(extra)

# Save file
vampireTree.write("vampire.xml")

# Warlock
##############
warlockTree = ET.parse('warlock.xml')
warlockRoot = warlockTree.getroot()

# Empty feats from warlock file
for feat in warlockRoot.findall(".feat"):
    warlockRoot.remove(feat)

collate = create_feat_file("Warlock", "Striker", "any arcane")

# Add feats to warlock file
for item in collate:
    warlockRoot.append(item[-1])

# Remove known false feat
# extra = smageRoot.find(".feat[title='Devout Protector Expertise']")
# smageRoot.remove(extra)

# Save file
warlockTree.write("warlock.xml")

# Warlord
##############
warlordTree = ET.parse('warlord.xml')
warlordRoot = warlordTree.getroot()

# Empty feats from Warlord file
for feat in warlordRoot.findall(".feat"):
   warlordRoot.remove(feat)

collate = create_feat_file("Warlord", "Leader", "any martial")

# Add feats to warlord file
for item in collate:
    warlordRoot.append(item[-1])

# Remove known false feat
extra = warlordRoot.find(".feat[title='Devout Protector Expertise']")
warlordRoot.remove(extra)

# Save file
warlordTree.write("warlord.xml")

# Wizard
##############
wizardTree = ET.parse('wizard.xml')
wizardRoot = wizardTree.getroot()

# Empty feats from Wizard file
for feat in wizardRoot.findall(".feat"):
    wizardRoot.remove(feat)

collate = create_feat_file("Wizard", "Controller", "any arcane")

# Add feats to wizard file
for item in collate:
    wizardRoot.append(item[-1])

# Remove known false feat
# extra = wizardRoot.find(".feat[title='Devout Protector Expertise']")
# wizardRoot.remove(extra)

# Save file
wizardTree.write("wizard.xml")

# Dragonborn
##############
dragonbTree = ET.parse('dragonborn.xml')
dragonbRoot = dragonbTree.getroot()

# Empty feats from Wizard file
for feat in dragonbRoot.findall(".feat"):
    dragonbRoot.remove(feat)

collate = create_feat_file("Dragonborn", "natural", "humanoid")

# Add feats to wizard file
for item in collate:
    dragonbRoot.append(item[-1])

# Remove known false feat
# extra = wizardRoot.find(".feat[title='Devout Protector Expertise']")
# wizardRoot.remove(extra)

# Save file
dragonbTree.write("dragonborn.xml")

# Dwarf
##############
dwarfTree = ET.parse('dwarf.xml')
dwarfRoot = dwarfTree.getroot()

# Empty feats from Wizard file
for feat in dwarfRoot.findall(".feat"):
    dwarfRoot.remove(feat)

collate = create_feat_file("Dwarf", "natural", "humanoid")

# Add feats to wizard file
for item in collate:
    dwarfRoot.append(item[-1])

# Remove known false feat
# extra = wizardRoot.find(".feat[title='Devout Protector Expertise']")
# wizardRoot.remove(extra)

# Save file
dwarfTree.write("dwarf.xml")

# Human
##############
humanTree = ET.parse('human.xml')
humanRoot = humanTree.getroot()

# Empty feats from Wizard file
for feat in humanRoot.findall(".feat"):
    humanRoot.remove(feat)

collate = create_feat_file("Human", "natural", "humanoid")

# Add feats to wizard file
for item in collate:
    humanRoot.append(item[-1])

# Remove known false feat
# extra = wizardRoot.find(".feat[title='Devout Protector Expertise']")
# wizardRoot.remove(extra)

# Save file
humanTree.write("human.xml")

# Eladrin
##############
eladrinTree = ET.parse('eladrin.xml')
eladrinRoot = eladrinTree.getroot()

# Empty feats from Wizard file
for feat in eladrinRoot.findall(".feat"):
    eladrinRoot.remove(feat)

collate = create_feat_file("Eladrin", "fey", "humanoid")

# Add feats to wizard file
for item in collate:
    eladrinRoot.append(item[-1])

# Remove known false feat
# extra = wizardRoot.find(".feat[title='Devout Protector Expertise']")
# wizardRoot.remove(extra)

# Save file
eladrinTree.write("eladrin.xml")

# Elf
##############
elfTree = ET.parse('elf.xml')
elfRoot = elfTree.getroot()

# Empty feats from Wizard file
for feat in elfRoot.findall(".feat"):
    elfRoot.remove(feat)

collate = create_feat_file("Elf", "fey", "humanoid")

# Add feats to wizard file
for item in collate:
    elfRoot.append(item[-1])

# Remove known false feat
# extra = wizardRoot.find(".feat[title='Devout Protector Expertise']")
# wizardRoot.remove(extra)

# Save file
elfTree.write("elf.xml")

# Halfling
##############
halflingTree = ET.parse('halfling.xml')
halflingRoot = halflingTree.getroot()

# Empty feats from Wizard file
for feat in halflingRoot.findall(".feat"):
    halflingRoot.remove(feat)

collate = create_feat_file("Halfling", "natural", "humanoid")

# Add feats to wizard file
for item in collate:
    halflingRoot.append(item[-1])

# Remove known false feat
# extra = wizardRoot.find(".feat[title='Devout Protector Expertise']")
# wizardRoot.remove(extra)

# Save file
halflingTree.write("halfling.xml")

# Tiefling
##############
tieflingTree = ET.parse('tiefling.xml')
tieflingRoot = tieflingTree.getroot()

# Empty feats from Wizard file
for feat in tieflingRoot.findall(".feat"):
    tieflingRoot.remove(feat)

collate = create_feat_file("Tiefling", "natural", "humanoid")

# Add feats to wizard file
for item in collate:
    tieflingRoot.append(item[-1])

# Remove known false feat
# extra = wizardRoot.find(".feat[title='Devout Protector Expertise']")
# wizardRoot.remove(extra)

# Save file
tieflingTree.write("tiefling.xml")

# Warforged
##############
warforgedTree = ET.parse('warforged.xml')
warforgedRoot = warforgedTree.getroot()

# Empty feats from Wizard file
for feat in warforgedRoot.findall(".feat"):
    warforgedRoot.remove(feat)

collate = create_feat_file("Warforged", "natural", "humanoid")

# Add feats to wizard file
for item in collate:
    warforgedRoot.append(item[-1])

# Remove known false feat
# extra = wizardRoot.find(".feat[title='Devout Protector Expertise']")
# wizardRoot.remove(extra)

# Save file
warforgedTree.write("warforged.xml")
