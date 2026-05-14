#!/usr/bin/env python3
"""Strip WCH register-prefix hungarians that appear *after* `__` in a name.

WCH vendor SVDs encode "this register/field has two roles (e.g. USB device
vs USB host)" as `XXX__YYY`, where the leading `R8_/R16_/R32_/RB_` of XXX
gets stripped by svdtools' `_strip` rules — but the prefix on YYY (after
the `__` separator) survives because svdtools' `_strip` is prefix-only.

This script does the missing half: it removes any `R8_/R16_/R32_/RB_`
prefix that follows `__` inside `<register>` / `<field>` `<name>`
elements, leaving the `__` separator intact (so downstream readers still
see that the name represents two semantics sharing the same bits).

Example: `RB_UH_DP_PIN__RB_UD_DP_PIN` -> `RB_UH_DP_PIN__UD_DP_PIN`
         (the leading `RB_` is left for svdtools `_strip` to handle.)
"""

from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path

from lxml import etree

# Match WCH hungarian prefix only when it's preceded by `__` (lookbehind is
# fixed-width 2, but matches at every position where the preceding two chars
# are `__` — that includes `___RB_` etc. since the inner two of three `_`
# satisfy the lookbehind).
PATTERN = re.compile(r"(?<=__)(R8_|R16_|R32_|RB_)")
RENAME_PARENTS = {"register", "field"}


def fix(tree: etree._ElementTree) -> int:
    renames = 0
    for el in tree.iter():
        if el.tag not in RENAME_PARENTS:
            continue
        name_el = el.find("name")
        if name_el is None or not isinstance(name_el.text, str):
            continue
        new = PATTERN.sub("", name_el.text)
        if new != name_el.text:
            name_el.text = new
            renames += 1
    return renames


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("svd", type=Path, help="SVD file to rewrite")
    parser.add_argument(
        "-o", "--output", type=Path, default=None,
        help="output path (default: rewrite the input in place)",
    )
    args = parser.parse_args()

    xml_parser = etree.XMLParser(remove_blank_text=False, remove_comments=False)
    tree = etree.parse(str(args.svd), xml_parser)

    n = fix(tree)

    out = args.output if args.output is not None else args.svd
    tree.write(str(out), xml_declaration=True, encoding="utf-8", standalone=False)

    print(f"{args.svd}: stripped post-`__` prefix in {n} name(s) -> {out}",
          file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
