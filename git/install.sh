#!/bin/bash

# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm -rf "${HOME:?}/.gitignore_global"
cp     "$DOTFILES_GIT_SRCS/.gitignore_global" \
       "${HOME:?}/.gitignore_global"
