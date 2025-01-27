if ! is_installed bat; then
  echo " Installing bat - alternative for cat"
  brew install bat
fi
print_package_version bat
