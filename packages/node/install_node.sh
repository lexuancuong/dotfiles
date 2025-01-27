is_installed() {
    command -v "$1" >/dev/null 2>&1
}

if ! is_installed node; then
    echo "📦 Installing Node..."
    brew install node
    if is_installed node; then
        echo "✓ Node.js installed successfully"
        echo "  Version: $(node --version)"
    else
        echo "❌ Failed to install Node.js"
        exit 1
    fi
else
    echo "✓ Node.js is already installed"
    echo "  Version: $(node --version)"
fi

