function is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0;  }
  # return
  echo "$return_"
}
TMUX_SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ "$(is_installed tmux)" == "0" ]; then
  echo "Installing tmux"
  brew install tmux
  echo "Installing reattach-to-user-namespace"
  brew install reattach-to-user-namespace
  echo "Installing tmux-plugin-manager"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "✓ tmux is already installed"
    echo "  Version: $(tmux -V)"
fi

SOURCE=$TMUX_SETUP_DIR/tmux.conf
TMUX_CONFIG_FILE="$HOME/.tmux.conf"
rm -rf $TMUX_CONFIG_FILE
echo "  📁 Droped $TMUX_CONFIG_FILE"
ln -s "$SOURCE" "$TMUX_CONFIG_FILE"
echo "  📁 Linked tmux config from $SOURCE to $TMUX_CONFIG_FILE"
