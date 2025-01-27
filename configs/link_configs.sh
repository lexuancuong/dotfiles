function link_configs {
  echo "Starting configuration files linking process..."
  
  # TMUX configuration
  echo "➜ Linking tmux configuration..."
  echo "   📁 Source: $(pwd)/tmux/tmux.conf"
  echo "   📁 Target: $HOME/.tmux.conf"
  if [ -f "$HOME/.tmux.conf" ]; then
    echo "   ⚠️  Removing existing tmux config at $HOME/.tmux.conf"
    rm -rf $HOME/.tmux.conf
  fi
  ln -sf $(pwd)/tmux/tmux.conf $HOME/.tmux.conf
  echo "   ✓ Tmux config linked successfully"

  # ZSH configuration
  echo "➜ Linking zsh configuration..."
  echo "   📁 Source: $(pwd)/ohmyzsh/zshrc"
  echo "   📁 Target: $HOME/.zshrc"
  if [ -f "$HOME/.zshrc" ]; then
    echo "   ⚠️  Removing existing zshrc at $HOME/.zshrc"
    rm -rf $HOME/.zshrc
  fi
  ln -s $(pwd)/ohmyzsh/zshrc $HOME/.zshrc
  echo "   ✓ Zshrc config linked successfully"

  # P10K configuration
  echo "➜ Linking p10k configuration..."
  echo "   📁 Source: $(pwd)/p10k/p10k.zsh"
  echo "   📁 Target: $HOME/.p10k.zsh"
  if [ -f "$HOME/.p10k.zsh" ]; then
    echo "   ⚠️  Removing existing p10k config at $HOME/.p10k.zsh"
    rm -rf $HOME/.p10k.zsh
  fi
  ln -s $(pwd)/p10k/p10k.zsh $HOME/.p10k.zsh
  echo "   ✓ P10k config linked successfully"

  # Lazygit configuration
  echo "➜ Linking lazygit configuration..."
  echo "   📁 Source: $(pwd)/lazygit/config.yml"
  LAZYGIT_CONFIG_DIR=$(lazygit --print-config-dir)
  echo "   📁 Target: $LAZYGIT_CONFIG_DIR/config.yml"
  if [ -f "$LAZYGIT_CONFIG_DIR/config.yml" ]; then
    echo "   ⚠️  Removing existing lazygit config at $LAZYGIT_CONFIG_DIR/config.yml"
    rm -rf "$LAZYGIT_CONFIG_DIR/config.yml"
  fi
  ln -sf $(pwd)/lazygit/config.yml "$LAZYGIT_CONFIG_DIR"
  echo "   ✓ Lazygit config linked successfully"

  echo "✨ All configurations have been linked successfully!"
  echo "NOTE: You may need to restart your terminal for changes to take effect."
}
