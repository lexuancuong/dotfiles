if ! is_installed nvim; then
  echo " Install neovim"
  brew install neovim
  if is_installed pip3; then
    pip3 install neovim --upgrade
  fi
fi
print_package_version nvim
