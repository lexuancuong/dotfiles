# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Configuration mapping: source -> target
declare -A configs=(
  ["tmux/tmux.conf"]="$HOME/.tmux.conf"
  ["ohmyzsh/zshrc"]="$HOME/.zshrc"
  ["p10k/p10k.zsh"]="$HOME/.p10k.zsh"
  ["lazygit/config.yml"]="$(lazygit --print-config-dir)/config.yml"
)

function link_configs {
  echo "Starting configuration files linking process..."
  
  for source in "${!configs[@]}"; do
    target="${configs[$source]}"
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
