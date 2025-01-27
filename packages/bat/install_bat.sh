is_installed() {
    command -v "$1" >/dev/null 2>&1
}
if [ "$(is_installed bat)" == "0" ]; then
  echo "Installing bat - alternative for cat"
  brew install bat
else
    echo "✓ bat is already installed"
    echo "  Version: $(bat --version)"
fi

