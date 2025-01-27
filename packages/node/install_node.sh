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
fi
print_package_version node
