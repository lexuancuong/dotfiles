is_installed() {
    command -v "$1" >/dev/null 2>&1
}
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! is_installed lazygit; then
    echo "📦 Installing LazyGit..."
    brew install lazygit
    if is_installed lazygit; then
        echo "✓ LazyGit installed successfully"
        echo "  Version: $(lazygit --version)"
    else
        echo "❌ Failed to install LazyGit"
        exit 1
    fi
else
    echo "✓ LazyGit is already installed"
    echo "  Version: $(lazygit --version)"
fi
# Create LazyGit config directory
TARGET="$(lazygit --print-config-dir)"
echo "📁 Setting up LazyGit configuration at directory $TARGET..."
mkdir -p "$TARGET"
if [ -e "$target" ] || [ -L "$TARGET" ]; then
  echo "   Removing existing config at $TARGET"
  rm -f "$TARGET"
fi
SOURCE="$SCRIPT_DIR/congig.yml"
echo "📁 Link LazyGit configuration from directory $SOURCE to $TARGET..."
# Create symbolic link (will override existing ones)
ln -sf "$SOURCE" "$TARGET"
echo "Linked the Lazygit config file."
