#!/bin/bash
set -e

echo "======================================"
echo "🚀 Starting MacOS Development Setup..."
echo "======================================"
export DEBIAN_FRONTEND=noninteractive
# xcode-select --install # NOTE check it

# if [ $TERM_PROGRAM != "iTerm.app" ]; then
#   echo "Installing iTerm2"
#   brew tap caskroom/cask
#   brew cask install iterm2
# fi

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


# echo "Install Rosetta 2 to speed up the Docker on M1 chipset"
# softwareupdate --install-rosetta


echo "======================================"
echo "✨ Setup completed successfully!"
echo "🔸 Please restart your terminal"
echo "======================================"
