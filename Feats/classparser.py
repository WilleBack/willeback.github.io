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

    data.sort()

    return data


# Barbarian
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

# Fighter
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
