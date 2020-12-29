#!/bin/bash

xset r rate 250 50
xset s off
xset -dpms
xrdb ~/.Xresources

exec i3
