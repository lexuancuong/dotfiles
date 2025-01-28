function install_oh_my_zsh {
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
  brew install powerlevel10k
  brew install zsh-autosuggestions
  brew install zsh-completions
  brew install zsh-syntax-highlighting
fi
print_package_version zsh

ZSH_SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SECRET_FILE="$ZSH_SETUP_DIR/zsh_secrets"
SYSTEM_SECRET_FILE="$HOME/.zshrc_secrets"
create_symlink $SECRET_FILE $SYSTEM_SECRET_FILE

CUSTOM_P10K_FILE="$ZSH_SETUP_DIR/p10k.zsh"
SYSTEM_P10K_FILE="$HOME/.p10k.zsh"
create_symlink $CUSTOM_P10K_FILE $SYSTEM_P10K_FILE

CUSTOM_ZSH_FILE="$ZSH_SETUP_DIR/zshrc"
SYSTEM_ZSH_FILE="$HOME/.zshrc"
create_symlink $CUSTOM_ZSH_FILE $SYSTEM_ZSH_FILE
