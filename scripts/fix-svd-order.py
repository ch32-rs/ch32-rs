#!/usr/bin/env python3
"""Reorder SVD child elements to comply with the CMSIS-SVD schema.

The CMSIS-SVD schema mandates a fixed child order inside <peripheral>,
<register>, and <field>. Vendor SVDs from WCH occasionally violate that order
(e.g. <alternateRegister> after <addressOffset>, <addressBlock> after
<interrupt>, <access> after <resetValue>, or <access> before <bitOffset>),
which makes `xmllint --schema CMSIS-SVD.xsd` fail. This script rewrites those
parents so their children follow the schema order, preserving the relative
order of siblings that share the same tag.
"""

from __future__ import annotations

import argparse
import sys
from pathlib import Path

from lxml import etree

PERIPHERAL_ORDER = [
    "dim", "dimIncrement", "dimIndex", "dimName", "dimArrayIndex",
    "name", "version", "description",
    "alternatePeripheral", "groupName",
    "prependToName", "appendToName", "headerStructName", "disableCondition",
    "baseAddress",
    "size", "access", "protection", "resetValue", "resetMask",
    "addressBlock", "interrupt", "registers",
]

REGISTER_ORDER = [
    "dim", "dimIncrement", "dimIndex", "dimName", "dimArrayIndex",
    "name", "displayName", "description",
    "alternateGroup", "alternateRegister",
    "addressOffset",
    "size", "access", "protection", "resetValue", "resetMask",
    "dataType", "modifiedWriteValues", "writeConstraint", "readAction",
    "fields",
]

FIELD_ORDER = [
    "dim", "dimIncrement", "dimIndex", "dimName", "dimArrayIndex",
    "name", "description",
    "bitOffset", "bitWidth", "lsb", "msb", "bitRange",
    "access",
    "modifiedWriteValues", "writeConstraint", "readAction",
    "enumeratedValues",
]

RULES = {
    "peripheral": PERIPHERAL_ORDER,
    "register": REGISTER_ORDER,
    "field": FIELD_ORDER,
}


def reorder_children(parent: etree._Element, order: list[str]) -> bool:
    """Stable-sort element children to match `order`. Returns True if changed."""
    rank = {name: i for i, name in enumerate(order)}
    fallback = len(order)
    children = list(parent)
    if not children:
        return False

    keyed = [
        (rank.get(c.tag, fallback) if isinstance(c.tag, str) else fallback, idx, c)
        for idx, c in enumerate(children)
    ]
    sorted_keyed = sorted(keyed, key=lambda t: (t[0], t[1]))
    if [c for _, _, c in keyed] == [c for _, _, c in sorted_keyed]:
        return False

    for c in children:
        parent.remove(c)
    for _, _, c in sorted_keyed:
        parent.append(c)
    return True


def fix(tree: etree._ElementTree) -> dict[str, int]:
    stats = {tag: 0 for tag in RULES}
    for tag, order in RULES.items():
        for elem in tree.iter(tag):
            if reorder_children(elem, order):
                stats[tag] += 1
    return stats


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("svd", type=Path, help="SVD file to fix")
    parser.add_argument(
        "-o", "--output", type=Path, default=None,
        help="output path (default: rewrite the input in place)",
    )
    args = parser.parse_args()

    xml_parser = etree.XMLParser(remove_blank_text=False, remove_comments=False)
    tree = etree.parse(str(args.svd), xml_parser)

    stats = fix(tree)
    total = sum(stats.values())

    out = args.output if args.output is not None else args.svd
    tree.write(str(out), xml_declaration=True, encoding="utf-8", standalone=False)

    summary = ", ".join(f"{tag}={n}" for tag, n in stats.items())
    print(f"{args.svd}: reordered {total} element(s) [{summary}] -> {out}",
          file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
