#!/bin/bash
set -e

source "utils/colors.sh"
source "utils/create_symlimk.sh"
source "utils/is_installed.sh"
source "utils/did_brew_install.sh"
source "utils/did_app_install.sh"
source "utils/print_package_version.sh"

echo "======================================"
echo "🚀 Starting MacOS Development Setup..."
echo "======================================"

brew bundle --file=~/dotfiles/Brewfile
source "packages/xcode/install_xcode.sh"
source "packages/brew/install_brew.sh"
source "packages/fzf/install_fzf.sh"
source "packages/tmux/install_tmux.sh"
source "packages/lazygit/install_lazygit.sh"
source "packages/pyenv/install_pyenv.sh"
source "packages/npm/install_npm.sh"
source "packages/neovim/install_neovim.sh"
source "packages/zsh/install_zsh.sh"
source "packages/rosetta/install_rosetta.sh"
source "packages/alacritty/install_alacritty.sh"
source "packages/karabiner/install_karabiner.sh"


echo "======================================"
echo "✨ Setup completed successfully!"
echo "🔸 Please restart your terminal"
echo "======================================"
