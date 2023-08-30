#!/bin/bash

# Installs the Dynamic Wallpapers.

# Color codes
TITLE_CLR='\e[1m'
RESET='\e[0m'

echo -e "${TITLE_CLR}Installing Dynamic Wallpapers..${RESET}"

# Check if user is root or using sudo & abort.
if [ "$EUID" -eq 0 ]; then
    echo "Please don't run this as root or using sudo."
    exit 1
fi

# Alter data in a separate directory.
rm -rf workdir
mkdir workdir
cp -r data/* workdir

# Replace any occurence of REPLACE_WITH_HOME with the user's HOME.
find workdir -type f -name "*.xml" -exec sed -i "s|REPLACE_WITH_HOME|$HOME|g" {} +

# Install.
cp -rf workdir/* "$HOME/.local/share/"

# Cleanup.
rm -rf workdir

echo "Done."
