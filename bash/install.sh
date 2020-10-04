#!/bin/bash

# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

rm -rf "$HOME/.bashrc"
cp     "$DOTFILES_BASH_SRCS/.bashrc" \
       "$HOME/.bashrc"

rm -rf "$HOME/.bash_profile"
cp     "$DOTFILES_BASH_SRCS/.bash_profile" \
       "$HOME/.bash_profile"
