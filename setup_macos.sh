#!/bin/bash
set -e

source "utils/colors.sh"
source "utils/create_symlimk.sh"
source "utils/is_installed.sh"
source "utils/print_package_version.sh"

echo "======================================"
echo "🚀 Starting MacOS Development Setup..."
echo "======================================"

source "packages/xcode/install_xcode.sh"
source "packages/iterm2/install_iterm2.sh"
source "packages/brew/install_brew.sh"
source "packages/fzf/install_fzf.sh"
source "packages/bat/install_bat.sh"
source "packages/ripgrep/install_ripgrep.sh"
source "packages/tmux/install_tmux.sh"
source "packages/git/install_git.sh"
source "packages/lazygit/install_lazygit.sh"
source "packages/pyenv/install_pyenv.sh"
source "packages/node/install_node.sh"
source "packages/neovim/install_neovim.sh"
source "packages/zsh/install_zsh.sh"
source "packages/rosetta/install_rosetta.sh"


echo "======================================"
echo "✨ Setup completed successfully!"
echo "🔸 Please restart your terminal"
echo "======================================"
