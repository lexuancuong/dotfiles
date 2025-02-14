if ! did_brew_install maccy; then
  echo "Installing maccy..."
  brew install maccy
fi
print_package_version maccy
