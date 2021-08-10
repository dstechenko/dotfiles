#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

INSTALL_SRCS=$(realpath $(dirname  "$0"))

rm -rf "${HOME:?}/.aspell.en.pws"
cp     "${INSTALL_SRCS}/aspell/.aspell.en.pws" \
       "${HOME:?}/.aspell.en.pws"
