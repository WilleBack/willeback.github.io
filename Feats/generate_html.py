#!/usr/bin/env python3
"""Generate static HTML feat pages under Feats/html/."""

import argparse
import re
import shutil
import sys
from copy import deepcopy
from pathlib import Path

from lxml import etree

from classparser import (
    collect_character_feats,
    collect_class_feats,
    feat_has_group,
    feat_matches_prereq,
    load_description_root,
)

FEATS_DIR = Path(__file__).resolve().parent
HTML_DIR = FEATS_DIR / "html"
GROUPS_DIR = HTML_DIR / "groups"
CATEGORIES_DIR = HTML_DIR / "categories"
PREREQ_DIR = HTML_DIR / "prereq"
CLASSES_DIR = HTML_DIR / "classes"
CHARACTERS_DIR = HTML_DIR / "characters"
GENERAL_DIR = HTML_DIR / "general"
ROLE_SELECTIONS = frozenset({"Defender", "Controller", "Striker", "Leader"})
ANY_CLASS_SELECTIONS = frozenset(
    {
        "any arcane",
        "any divine",
        "any martial",
        "any primal",
        "any psionic",
        "any shadow",
    }
)
CATALOG_PATH = FEATS_DIR / "description.xml"
XSL_PATH = FEATS_DIR / "feat.xsl"
TIERS = ("Heroic", "Paragon", "Epic")

CLASS_CONFIGS = [
    {
        "slug": "ardent",
        "page_title": "Ardent feats",
        "target_class": "Ardent",
        "target_role": "Leader",
        "target_source": "any psionic",
        "remove_feats": ["Devout Protector Expertise"],
    },
    {
        "slug": "artificer",
        "page_title": "Artificer feats",
        "target_class": "Artificer",
        "target_role": "Leader",
        "target_source": "any arcane",
        "remove_feats": ["Devout Protector Expertise"],
    },
    {
        "slug": "assassin",
        "page_title": "Assassin feats",
        "target_class": "Assassin",
        "target_role": "Striker",
        "target_source": "any shadow",
    },
    {
        "slug": "avenger",
        "page_title": "Avenger feats",
        "target_class": "Avenger",
        "target_role": "Striker",
        "target_source": "any divine",
        "remove_feats": ["Devout Protector Expertise"],
    },
    {
        "slug": "barbarian",
        "page_title": "Barbarian feats",
        "target_class": "Barbarian",
        "target_role": "Striker",
        "target_source": "any primal",
    },
    {
        "slug": "bard",
        "page_title": "Bard feats",
        "target_class": "Bard",
        "target_role": "Leader",
        "target_source": "any arcane",
        "remove_feats": ["Devout Protector Expertise"],
    },
    {
        "slug": "battlemind",
        "page_title": "Battlemind feats",
        "target_class": "Battlemind",
        "target_role": "Defender",
        "target_source": "any psionic",
        "remove_feats": ["Devout Protector Expertise"],
    },
    {
        "slug": "cleric",
        "page_title": "Cleric feats",
        "target_class": "Cleric",
        "target_role": "Leader",
        "target_source": "any divine",
    },
    {
        "slug": "druid",
        "page_title": "Druid feats",
        "target_class": "Druid",
        "target_role": "Controller",
        "target_source": "any primal",
        "remove_feats": ["Devout Protector Expertise"],
    },
    {
        "slug": "fighter",
        "page_title": "Fighter feats",
        "target_class": "Fighter",
        "target_role": "Defender",
        "target_source": "any martial",
        "remove_feats": ["Devout Protector Expertise"],
    },
    {
        "slug": "monk",
        "page_title": "Monk feats",
        "target_class": "Monk",
        "target_role": "Striker",
        "target_source": "any psionic",
        "exclude_prereq": ["Psionic Augmentation"],
    },
    {
        "slug": "paladin",
        "page_title": "Paladin feats",
        "target_class": "Paladin",
        "target_role": "Defender",
        "target_source": "any divine",
    },
    {
        "slug": "ranger",
        "page_title": "Ranger feats",
        "target_class": "Ranger",
        "target_role": "Striker",
        "target_source": "any martial",
    },
    {
        "slug": "swordmage",
        "page_title": "Swordmage feats",
        "target_class": "Swordmage",
        "target_role": "Defender",
        "target_source": "any arcane",
        "remove_feats": ["Devout Protector Expertise"],
    },
    {
        "slug": "vampire",
        "page_title": "Vampire feats",
        "target_class": "Vampire",
        "target_role": "Striker",
        "target_source": "any shadow",
    },
    {
        "slug": "warlock",
        "page_title": "Warlock feats",
        "target_class": "Warlock",
        "target_role": "Striker",
        "target_source": "any arcane",
    },
    {
        "slug": "warlord",
        "page_title": "Warlord feats",
        "target_class": "Warlord",
        "target_role": "Leader",
        "target_source": "any martial",
        "remove_feats": ["Devout Protector Expertise"],
    },
    {
        "slug": "wizard",
        "page_title": "Wizard feats",
        "target_class": "Wizard",
        "target_role": "Controller",
        "target_source": "any arcane",
    },
    {
        "slug": "deva",
        "page_title": "Deva feats",
        "target_class": "Deva",
        "target_role": "immortal",
        "target_source": "humanoid",
    },
    {
        "slug": "dragonborn",
        "page_title": "Dragonborn feats",
        "target_class": "Dragonborn",
        "target_role": "natural",
        "target_source": "humanoid",
    },
    {
        "slug": "dwarf",
        "page_title": "Dwarf feats",
        "target_class": "Dwarf",
        "target_role": "natural",
        "target_source": "humanoid",
    },
    {
        "slug": "human",
        "page_title": "Human feats",
        "target_class": "Human",
        "target_role": "natural",
        "target_source": "humanoid",
    },
    {
        "slug": "eladrin",
        "page_title": "Eladrin feats",
        "target_class": "Eladrin",
        "target_role": "fey",
        "target_source": "humanoid",
    },
    {
        "slug": "elf",
        "page_title": "Elf feats",
        "target_class": "Elf",
        "target_role": "fey",
        "target_source": "humanoid",
    },
    {
        "slug": "halfling",
        "page_title": "Halfling feats",
        "target_class": "Halfling",
        "target_role": "natural",
        "target_source": "humanoid",
    },
    {
        "slug": "tiefling",
        "page_title": "Tiefling feats",
        "target_class": "Tiefling",
        "target_role": "natural",
        "target_source": "humanoid",
    },
    {
        "slug": "warforged",
        "page_title": "Warforged feats",
        "target_class": "Warforged",
        "target_role": "natural",
        "target_source": "humanoid",
    },
]

CHARACTER_CONFIGS = [
    {
        "slug": "victoria",
        "page_title": "Victoria feats",
        "target_class": "Warlord",
        "target_role": "Leader",
        "target_source": "any martial",
        "target_race": "Human",
        "target_origin": "natural",
        "target_type": "humanoid",
        "exclude_category": ["Familiar"],
        "exclude_prereq": ["Tactical Presence","Skirmishing Presence","Resourceful Presence"]
    },
    {
        "slug": "anthea",
        "page_title": "Anthea feats",
        "target_class": "Wizard",
        "target_role": "Controller",
        "target_source": "any arcane",
        "target_race": "Eladrin",
        "target_origin": "fey",
        "target_type": "humanoid",
    },
]


def slugify(name: str) -> str:
    slug = name.lower()
    slug = re.sub(r"[^\w\s-]", "", slug)
    slug = re.sub(r"[\s_]+", "-", slug.strip())
    return slug


def enrich_catalog(tree: etree._ElementTree) -> etree._ElementTree:
    enriched = deepcopy(tree)
    root = enriched.getroot()
    for feat in root.findall("feat"):
        title = feat.find("title")
        if title is not None and title.text:
            slug_elem = etree.SubElement(feat, "slug")
            slug_elem.text = slugify(title.text)
    return enriched


def transform(catalog_tree: etree._ElementTree, out_path: Path, **params: str) -> None:
    xslt_doc = etree.parse(str(XSL_PATH))
    xslt = etree.XSLT(xslt_doc)
    xslt_params = {
        key.replace("_", "-"): etree.XSLT.strparam(value)
        for key, value in params.items()
    }
    result = xslt(catalog_tree, **xslt_params)
    out_path.parent.mkdir(parents=True, exist_ok=True)
    result.write(str(out_path), pretty_print=True)


def html_depth_params() -> dict[str, str]:
    """XSL path params for pages written directly under html/."""
    return {
        "asset_prefix": "../../font/",
        "index_href": "featindex.html",
        "feat_href_prefix": "",
        "group_href_prefix": "groups/",
        "category_href_prefix": "categories/",
        "prereq_href_prefix": "prereq/",
        "enable_links": "true",
    }


def groups_depth_params() -> dict[str, str]:
    """XSL path params for pages written under html/groups/."""
    return {
        "asset_prefix": "../../../font/",
        "index_href": "../featindex.html",
        "feat_href_prefix": "../",
        "group_href_prefix": "",
        "category_href_prefix": "../categories/",
        "prereq_href_prefix": "../prereq/",
        "enable_links": "true",
    }


def categories_depth_params() -> dict[str, str]:
    """XSL path params for pages written under html/categories/."""
    return {
        "asset_prefix": "../../../font/",
        "index_href": "../featindex.html",
        "feat_href_prefix": "../",
        "group_href_prefix": "../groups/",
        "category_href_prefix": "",
        "prereq_href_prefix": "../prereq/",
        "enable_links": "true",
    }


def prereq_depth_params() -> dict[str, str]:
    """XSL path params for pages written under html/prereq/."""
    return {
        "asset_prefix": "../../../font/",
        "index_href": "../featindex.html",
        "feat_href_prefix": "../",
        "group_href_prefix": "../groups/",
        "category_href_prefix": "../categories/",
        "prereq_href_prefix": "",
        "enable_links": "true",
    }


def classes_depth_params() -> dict[str, str]:
    """XSL path params for pages written under html/classes/."""
    return {
        "asset_prefix": "../../../font/",
        "index_href": "../featindex.html",
        "feat_href_prefix": "../",
        "group_href_prefix": "../groups/",
        "category_href_prefix": "../categories/",
        "prereq_href_prefix": "../prereq/",
        "enable_links": "true",
    }


def characters_depth_params() -> dict[str, str]:
    """XSL path params for pages written under html/characters/."""
    return classes_depth_params()


def general_depth_params() -> dict[str, str]:
    """XSL path params for pages written under html/general/."""
    return classes_depth_params()


def is_general_feat(feat: etree._Element) -> bool:
    """Return False if the feat belongs to the Class or Racial group."""
    return not (feat_has_group(feat, "Class") or feat_has_group(feat, "Racial"))


def collect_general_feat_titles(catalog_tree: etree._ElementTree) -> set[str]:
    """Return titles of feats eligible for the general index (non-Class/Racial groups)."""
    return {
        title
        for feat in catalog_tree.getroot().findall("feat")
        if (title := feat.findtext("title")) and is_general_feat(feat)
    }


def build_general_catalog(catalog_tree: etree._ElementTree) -> etree._ElementTree:
    """Build a catalog copy containing only general feats plus index metadata."""
    full_root = catalog_tree.getroot()
    catalog = etree.Element("catalog")
    for child in full_root:
        if child.tag == "feat":
            if is_general_feat(child):
                catalog.append(deepcopy(child))
        else:
            catalog.append(deepcopy(child))
    return etree.ElementTree(catalog)


def build_filtered_catalog(
    catalog_tree: etree._ElementTree, titles: set[str]
) -> etree._ElementTree:
    """Build a minimal catalog containing only the requested feats (with slugs)."""
    catalog = etree.Element("catalog")
    for feat in catalog_tree.getroot().findall("feat"):
        title = feat.findtext("title")
        if title in titles:
            catalog.append(deepcopy(feat))
    return etree.ElementTree(catalog)


def catalog_race_selections(catalog_tree: etree._ElementTree) -> frozenset[str]:
    return frozenset(
        name
        for elem in catalog_tree.getroot().findall("race")
        if (name := elem.get("selection"))
    )


def build_filtered_catalog_by_group(
    catalog_tree: etree._ElementTree,
    titles: set[str],
    *,
    target_class: str,
    target_role: str,
    target_source: str,
    race_selections: frozenset[str],
    allowed_prereq_sections: frozenset[str] | None = None,
) -> etree._ElementTree:
    """Build a filtered catalog with index metadata for group-based list pages."""
    full_root = catalog_tree.getroot()
    filtered_feats = [
        feat
        for feat in full_root.findall("feat")
        if feat.findtext("title") in titles
    ]

    catalog = etree.Element("catalog")
    for feat in filtered_feats:
        catalog.append(deepcopy(feat))

    present_groups = {
        group.text
        for feat in filtered_feats
        for group in feat.findall("group")
        if group.text
    }
    for list_elem in full_root.findall("list"):
        name = list_elem.get("selection")
        if name in present_groups:
            catalog.append(deepcopy(list_elem))

    present_categories = {
        category.text
        for feat in filtered_feats
        for category in feat.findall("category")
        if category.text
    }
    for category_elem in full_root.findall("category"):
        name = category_elem.get("selection")
        if name in present_categories:
            catalog.append(deepcopy(category_elem))

    config_prereqs = {target_class, target_role, target_source}
    is_race_config = target_class in race_selections

    if allowed_prereq_sections is not None:
        for class_elem in full_root.findall("class"):
            name = class_elem.get("selection")
            if name in allowed_prereq_sections:
                catalog.append(deepcopy(class_elem))
        for race_elem in full_root.findall("race"):
            name = race_elem.get("selection")
            if name in allowed_prereq_sections:
                catalog.append(deepcopy(race_elem))
    elif is_race_config:
        for class_elem in full_root.findall("class"):
            name = class_elem.get("selection")
            if name and any(
                feat_matches_prereq(feat, name) for feat in filtered_feats
            ):
                catalog.append(deepcopy(class_elem))
        for race_elem in full_root.findall("race"):
            name = race_elem.get("selection")
            if name in config_prereqs:
                catalog.append(deepcopy(race_elem))
    else:
        for class_elem in full_root.findall("class"):
            name = class_elem.get("selection")
            if name in config_prereqs:
                catalog.append(deepcopy(class_elem))
        for race_elem in full_root.findall("race"):
            name = race_elem.get("selection")
            if name and any(
                feat_matches_prereq(feat, name) for feat in filtered_feats
            ):
                catalog.append(deepcopy(race_elem))

    return etree.ElementTree(catalog)


def feat_has_category(feat: etree._Element, category_name: str) -> bool:
    return any(c.text == category_name for c in feat.findall("category") if c.text)


def is_multiclass_feat_for_class(feat: etree._Element, class_name: str) -> bool:
    """Return True if feat is a Multiclass entry feat for class_name."""
    return feat_has_category(feat, "Multiclass") and feat_has_group(
        feat, f"Multiclass {class_name}"
    )


def config_exclude_sets(
    config: dict,
) -> tuple[frozenset[str], frozenset[str], frozenset[str]]:
    """Return (exclude_categories, exclude_groups, exclude_prereqs) from a class/character config."""
    return (
        frozenset(config.get("exclude_category") or ()),
        frozenset(config.get("exclude_group") or ()),
        frozenset(config.get("exclude_prereq") or ()),
    )


def feat_is_excluded(
    feat: etree._Element,
    *,
    exclude_categories: frozenset[str],
    exclude_groups: frozenset[str],
    exclude_prereqs: frozenset[str],
) -> bool:
    """Return True if feat matches any exclude_* rule in a class/character config."""
    if exclude_categories and any(
        feat_has_category(feat, name) for name in exclude_categories
    ):
        return True
    if exclude_groups and any(feat_has_group(feat, name) for name in exclude_groups):
        return True
    if exclude_prereqs and any(
        feat_matches_prereq(feat, name) for name in exclude_prereqs
    ):
        return True
    return False


def filter_excluded_feats(
    catalog_tree: etree._ElementTree,
    titles: set[str],
    *,
    exclude_categories: frozenset[str],
    exclude_groups: frozenset[str],
    exclude_prereqs: frozenset[str],
) -> set[str]:
    """Remove feats matching exclude_category, exclude_group, or exclude_prereq."""
    if not exclude_categories and not exclude_groups and not exclude_prereqs:
        return titles

    feats_by_title = {
        title: feat
        for feat in catalog_tree.getroot().findall("feat")
        if (title := feat.findtext("title"))
    }
    return {
        title
        for title in titles
        if title not in feats_by_title
        or not feat_is_excluded(
            feats_by_title[title],
            exclude_categories=exclude_categories,
            exclude_groups=exclude_groups,
            exclude_prereqs=exclude_prereqs,
        )
    }


CLASS_COMBINATION_GROUP = "Class Combination"


def is_excluded_class_combination_feat(
    feat: etree._Element,
    *,
    target_class: str,
    target_role: str,
    target_source: str,
) -> bool:
    """Return True if a Class Combination feat lacks class/role/source prereqs."""
    if not feat_has_group(feat, CLASS_COMBINATION_GROUP):
        return False
    config_prereqs = (target_class, target_role, target_source)
    return not any(feat_matches_prereq(feat, prereq) for prereq in config_prereqs)


def filter_class_combination_feats(
    catalog_tree: etree._ElementTree,
    titles: set[str],
    *,
    target_class: str,
    target_role: str,
    target_source: str,
) -> set[str]:
    """Remove Class Combination feats that don't match the class/role/source config."""
    feats_by_title = {
        title: feat
        for feat in catalog_tree.getroot().findall("feat")
        if (title := feat.findtext("title"))
    }
    return {
        title
        for title in titles
        if title not in feats_by_title
        or not is_excluded_class_combination_feat(
            feats_by_title[title],
            target_class=target_class,
            target_role=target_role,
            target_source=target_source,
        )
    }


def filter_multiclass_feats(
    catalog_tree: etree._ElementTree, titles: set[str], class_name: str
) -> set[str]:
    """Remove Multiclass entry feats for class_name from a title set."""
    feats_by_title = {
        title: feat
        for feat in catalog_tree.getroot().findall("feat")
        if (title := feat.findtext("title"))
    }
    return {
        title
        for title in titles
        if title not in feats_by_title
        or not is_multiclass_feat_for_class(feats_by_title[title], class_name)
    }


def prereq_display_label(name: str) -> str:
    if name in ROLE_SELECTIONS:
        return f"{name} role"
    if name in ANY_CLASS_SELECTIONS:
        return f"{name} class"
    return name


def discover_nonempty_groups(catalog_tree: etree._ElementTree) -> list[tuple[str, list[str]]]:
    root = catalog_tree.getroot()
    groups: list[tuple[str, list[str]]] = []
    for list_elem in root.findall("list"):
        name = list_elem.get("selection")
        if not name:
            continue
        tiers = [
            tier
            for tier in TIERS
            if any(
                feat.find("tier") is not None
                and feat.find("tier").text == tier
                and feat_has_group(feat, name)
                for feat in root.findall("feat")
            )
        ]
        if tiers:
            groups.append((name, tiers))
    return groups


def discover_nonempty_categories(
    catalog_tree: etree._ElementTree,
) -> list[tuple[str, list[str]]]:
    root = catalog_tree.getroot()
    categories: list[tuple[str, list[str]]] = []
    for category_elem in root.findall("category"):
        name = category_elem.get("selection")
        if not name:
            continue
        tiers = [
            tier
            for tier in TIERS
            if any(
                feat.find("tier") is not None
                and feat.find("tier").text == tier
                and feat_has_category(feat, name)
                for feat in root.findall("feat")
            )
        ]
        if tiers:
            categories.append((name, tiers))
    return categories


def discover_nonempty_prereqs(
    catalog_tree: etree._ElementTree,
) -> list[tuple[str, list[str]]]:
    root = catalog_tree.getroot()
    prereqs: list[tuple[str, list[str]]] = []
    for elem in root.findall("class") + root.findall("race"):
        name = elem.get("selection")
        if not name:
            continue
        tiers = [
            tier
            for tier in TIERS
            if any(
                feat.find("tier") is not None
                and feat.find("tier").text == tier
                and feat_matches_prereq(feat, name)
                for feat in root.findall("feat")
            )
        ]
        if tiers:
            prereqs.append((name, tiers))
    return prereqs


def clean_html_dir() -> None:
    if HTML_DIR.exists():
        shutil.rmtree(HTML_DIR)
        print(f"Removed {HTML_DIR}")


def generate_index(catalog_tree: etree._ElementTree) -> None:
    transform(
        catalog_tree,
        HTML_DIR / "featindex.html",
        output_mode="index",
        page_title="Feat index",
        **html_depth_params(),
    )
    print(f"Wrote {HTML_DIR / 'featindex.html'}")


def generate_general_indexes(catalog_tree: etree._ElementTree) -> None:
    common = {
        "output_mode": "index",
        "exclude_class_racial": "true",
        "show_back_link": "true",
        **general_depth_params(),
    }
    transform(
        catalog_tree,
        GENERAL_DIR / "general.html",
        index_tiers="all",
        page_title="General feats",
        **common,
    )
    for tier in TIERS:
        transform(
            catalog_tree,
            GENERAL_DIR / f"{tier.lower()}.html",
            index_tiers=tier,
            page_title=f"General feats - {tier}",
            **common,
        )
    print(f"Wrote 4 general index pages to {GENERAL_DIR}")


def generate_feats(catalog_tree: etree._ElementTree) -> None:
    root = catalog_tree.getroot()
    count = 0
    for feat in root.findall("feat"):
        slug_elem = feat.find("slug")
        title_elem = feat.find("title")
        if slug_elem is not None and slug_elem.text:
            slug = slug_elem.text
        elif title_elem is not None and title_elem.text:
            slug = slugify(title_elem.text)
        else:
            continue
        transform(
            catalog_tree,
            HTML_DIR / f"{slug}.html",
            output_mode="feat",
            filter_value=slug,
            **html_depth_params(),
        )
        count += 1
    print(f"Wrote {count} feat pages to {HTML_DIR}")


def generate_groups(catalog_tree: etree._ElementTree) -> None:
    groups = discover_nonempty_groups(catalog_tree)
    full_count = 0
    tier_count = 0
    for name, tiers in groups:
        slug = slugify(name)
        transform(
            catalog_tree,
            GROUPS_DIR / f"{slug}.html",
            output_mode="group",
            filter_value=name,
            page_title=f"All {name} feats",
            **groups_depth_params(),
        )
        full_count += 1
        for tier in tiers:
            transform(
                catalog_tree,
                GROUPS_DIR / f"{slug}-{tier.lower()}.html",
                output_mode="group-tier",
                filter_value=name,
                filter_tier=tier,
                page_title=f"{name} - {tier}",
                **groups_depth_params(),
            )
            tier_count += 1
    print(
        f"Wrote {full_count} full + {tier_count} tier = "
        f"{full_count + tier_count} group pages to {GROUPS_DIR}"
    )


def generate_categories(catalog_tree: etree._ElementTree) -> None:
    categories = discover_nonempty_categories(catalog_tree)
    full_count = 0
    tier_count = 0
    for name, tiers in categories:
        slug = slugify(name)
        transform(
            catalog_tree,
            CATEGORIES_DIR / f"{slug}.html",
            output_mode="category",
            filter_value=name,
            page_title=f"All {name} feats",
            **categories_depth_params(),
        )
        full_count += 1
        for tier in tiers:
            transform(
                catalog_tree,
                CATEGORIES_DIR / f"{slug}-{tier.lower()}.html",
                output_mode="category-tier",
                filter_value=name,
                filter_tier=tier,
                page_title=f"{name} - {tier}",
                **categories_depth_params(),
            )
            tier_count += 1
    print(
        f"Wrote {full_count} full + {tier_count} tier = "
        f"{full_count + tier_count} category pages to {CATEGORIES_DIR}"
    )


def generate_prereqs(catalog_tree: etree._ElementTree) -> None:
    prereqs = discover_nonempty_prereqs(catalog_tree)
    full_count = 0
    tier_count = 0
    for name, tiers in prereqs:
        slug = slugify(name)
        label = prereq_display_label(name)
        transform(
            catalog_tree,
            PREREQ_DIR / f"{slug}.html",
            output_mode="prereq",
            filter_value=name,
            page_title=f"All {label} feats",
            **prereq_depth_params(),
        )
        full_count += 1
        for tier in tiers:
            transform(
                catalog_tree,
                PREREQ_DIR / f"{slug}-{tier.lower()}.html",
                output_mode="prereq-tier",
                filter_value=name,
                filter_tier=tier,
                page_title=f"{label} - {tier}",
                **prereq_depth_params(),
            )
            tier_count += 1
    print(
        f"Wrote {full_count} full + {tier_count} tier = "
        f"{full_count + tier_count} prereq pages to {PREREQ_DIR}"
    )


def generate_classes(catalog_tree: etree._ElementTree) -> None:
    source_root = load_description_root(CATALOG_PATH)
    race_selections = catalog_race_selections(catalog_tree)
    count = 0
    for config in CLASS_CONFIGS:
        collate = collect_class_feats(
            source_root,
            config["target_class"],
            config["target_role"],
            config["target_source"],
            remove_feats=config.get("remove_feats"),
        )
        if not collate:
            continue
        titles = filter_multiclass_feats(
            catalog_tree,
            {title for title, _feat in collate},
            config["target_class"],
        )
        titles = filter_class_combination_feats(
            catalog_tree,
            titles,
            target_class=config["target_class"],
            target_role=config["target_role"],
            target_source=config["target_source"],
        )
        exclude_categories, exclude_groups, exclude_prereqs = config_exclude_sets(config)
        titles = filter_excluded_feats(
            catalog_tree,
            titles,
            exclude_categories=exclude_categories,
            exclude_groups=exclude_groups,
            exclude_prereqs=exclude_prereqs,
        )
        slug = config["slug"]
        legacy_path = CLASSES_DIR / f"{slug}.html"
        if legacy_path.exists():
            legacy_path.unlink()

        filtered = build_filtered_catalog(catalog_tree, titles)
        transform(
            filtered,
            CLASSES_DIR / f"{slug}-by-tier.html",
            output_mode="custom-list",
            page_title=config["page_title"],
            **classes_depth_params(),
        )

        filtered_by_group = build_filtered_catalog_by_group(
            catalog_tree,
            titles,
            target_class=config["target_class"],
            target_role=config["target_role"],
            target_source=config["target_source"],
            race_selections=race_selections,
        )
        transform(
            filtered_by_group,
            CLASSES_DIR / f"{slug}-by-group.html",
            output_mode="custom-list-by-group",
            page_title=config["page_title"],
            **classes_depth_params(),
        )
        count += 1
    print(f"Wrote {count * 2} class/race pages to {CLASSES_DIR}")


def generate_characters(catalog_tree: etree._ElementTree) -> None:
    source_root = load_description_root(CATALOG_PATH)
    race_selections = catalog_race_selections(catalog_tree)
    general_titles = collect_general_feat_titles(catalog_tree)
    count = 0
    for config in CHARACTER_CONFIGS:
        collate = collect_character_feats(
            source_root,
            config["target_class"],
            config["target_role"],
            config["target_source"],
            config["target_race"],
            config["target_origin"],
            config["target_type"],
            remove_feats=config.get("remove_feats"),
        )
        if not collate:
            continue
        titles = filter_multiclass_feats(
            catalog_tree,
            {title for title, _feat in collate},
            config["target_class"],
        )
        exclude_categories, exclude_groups, exclude_prereqs = config_exclude_sets(config)
        slug = config["slug"]
        legacy_path = CHARACTERS_DIR / f"{slug}.html"
        if legacy_path.exists():
            legacy_path.unlink()

        prereq_sections = frozenset(
            {
                config["target_class"],
                config["target_role"],
                config["target_source"],
                config["target_race"],
            }
        )
        group_params = {
            "target_class": config["target_class"],
            "target_role": config["target_role"],
            "target_source": config["target_source"],
            "race_selections": race_selections,
            "allowed_prereq_sections": prereq_sections,
        }
        depth_params = characters_depth_params()

        for name_suffix, page_title in (
            ("by-tier", config["page_title"]),
            ("by-group", config["page_title"]),
            ("full-by-tier", f"{config['page_title']} (full)"),
            ("full-by-group", f"{config['page_title']} (full)"),
        ):
            feat_titles = (
                filter_multiclass_feats(
                    catalog_tree, titles | general_titles, config["target_class"]
                )
                if name_suffix.startswith("full-")
                else titles
            )
            feat_titles = filter_class_combination_feats(
                catalog_tree,
                feat_titles,
                target_class=config["target_class"],
                target_role=config["target_role"],
                target_source=config["target_source"],
            )
            feat_titles = filter_excluded_feats(
                catalog_tree,
                feat_titles,
                exclude_categories=exclude_categories,
                exclude_groups=exclude_groups,
                exclude_prereqs=exclude_prereqs,
            )
            if name_suffix.endswith("by-tier"):
                filtered = build_filtered_catalog(catalog_tree, feat_titles)
                transform(
                    filtered,
                    CHARACTERS_DIR / f"{slug}-{name_suffix}.html",
                    output_mode="custom-list",
                    page_title=page_title,
                    **depth_params,
                )
            else:
                filtered_by_group = build_filtered_catalog_by_group(
                    catalog_tree,
                    feat_titles,
                    **group_params,
                )
                transform(
                    filtered_by_group,
                    CHARACTERS_DIR / f"{slug}-{name_suffix}.html",
                    output_mode="custom-list-by-group",
                    page_title=page_title,
                    **depth_params,
                )
        count += 1
    print(f"Wrote {count * 4} character pages to {CHARACTERS_DIR}")


def main() -> int:
    parser = argparse.ArgumentParser(description="Generate static feat HTML pages.")
    parser.add_argument(
        "--step",
        choices=["index", "general", "feats", "groups", "categories", "prereqs", "classes", "characters"],
        help="Generate only the specified step (default: all implemented steps).",
    )
    parser.add_argument(
        "--clean",
        action="store_true",
        help="Remove html/ before generating (avoids stale pages).",
    )
    args = parser.parse_args()

    if args.clean:
        clean_html_dir()

    catalog = enrich_catalog(etree.parse(str(CATALOG_PATH)))

    if args.step is None or args.step == "index":
        generate_index(catalog)
    if args.step is None or args.step == "index" or args.step == "general":
        generate_general_indexes(catalog)
    if args.step is None or args.step == "feats":
        generate_feats(catalog)
    if args.step is None or args.step == "groups":
        generate_groups(catalog)
    if args.step is None or args.step == "categories":
        generate_categories(catalog)
    if args.step is None or args.step == "prereqs":
        generate_prereqs(catalog)
    if args.step is None or args.step == "classes":
        generate_classes(catalog)
    if args.step is None or args.step == "characters":
        generate_characters(catalog)

    return 0


if __name__ == "__main__":
    sys.exit(main())
