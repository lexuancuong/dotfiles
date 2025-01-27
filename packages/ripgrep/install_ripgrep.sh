if [ "$(is_installed rg)" == "0" ]; then
  echo " Installing Ripgrep"
  brew install ripgrep
fi

print_package_version rg

