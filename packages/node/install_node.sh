if ! is_installed node; then
    echo " 📦 Installing Node..."
    brew install node
fi
print_package_version node
