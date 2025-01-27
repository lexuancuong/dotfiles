# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


function link_configs {
  echo "Starting configuration files linking process..."
  
  # Define source and target pairs directly in arrays
  sources=(
    "tmux/tmux.conf"
    "zsh/zshrc"
    "lazygit/config.yml"
  )
  targets=(
    "$HOME/.tmux.conf"
    "$HOME/.zshrc"
    "$(lazygit --print-config-dir)/config.yml"
  )
  
  # Iterate over arrays using index
  for i in "${!sources[@]}"; do
    source="${sources[$i]}"
    target="${targets[$i]}"
    echo "➜ Linking ${source%/*} configuration..."
    
    # Create target directory if it doesn't exist
    mkdir -p "$(dirname "$target")"
    
    # Remove existing file or symlink if it exists
    if [ -e "$target" ] || [ -L "$target" ]; then
      echo "   Removing existing config at $target"
      rm -f "$target"
    fi

    # Create symbolic link (will override existing ones)
    ln -sf "$SCRIPT_DIR/$source" "$target"
    echo "✓ Done"
  done

  echo "✨ All configurations have been linked successfully!"
  echo "NOTE: You may need to restart your terminal for changes to take effect."
}
