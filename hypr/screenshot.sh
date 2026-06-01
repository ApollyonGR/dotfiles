#!/bin/bash
# Takes a screenshot and saves it to disk
# hyprshot -m output -m eDP-1 -o ~/Pictures/screenshots

# Takes a screenshot of a selected window and saves it to disk 
hyprshot -m region -o ~/Pictures/screenshots

# Takes a screenshot and copies it to clipboard
# hyprshot -m output -m eDP-1 --clipboard-only 
