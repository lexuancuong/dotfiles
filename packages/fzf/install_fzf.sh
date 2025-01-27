if ! is_installed fzf; then
  echo " Installing fzf..."
  brew install fzf
  $(brew --prefix)/opt/fzf/install --all
fi
print_package_version fzf
