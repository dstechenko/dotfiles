#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

INSTALL_SRCS=$(realpath $(dirname  "$0"))

rm -rf "${HOME:?}/.aspell.en.pws"
cp     "${INSTALL_SRCS}/.aspell.en.pws" \
       "${HOME:?}/.aspell.en.pws"

mkdir -p "${HOME:?}/.emacs.d/bin"

rm -rf "${HOME:?}/.emacs.d/bin/add_aspell_pws.sh"
cp     "${INSTALL_SRCS}/add_aspell_pws.sh" \
       "${HOME:?}/.emacs.d/bin/add_aspell_pws.sh"
