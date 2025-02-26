if ! did_brew_install "flameshot"; then
  echo -e "${GREEN} Install flameshot..."
  brew install --cask flameshot
fi
