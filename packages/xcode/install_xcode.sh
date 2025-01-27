#!/bin/bash

check_xcode() {
    if xcode-select --print-path &>/dev/null; then
        return 0
    else
        return 1
    fi
}

install_xcode() {
    xcode-select --install
    echo " Please complete the installation manually if prompted."
    until xcode-select --print-path &>/dev/null; do
        echo " Waiting for Xcode command line tools installation to complete..."
        sleep 10
    done

}

if check_xcode; then
    printf " ${GREEN}✓${NC} Xcode command line tools are already installed.\n"
else
    echo " Xcode command line tools are not installed. Installing..."
    install_xcode
    printf " ${GREEN}✓${NC} Xcode command line tools have been installed.\n"
fi

