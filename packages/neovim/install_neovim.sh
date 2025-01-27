is_installed() {
    command -v "$1" >/dev/null 2>&1
}

if [ "$(is_installed nvim)" == "0" ]; then
  echo "Install neovim"
  brew install neovim
  if [ "$(is_installed pip3)" == "1" ]; then
    pip3 install neovim --upgrade
  fi
else
    echo "✓ Node is already installed"
    echo "  Version: $(nvim --version)"
fi
