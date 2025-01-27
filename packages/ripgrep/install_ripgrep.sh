is_installed() {
    command -v "$1" >/dev/null 2>&1
}
if [ "$(is_installed rg)" == "0" ]; then
  echo "Installing The Ripgrep"
  brew install ripgrep
else
    echo "✓ Ripgrep is already installed"
    echo "  Version: $(rg --version)"
fi

