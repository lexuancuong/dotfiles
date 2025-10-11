if ! is_installed pyenv; then
    echo "📦 Installing pyenv and its dependencies..."
    if is_installed pyenv; then
        echo "✓ pyenv installed successfully"
        echo "  Version: $(pyenv --version)"
        
        # Install latest Python version
        echo "📦 Installing Python 3.11 via pyenv..."
        pyenv install 3.11 --skip-existing
        pyenv global 3.11
        echo "✓ Python 3.11 installed and set as global"
    else
        echo "❌ Failed to install pyenv"
        exit 1
    fi
else
  print_package_version pyenv
fi
