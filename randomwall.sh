#!/bin/bash

# random wallpaper
paper=$(ls ~/wallpaps | sort -R | tail -1)
# set random chosen wallpaper as current wallpaper
hsetroot -cover ~/wallpapers/$paper
