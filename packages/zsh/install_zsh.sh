function install_ohmyzsh {
  if [ -d "$HOME/.oh-my-zsh" ]; then
    echo -e "${GREEN} ✓ oh-my-zsh is already installed ${NC}"
  else
    echo " 📦 Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
    echo -e " ${GREEN}✓${NC} oh-my-zsh installed successfully"
  fi
  # Set ZSH_CUSTOM for plugins installation
  ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
  if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo " 📦 Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    echo -e " ${GREEN}✓${NC} zsh-autosuggestions installed successfully"
  else
    echo -e " ${GREEN}✓${NC} zsh-autosuggestions plugin is already installed"
  fi
}

if ! is_installed zsh; then
  brew install zsh
fi
print_package_version zsh
if ! did_brew_install "zsh-autosuggestions"; then
  echo -e "${GREEN} Install zsh-autosuggestions..."
  brew install zsh-autosuggestions
fi
if ! did_brew_install "zsh-completions"; then
  echo "  ${GREEN} Install zsh-completions..."
  brew install zsh-completions
fi
if ! did_brew_install "zsh-syntax-highlighting"; then
  echo "  ${GREEN} Install zsh-syntax-highlighting..."
  brew install zsh-syntax-highlighting
fi
if ! did_brew_install "zsh-vi-mode"; then
  echo "  ${GREEN} Install zsh-vi-mode..."
  brew install zsh-vi-mode
fi
install_ohmyzsh
if ! is_installed oh-my-posh; then
  brew install jandedobbeleer/oh-my-posh/oh-my-posh
fi

ZSH_SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CUSTOM_ZSH_FILE="$ZSH_SETUP_DIR/zshrc"
SYSTEM_ZSH_FILE="$HOME/.zshrc"
create_symlink $CUSTOM_ZSH_FILE $SYSTEM_ZSH_FILE
