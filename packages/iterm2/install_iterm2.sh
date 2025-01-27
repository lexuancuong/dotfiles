#!/bin/bash

# Function to check if iTerm2 is installed
check_iterm2() {
    if [ -d "/Applications/iTerm.app" ]; then
        return 0
    else
        return 1
    fi
}

# Function to install iTerm2 using Homebrew
install_iterm2() {
    echo " iTerm2 is not installed. Installing..."
    if ! command -v brew &> /dev/null; then
        echo " Homebrew not found. Installing Homebrew first..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install --cask iterm2
}

# Main execution
if check_iterm2; then
    printf " ${GREEN}✓${NC} Iterm2 was installed\n"
else
    install_iterm2
    printf " ${GREEN}✓${NC} iTerm2 installation completed."
fi

