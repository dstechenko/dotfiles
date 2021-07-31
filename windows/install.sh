#!/bin/bash
# Copyright (C) Dmytro Stechenko
# License: http://www.gnu.org/licenses/gpl.html

set -euxo pipefail

INSTALL_SRCS=$(realpath   $(dirname  "$0"))
     WIN_DIR=$(wslpath -u $(wslvar WINDIR))
USER_PROFILE=$(wslpath -u $(wslvar USERPROFILE))
    APPS_DIR="${USER_PROFILE}/Apps"

# install fonts
sudo cp -r "${WIN_DIR}/Fonts"                                      "${HOME:?}/.fonts"
sudo cp -r "${USER_PROFILE}/AppData/Local/Microsoft/Windows/Fonts" "${HOME:?}/.fonts"

fc-cache -fv

# install resolv
sudo rm -rf "/etc/wsl.conf"
sudo rm -rf "/etc/resolv.conf"

sudo cp "${INSTALL_SRCS}/wsl.conf"    "/etc/wsl.conf"
sudo cp "${INSTALL_SRCS}/resolv.conf" "/etc/resolv.conf"

# install shortcuts
mkdir -p "${APPS_DIR}"

cp "${INSTALL_SRCS}"/Emacs.*    "${APPS_DIR}"
cp "${INSTALL_SRCS}"/XRestart.* "${APPS_DIR}"

powershell.exe                                 \
    "${INSTALL_SRCS}/MakeShortcut.ps1"         \
     $(wslpath -w "${APPS_DIR}")/Emacs.lnk     \
     $(wslpath -w "${APPS_DIR}/Emacs.bat")
powershell.exe                                 \
    "${INSTALL_SRCS}/MakeShortcut.ps1"         \
     $(wslpath -w "${APPS_DIR}")/XRestart.lnk  \
     $(wslpath -w "${APPS_DIR}/XRestart.bat")
