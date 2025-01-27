function install_oh_my_zsh {
  if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "✓ oh-my-zsh is already installed"
  else
    echo "📦 Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
    echo "✓ oh-my-zsh installed successfully"
  fi
  # Set ZSH_CUSTOM for plugins installation
  ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
  if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "📦 Installing zsh-autosuggestions plugin..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
    echo "✓ zsh-autosuggestions installed successfully"
  else
    echo "✓ zsh-autosuggestions plugin is already installed"
  fi
}

brew install zsh
brew install powerlevel10k
brew install zsh-autosuggestions
brew install zsh-completions
brew install zsh-syntax-highlighting

ZSH_SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOURCE="$ZSH_SETUP_DIR/zshrc"
ZSH_CONFIG_FILE="$HOME/.zshrc"
rm -rf $ZSH_CONFIG_FILE
echo "  📁 Droped $ZSH_CONFIG_FILE"
ln -sf "$SOURCE" "$ZSH_CONFIG_FILE"
echo "  📁 Linked ZSH config from $SOURCE to $ZSH_CONFIG_FILE"

rm -rf $HOME/.p10k.zsh
echo "  📁 Droped $HOME/.p10k.zsh"
ln -s "$ZSH_SETUP_DIR/p10k.zsh" "$HOME/.p10k.zsh"
echo "  📁 Linked P10K config from $ZSH_SETUP_DIR/p10k.zsh to $HOME/.p10k.zsh"
install_oh_my_zsh
