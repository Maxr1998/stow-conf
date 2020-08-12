#!/bin/sh
sort -u -o pkgs_desktop.txt{,}
pacman -Qqen | grep -vf pkgs_desktop.txt > pkgs.txt
pacman -Qqem > pkgs_aur.txt

