#!/bin/bash

check_rosetta() {
    if /usr/bin/pgrep oahd &>/dev/null; then
        return 0
    else
        return 1
    fi
}

install_rosetta() {
    /usr/sbin/softwareupdate --install-rosetta --agree-to-license

    if [ $? -eq 0 ]; then
        echo " Rosetta 2 installation completed successfully."
    else
        echo " Failed to install Rosetta 2. Please try manually."
        exit 1
    fi
}

if check_rosetta; then
    printf " ${GREEN}✓${NC} Rosetta 2 is already installed\n"
else
    printf " Rosetta 2 is not installed. Installing..."
    install_rosetta
    printf " ${GREEN}✓${NC} Rosetta 2 has been installed\n"
fi
