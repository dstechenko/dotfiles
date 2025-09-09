#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm    -rf "${HOME:?}/.emacs.d"
mkdir -p  "${HOME:?}/.emacs.d/init"
cp        "${INSTALL_SRCS:?}/emacs/init-shared.el" \
          "${HOME:?}/.emacs.d/init/init-shared.el"
cp        "${INSTALL_SRCS:?}/emacs/init.el" \
          "${HOME:?}/.emacs.d/init.el"
