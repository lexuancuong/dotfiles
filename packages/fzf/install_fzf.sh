is_installed() {
    command -v "$1" >/dev/null 2>&1
}
if [ "$(is_installed fzf)" == "0" ]; then
  echo "Installing fzf"
  brew install fzf
  $(brew --prefix)/opt/fzf/install --all
else
    echo "✓ fzf is already installed"
    echo "  Version: $(fzf --version)"
fi

