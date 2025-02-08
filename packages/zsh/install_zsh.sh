function install_ohmyzsh {
  if [ -d "$HOME/.oh-my-zsh" ]; then
    echo " ${GREEN}✓${NC} oh-my-zsh is already installed"
  else
    echo " 📦 Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
    echo " ${GREEN}✓${NC} oh-my-zsh installed successfully"
  fi
  # Set ZSH_CUSTOM for plugins installation
  ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
  if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo " 📦 Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    echo " ${GREEN}✓${NC} zsh-autosuggestions installed successfully"
  else
    echo " ${GREEN}✓${NC} zsh-autosuggestions plugin is already installed"
  fi
}

if ! is_installed zsh; then
  brew install zsh
fi
print_package_version zsh
echo "  ${GREEN} Install zsh plugins..."
brew install zsh-autosuggestions
brew install zsh-completions
brew install zsh-syntax-highlighting
brew install zsh-vi-mode
install_ohmyzsh
if ! is_installed oh-my-posh; then
  brew install jandedobbeleer/oh-my-posh/oh-my-posh
fi

ZSH_SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CUSTOM_ZSH_FILE="$ZSH_SETUP_DIR/zshrc"
SYSTEM_ZSH_FILE="$HOME/.zshrc"
create_symlink $CUSTOM_ZSH_FILE $SYSTEM_ZSH_FILE
