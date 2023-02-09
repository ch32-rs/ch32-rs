#!/bin/bash

set -ex

xmllint --schema svd/CMSIS-SVD.xsd --noout svd/fixed/ch32v103.svd
xmllint --schema svd/CMSIS-SVD.xsd --noout svd/fixed/ch32v20x.svd
xmllint --schema svd/CMSIS-SVD.xsd --noout svd/fixed/ch32v30x.svd