#!/bin/bash

# Uninstalls the Dynamic Wallpapers.

# Color codes
TITLE_CLR='\e[1m'
RESET='\e[0m'

echo -e "${TITLE_CLR}Uninstalling Dynamic Wallpapers..${RESET}"

# Check if user is root or using sudo & abort.
if [ "$EUID" -eq 0 ]; then
    echo "Please don't run this as root or using sudo."
    exit 1
fi

# Remove backgrounds.
rm -rf "$HOME/.local/share/backgrounds/Dynamic Wallpapers (Timed)"

# Remove gnome-background-properties
gbp=$(ls data/gnome-background-properties)

for file in ${gbp[@]}; do
	find "$HOME/.local/share/gnome-background-properties/" -type f -name "${file}" -delete
done

echo "Done."
