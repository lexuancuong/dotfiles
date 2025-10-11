#!/bin/bash
set -e


echo "======================================"
echo "🚀 Starting MacOS Development Setup..."
echo "======================================"

source "utils/load_utils.sh"
brew bundle --file=~/dotfiles/Brewfile
source "configs/install_configs.sh"
source "packages/install_packages.sh"

echo "======================================"
echo "✨ Setup completed successfully!"
echo "🔸 Please restart your terminal"
echo "======================================"
