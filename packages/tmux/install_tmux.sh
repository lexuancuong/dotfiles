if ! is_installed tmux; then
  echo " Installing tmux..."
  brew install tmux
  echo " Installing reattach-to-user-namespace..."
  brew install reattach-to-user-namespace
  echo " Installing tmux-plugin-manager..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
print_package_version tmux
TMUX_SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CUSTOM_TMUX_FILE=$TMUX_SETUP_DIR/tmux.conf
SYSTEM_TMUX_FILE="$HOME/.tmux.conf"
create_symlink $CUSTOM_TMUX_FILE $SYSTEM_TMUX_FILE
echo -e "${GREEN}   [i] Plesae restart with tmux shortcut: Prefix + I (capital i)"
