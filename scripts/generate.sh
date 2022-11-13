#!/bin/bash

set -ex

./scripts/makecrates.py devices


svd patch devices/ch32v30x.yaml
xmllint --schema svd/cmsis-svd.xsd --noout svd/fixed/ch32v3.svd.patched

mkdir -p ch32v3/src/ch32v30x
svd2rust -m --target riscv -o ch32v3/src/ch32v30x -g --strict --pascal_enum_values --max_cluster_size -i svd/fixed/ch32v3.svd.patched

mv ch32v3/src/ch32v30x/generic.rs ch32v3/src/
rm ch32v3/src/ch32v30x/build.rs

rustfmt --config-path="rustfmt.toml" ch32v3/src/ch32v30x/mod.rs



svd patch devices/ch32v20x.yaml
xmllint --schema svd/cmsis-svd.xsd --noout svd/fixed/ch32v2.svd.patched

mkdir -p ch32v2/src/ch32v20x
svd2rust -m --target riscv -g --strict --pascal_enum_values --max_cluster_size \
    -o ch32v2/src/ch32v20x -i svd/fixed/ch32v2.svd.patched

mv ch32v2/src/ch32v20x/generic.rs ch32v2/src/
rm ch32v2/src/ch32v20x/build.rs

rustfmt --config-path="rustfmt.toml" ch32v2/src/ch32v20x/mod.rs



svd patch devices/ch32v103.yaml
xmllint --schema svd/cmsis-svd.xsd --noout svd/fixed/ch32v1.svd.patched

mkdir -p ch32v1/src/ch32v103
svd2rust -m --target riscv -g --strict --pascal_enum_values --max_cluster_size \
    -o ch32v1/src/ch32v103 -i svd/fixed/ch32v1.svd.patched

mv ch32v1/src/ch32v103/generic.rs ch32v1/src/
rm ch32v1/src/ch32v103/build.rs

rustfmt --config-path="rustfmt.toml" ch32v1/src/ch32v103/mod.rs



svd patch devices/ch58x.yaml
xmllint --schema svd/cmsis-svd.xsd --noout svd/fixed/ch58x.svd.patched

mkdir -p ch58x/src/ch58x
svd2rust -m --target riscv -o ch58x/src/ch58x -g --strict --pascal_enum_values --max_cluster_size -i svd/fixed/ch58x.svd.patched

mv ch58x/src/ch58x/generic.rs ch58x/src/
rm ch58x/src/ch58x/build.rs

rustfmt --config-path="rustfmt.toml" ch58x/src/ch58x/mod.rs