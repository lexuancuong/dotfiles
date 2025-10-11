if ! grep -q "fzf" ~/.zshrc; then
  $(brew --prefix)/opt/fzf/install --all
fi
