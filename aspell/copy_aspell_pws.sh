#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

INSTALL_SRCS=$(realpath $(dirname  "$0"))

cp "${HOME:?}/.aspell.en.pws" \
   "${INSTALL_SRCS}/aspell/.aspell.en.pws"
