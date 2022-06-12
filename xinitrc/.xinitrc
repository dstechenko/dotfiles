#!/bin/bash

xset r rate 250 50
xset s off
xset -dpms

if [[ -f "${HOME}/.Xmodmap" ]]; then
    xmodmap "${HOME}/.Xmodmap"
fi

if [[ -f "${HOME}/.Xresources" ]]; then
    xrdb -load "${HOME}/.Xresources"
fi
