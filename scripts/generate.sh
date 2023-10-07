#!/bin/bash

set -ex

./scripts/makecrates.py -y devices
# pip install svdtools

SVDTOOLS=svd


$SVDTOOLS patch devices/ch56x.yaml
xmllint --schema svd/CMSIS-SVD.xsd --noout svd/fixed/ch56x.svd.patched

mkdir -p ch56x/src/ch56x
svd2rust -m --target riscv -o ch56x/src/ch56x -g --strict --pascal_enum_values --max_cluster_size -i svd/fixed/ch56x.svd.patched

mv ch56x/src/ch56x/generic.rs ch56x/src/
rm ch56x/src/ch56x/build.rs

rustfmt --config-path="rustfmt.toml" ch56x/src/ch56x/mod.rs



$SVDTOOLS patch devices/ch57x.yaml
xmllint --schema svd/CMSIS-SVD.xsd --noout svd/fixed/ch57x.svd.patched

mkdir -p ch57x/src/ch57x
svd2rust -m --target riscv -o ch57x/src/ch57x -g --strict --pascal_enum_values --max_cluster_size -i svd/fixed/ch57x.svd.patched

mv ch57x/src/ch57x/generic.rs ch57x/src/
rm ch57x/src/ch57x/build.rs

rustfmt --config-path="rustfmt.toml" ch57x/src/ch57x/mod.rs


$SVDTOOLS patch devices/ch32v30x.yaml
xmllint --schema svd/CMSIS-SVD.xsd --noout svd/fixed/ch32v30x.svd.patched

mkdir -p ch32v3/src/ch32v30x
svd2rust -m --target riscv -o ch32v3/src/ch32v30x -g --strict --pascal_enum_values --max_cluster_size -i svd/fixed/ch32v30x.svd.patched

mv ch32v3/src/ch32v30x/generic.rs ch32v3/src/
rm ch32v3/src/ch32v30x/build.rs

rustfmt --config-path="rustfmt.toml" ch32v3/src/ch32v30x/mod.rs



$SVDTOOLS patch devices/ch32v20x.yaml
xmllint --schema svd/CMSIS-SVD.xsd --noout svd/fixed/ch32v20x.svd.patched

mkdir -p ch32v2/src/ch32v20x
svd2rust -m --target riscv -g --strict --pascal_enum_values --max_cluster_size \
    -o ch32v2/src/ch32v20x -i svd/fixed/ch32v20x.svd.patched

mv ch32v2/src/ch32v20x/generic.rs ch32v2/src/
rm ch32v2/src/ch32v20x/build.rs

rustfmt --config-path="rustfmt.toml" ch32v2/src/ch32v20x/mod.rs



$SVDTOOLS patch devices/ch32v103.yaml
#xmllint --schema svd/CMSIS-SVD.xsd --noout svd/fixed/ch32v103.svd.patched
echo "Ignore checking ch32v103.svd.patched. It uses some newer features."

mkdir -p ch32v1/src/ch32v103
svd2rust -m --target riscv -g --strict --pascal_enum_values --max_cluster_size \
    -o ch32v1/src/ch32v103 -i svd/fixed/ch32v103.svd.patched

mv ch32v1/src/ch32v103/generic.rs ch32v1/src/
rm ch32v1/src/ch32v103/build.rs

rustfmt --config-path="rustfmt.toml" ch32v1/src/ch32v103/mod.rs



$SVDTOOLS patch devices/ch58x.yaml
xmllint --schema svd/CMSIS-SVD.xsd --noout svd/fixed/ch58x.svd.patched

mkdir -p ch58x/src/ch58x
svd2rust -m --target riscv -o ch58x/src/ch58x -g --strict --pascal_enum_values --max_cluster_size -i svd/fixed/ch58x.svd.patched

mv ch58x/src/ch58x/generic.rs ch58x/src/
rm ch58x/src/ch58x/build.rs

rustfmt --config-path="rustfmt.toml" ch58x/src/ch58x/mod.rs


$SVDTOOLS patch devices/ch59x.yaml
# xmllint --schema svd/CMSIS-SVD.xsd --noout svd/fixed/ch59x.svd.patched

mkdir -p ch59x/src/ch59x
svd2rust -m --target riscv -o ch59x/src/ch59x -g --strict --pascal_enum_values --max_cluster_size -i svd/fixed/ch59x.svd.patched

mv ch59x/src/ch59x/generic.rs ch59x/src/
rm ch59x/src/ch59x/build.rs

rustfmt --config-path="rustfmt.toml" ch59x/src/ch59x/mod.rs



$SVDTOOLS patch devices/ch32v003.yaml
xmllint --schema svd/CMSIS-SVD.xsd --noout svd/fixed/ch32v003.svd.patched

mkdir -p ch32v0/src/ch32v003
svd2rust -m --target riscv -g --strict --pascal_enum_values --max_cluster_size \
    -o ch32v0/src/ch32v003 -i svd/fixed/ch32v003.svd.patched

mv ch32v0/src/ch32v003/generic.rs ch32v0/src/
rm ch32v0/src/ch32v003/build.rs

rustfmt --config-path="rustfmt.toml" ch32v0/src/ch32v003/mod.rs


$SVDTOOLS patch devices/ch32x035.yaml
xmllint --schema svd/CMSIS-SVD.xsd --noout svd/fixed/ch32x035.svd.patched

mkdir -p ch32x0/src/ch32x035
svd2rust -m --target riscv -g --strict --pascal_enum_values --max_cluster_size \
    -o ch32x0/src/ch32x035 -i svd/fixed/ch32x035.svd.patched

mv ch32x0/src/ch32x035/generic.rs ch32x0/src/
rm ch32x0/src/ch32x035/build.rs

rustfmt --config-path="rustfmt.toml" ch32x0/src/ch32x035/mod.rs



$SVDTOOLS patch devices/ch32l103.yaml
xmllint --schema svd/CMSIS-SVD.xsd --noout svd/fixed/ch32l103.svd.patched

mkdir -p ch32l1/src/ch32l103
svd2rust -m --target riscv -g --strict --pascal_enum_values --max_cluster_size \
    -o ch32l1/src/ch32l103 -i svd/fixed/ch32l103.svd.patched

mv ch32l1/src/ch32l103/generic.rs ch32l1/src/
rm ch32l1/src/ch32l103/build.rs

rustfmt --config-path="rustfmt.toml" ch32l1/src/ch32l103/mod.rs


$SVDTOOLS patch devices/ch643.yaml
xmllint --schema svd/CMSIS-SVD.xsd --noout svd/fixed/ch643.svd.patched

mkdir -p ch643/src/ch643
svd2rust -m --target riscv -g --strict --pascal_enum_values --max_cluster_size \
    -o ch643/src/ch643 -i svd/fixed/ch643.svd.patched

mv ch643/src/ch643/generic.rs ch643/src/
rm ch643/src/ch643/build.rs

rustfmt --config-path="rustfmt.toml" ch643/src/ch643/mod.rs
