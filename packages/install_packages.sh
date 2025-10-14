source "packages/brew/install_brew.sh"
brew bundle --file=packages/Brewfile

source "packages/zsh/install_zsh.sh"
source "packages/xcode/install_xcode.sh"
source "packages/brew/install_brew.sh"
source "packages/pyenv/install_pyenv.sh"
source "packages/npm/install_npm.sh"
source "packages/neovim/install_neovim.sh"
source "packages/rosetta/install_rosetta.sh"
source "packages/claude/install_claude.sh"
source "packages/aws/install_aws.sh"
