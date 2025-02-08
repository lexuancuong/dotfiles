if ! is_installed delta; then
  echo " Installing Git Delta..."
  brew install git-delta
fi
print_package_version brew
