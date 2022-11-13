#!/bin/bash

set -ex

xmllint --schema svd/cmsis-svd.xsd --noout svd/fixed/ch32v2.svd
xmllint --schema svd/cmsis-svd.xsd --noout svd/fixed/ch32v1.svd
xmllint --schema svd/cmsis-svd.xsd --noout svd/fixed/ch32v3.svd