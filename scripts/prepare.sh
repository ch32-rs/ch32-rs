#!/bin/bash

set -ex

# or libxml2-utils
#brew install libxml2
#pip install wheel svdtools

# wget https://raw.githubusercontent.com/ARM-software/CMSIS_5/develop/CMSIS/Utilities/CMSIS-SVD.xsd -O svd/CMSIS-SVD.xsd

# prepare to fix the format manually
mkdir -p svd/fixed/


# ch32v30x
cp -v svd/vendor/CH32V307xx.svd ./svd/fixed/ch32v3.svd
# ch32v20x
cp -v svd/vendor/CH32V208xx.svd ./svd/fixed/ch32v2.svd
# ch32v103
cp -v svd/vendor/CH32V103xx.svd ./svd/fixed/ch32v1.svd
