#!/bin/bash

set -ex

rm -rv ../ch32-rs-nightlies/ch* || true

mv ch* ../ch32-rs-nightlies
