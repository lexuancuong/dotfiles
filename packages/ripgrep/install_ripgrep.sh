if ! is_installed rg; then
  echo "📦  Installing Ripgrep"
  brew install ripgrep
fi

print_package_version rg

