import xml.etree.ElementTree as ET
from pathlib import Path

SMALL_RACES = {"Gnome", "Goblin", "Halfling", "Kobold", "Pixie", "Svirfneblin"}
POWER_STRIKE_CLASSES = {"Fighter", "Ranger"}
FEY_RACES = frozenset(
    {"Drow", "Eladrin", "Elf", "Hamadryad", "Hengeyokai", "Satyr", "Wilden"}
)
SMALL_FEY_RACES = frozenset({"Gnome", "Pixie", "Svirfneblin"})
PREREQ_SMALL_RACES = frozenset({"Goblin", "Halfling", "Kobold"})
CLASS_FEAT_GROUP = "Class"
RACIAL_FEAT_GROUP = "Racial"

FEATS_DIR = Path(__file__).resolve().parent
DESCRIPTION_PATH = FEATS_DIR / "description.xml"


def load_description_root(catalog_path=None):
    path = catalog_path or DESCRIPTION_PATH
    return ET.parse(path).getroot()


def remove_duplicates(lst):
    return list(dict.fromkeys(lst))


def collect_class_feats(
    root,
    target_class,
    target_role,
    target_source,
    remove_feats=None,
):
    """Union feats matching class/role/source prereqs, with class-specific extras."""
    data = []

    for feat in root.findall(".feat[prereq='" + target_class + "']"):
        data.append((feat.findtext("title"), feat))

    for feat in root.findall(".feat[prereq='" + target_role + "']"):
        data.append((feat.findtext("title"), feat))

    for feat in root.findall(".feat[prereq='" + target_source + "']"):
        data.append((feat.findtext("title"), feat))

    if target_class in POWER_STRIKE_CLASSES:
        for feat in root.findall(".feat[prereq='power strike']"):
            data.append((feat.findtext("title"), feat))

    if target_class in SMALL_RACES:
        for feat in root.findall(".feat[prereq='Small or smaller']"):
            data.append((feat.findtext("title"), feat))

    data.sort()
    data = remove_duplicates(data)

    if remove_feats:
        excluded = set(remove_feats)
        data = [(title, feat) for title, feat in data if title not in excluded]

    if target_class == "Monk":
        data = [
            (title, feat)
            for title, feat in data
            if not any(
                prereq.find("name") is not None
                and prereq.find("name").text == "Psionic Augmentation"
                for prereq in feat.findall("prereq")
            )
        ]

    return data


def create_feat_file(target_class, target_role, target_source, root=None):
    if root is None:
        root = load_description_root()
    return collect_class_feats(root, target_class, target_role, target_source)


def update_target_file(
    filename: str,
    target_name: str,
    role_name: str,
    source_name: str,
    remove_feats=None,
    root=None,
):
    """Load an XML file, clear its existing feats, regenerate them, and save back."""
    if root is None:
        root = load_description_root()

    tree = ET.parse(filename)
    file_root = tree.getroot()

    for feat in list(file_root.findall("./feat")):
        file_root.remove(feat)

    collate = collect_class_feats(
        root, target_name, role_name, source_name, remove_feats=remove_feats
    )

    for _title, feat in collate:
        file_root.append(feat)

    tree.write(filename, encoding="utf-8", xml_declaration=True)
    print(f"Updated {filename} feats.")


def feat_has_group(feat, group_name):
    return any(g.text == group_name for g in feat.findall("group") if g.text)


def feat_prereqs(feat):
    return {p.text for p in feat.findall("prereq") if p.text}


def feat_matches_prereq(feat, selection):
    prereqs = feat_prereqs(feat)
    if selection in FEY_RACES:
        return selection in prereqs or "fey" in prereqs
    if selection in SMALL_FEY_RACES:
        return (
            selection in prereqs
            or "Small or smaller" in prereqs
            or "fey" in prereqs
        )
    if selection in PREREQ_SMALL_RACES:
        return selection in prereqs or "Small or smaller" in prereqs
    if selection == "Shadar-kai":
        return selection in prereqs or "shadow" in prereqs
    return selection in prereqs


def filter_character_group_feats(data, class_prereqs, racial_prereqs):
    """Keep Class/Racial group feats only when they match the character config."""
    filtered = []
    for title, feat in data:
        if feat_has_group(feat, CLASS_FEAT_GROUP):
            if not any(feat_matches_prereq(feat, prereq) for prereq in class_prereqs):
                continue
        if feat_has_group(feat, RACIAL_FEAT_GROUP):
            if not any(feat_matches_prereq(feat, prereq) for prereq in racial_prereqs):
                continue
        filtered.append((title, feat))
    return filtered


def collect_character_feats(
    root,
    target_class,
    target_role,
    target_source,
    target_race,
    target_origin,
    target_type,
    remove_feats=None,
):
    """Union class and race feat sets, then filter Class/Racial group rows."""
    class_prereqs = (target_class, target_role, target_source)
    racial_prereqs = (target_race,)

    data = collect_class_feats(
        root,
        target_class,
        target_role,
        target_source,
        remove_feats=remove_feats,
    )
    data.extend(
        collect_class_feats(
            root,
            target_race,
            target_origin,
            target_type,
            remove_feats=remove_feats,
        )
    )
    data.sort()
    data = remove_duplicates(data)
    return filter_character_group_feats(data, class_prereqs, racial_prereqs)


def create_character_file(
    target_class,
    target_role,
    target_source,
    target_race,
    target_origin,
    target_type,
    root=None,
):
    if root is None:
        root = load_description_root()
    return collect_character_feats(
        root,
        target_class,
        target_role,
        target_source,
        target_race,
        target_origin,
        target_type,
    )


def create_tier_file(target_tier, root=None):
    if root is None:
        root = load_description_root()

    data = []
    for feat in root.findall(".feat[tier='" + target_tier + "']"):
        data.append((feat.findtext("title"), feat))
    return data


def main():
    full_root = load_description_root()

    victoria_tree = ET.parse("victoria.xml")
    victoria_root = victoria_tree.getroot()

    for feat in victoria_tree.findall(".feat"):
        victoria_root.remove(feat)

    collate = collect_character_feats(
        full_root,
        "Warlord",
        "Leader",
        "any martial",
        "Human",
        "natural",
        "humanoid",
    )

    for _title, feat in collate:
        victoria_root.append(feat)

    victoria_tree.write("victoria.xml")

    heroic_tree = ET.parse("heroic.xml")
    heroic_root = heroic_tree.getroot()

    for feat in heroic_tree.findall(".feat"):
        heroic_root.remove(feat)

    collate = create_tier_file("Heroic", root=full_root)

    for _title, feat in collate:
        heroic_root.append(feat)

    heroic_tree.write("heroic.xml")

    for feat in heroic_root.findall(".feat[group='Class']"):
        heroic_root.remove(feat)

    for feat in heroic_root.findall(".feat[group='Class Combination']"):
        heroic_root.remove(feat)

    for feat in heroic_root.findall(".feat[group='Racial']"):
        heroic_root.remove(feat)

    heroic_tree.write("heroicgen.xml")

    paragon_tree = ET.parse("paragon.xml")
    paragon_root = paragon_tree.getroot()

    for feat in paragon_tree.findall(".feat"):
        paragon_root.remove(feat)

    collate = create_tier_file("Paragon", root=full_root)

    for _title, feat in collate:
        paragon_root.append(feat)

    paragon_tree.write("paragon.xml")

    for feat in paragon_root.findall(".feat[group='Class']"):
        paragon_root.remove(feat)

    for feat in paragon_root.findall(".feat[group='Class Combination']"):
        paragon_root.remove(feat)

    for feat in paragon_root.findall(".feat[group='Racial']"):
        paragon_root.remove(feat)

    paragon_tree.write("paragongen.xml")

    epic_tree = ET.parse("epic.xml")
    epic_root = epic_tree.getroot()

    for feat in epic_tree.findall(".feat"):
        epic_root.remove(feat)

    collate = create_tier_file("Epic", root=full_root)

    for _title, feat in collate:
        epic_root.append(feat)

    epic_tree.write("epic.xml")

    for feat in epic_root.findall(".feat[group='Class']"):
        epic_root.remove(feat)

    for feat in epic_root.findall(".feat[group='Class Combination']"):
        epic_root.remove(feat)

    for feat in epic_root.findall(".feat[group='Racial']"):
        epic_root.remove(feat)

    epic_tree.write("epicgen.xml")

    update_target_file(
        "ardent.xml", "Ardent", "Leader", "any psionic",
        remove_feats=["Devout Protector Expertise"], root=full_root,
    )
    update_target_file(
        "artificer.xml", "Artificer", "Leader", "any arcane",
        remove_feats=["Devout Protector Expertise"], root=full_root,
    )
    update_target_file(
        "assassin.xml", "Assassin", "Striker", "any shadow", root=full_root,
    )
    update_target_file(
        "avenger.xml", "Avenger", "Striker", "any divine",
        remove_feats=["Devout Protector Expertise"], root=full_root,
    )
    update_target_file(
        "barbarian.xml", "Barbarian", "Striker", "any primal", root=full_root,
    )
    update_target_file(
        "bard.xml", "Bard", "Leader", "any arcane",
        remove_feats=["Devout Protector Expertise"], root=full_root,
    )
    update_target_file(
        "battlemind.xml", "Battlemind", "Defender", "any psionic",
        remove_feats=["Devout Protector Expertise"], root=full_root,
    )
    update_target_file("cleric.xml", "Cleric", "Leader", "any divine", root=full_root)
    update_target_file(
        "druid.xml", "Druid", "Controller", "any primal",
        remove_feats=["Devout Protector Expertise"], root=full_root,
    )
    update_target_file(
        "fighter.xml", "Fighter", "Defender", "any martial",
        remove_feats=["Devout Protector Expertise"], root=full_root,
    )
    update_target_file("monk.xml", "Monk", "Striker", "any psionic", root=full_root)
    update_target_file("paladin.xml", "Paladin", "Defender", "any divine", root=full_root)
    update_target_file("ranger.xml", "Ranger", "Striker", "any martial", root=full_root)
    update_target_file(
        "swordmage.xml", "Swordmage", "Defender", "any arcane",
        remove_feats=["Devout Protector Expertise"], root=full_root,
    )
    update_target_file("vampire.xml", "Vampire", "Striker", "any shadow", root=full_root)
    update_target_file("warlock.xml", "Warlock", "Striker", "any arcane", root=full_root)
    update_target_file(
        "warlord.xml", "Warlord", "Leader", "any martial",
        remove_feats=["Devout Protector Expertise"], root=full_root,
    )
    update_target_file("wizard.xml", "Wizard", "Controller", "any arcane", root=full_root)
    update_target_file("deva.xml", "Deva", "immortal", "humanoid", root=full_root)
    update_target_file("dragonborn.xml", "Dragonborn", "natural", "humanoid", root=full_root)
    update_target_file("dwarf.xml", "Dwarf", "natural", "humanoid", root=full_root)
    update_target_file("human.xml", "Human", "natural", "humanoid", root=full_root)
    update_target_file("eladrin.xml", "Eladrin", "fey", "humanoid", root=full_root)
    update_target_file("elf.xml", "Elf", "fey", "humanoid", root=full_root)
    update_target_file("halfling.xml", "Halfling", "natural", "humanoid", root=full_root)
    update_target_file("tiefling.xml", "Tiefling", "natural", "humanoid", root=full_root)
    update_target_file("warforged.xml", "Warforged", "natural", "humanoid", root=full_root)


if __name__ == "__main__":
    main()
