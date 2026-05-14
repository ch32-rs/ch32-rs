#!/usr/bin/env bash

set -e

SVDTOOLS=svd

# Each entry: "<crate_dir> <chip> [novalidate]"
#   crate_dir  - top-level crate directory (e.g. ch32v3)
#   chip       - device yaml name, SVD basename, and module name (e.g. ch32v30x)
#   novalidate - optional flag, set to "novalidate" to skip xmllint schema check
CHIPS=(
    "ch56x   ch56x"
    "ch57x   ch57x"
    "ch32v3  ch32v30x"
    "ch32v2  ch32v20x"
    "ch32v1  ch32v103  novalidate"   # uses some newer SVD features
    "ch58x   ch58x"
    "ch59x   ch59x     novalidate"
    "ch32v0  ch32v003"
    "ch32x0  ch32x035"
    "ch32l1  ch32l103"
    "ch643   ch643"
    "ch641   ch641"
    # newer
    "ch32h4  ch32h417"
)

usage() {
    echo "usage: $0 [crate_dir]" >&2
    echo "available crate_dir values:" >&2
    for entry in "${CHIPS[@]}"; do
        read -r dir _ _ <<< "$entry"
        printf '  %s\n' "$dir" >&2
    done
}

# Filter to the requested crate_dir, or run all when no arg is given.
TARGET="${1:-}"
selected=()
if [ -n "$TARGET" ]; then
    for entry in "${CHIPS[@]}"; do
        read -r dir _ _ <<< "$entry"
        if [ "$dir" = "$TARGET" ]; then
            selected+=("$entry")
        fi
    done
    if [ ${#selected[@]} -eq 0 ]; then
        echo "error: no chip matches '$TARGET'" >&2
        usage
        exit 1
    fi
else
    selected=("${CHIPS[@]}")
fi

set -x

./scripts/makecrates.py -y devices
# pip install svdtools

generate_chip() {
    local crate_dir="$1"
    local chip="$2"
    local opt="${3:-}"
    local svd_patched="svd/fixed/${chip}.svd.patched"
    local out_dir="${crate_dir}/src/${chip}"

    "$SVDTOOLS" patch "devices/${chip}.yaml"

    if [ "$opt" = "novalidate" ]; then
        echo "Skipping schema validation for ${svd_patched}"
    else
        xmllint --schema svd/CMSIS-SVD.xsd --noout "$svd_patched"
    fi

    mkdir -p "$out_dir"
    svd2rust -m --target riscv -g --strict --ident-formats-theme legacy --max_cluster_size \
        -o "$out_dir" -i "$svd_patched"

    mv "$out_dir/generic.rs" "${crate_dir}/src/"
    rm "$out_dir/build.rs"

    rustfmt --config-path="rustfmt.toml" "$out_dir/mod.rs"
}

for entry in "${selected[@]}"; do
    # word-split the entry into positional args; trailing empty field is fine
    read -r crate_dir chip opt <<< "$entry"
    generate_chip "$crate_dir" "$chip" "$opt"
done
