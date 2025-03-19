if ! did_brew_install "postman"; then
  echo -e "${GREEN} Install Postman..."
  brew install --cask postman
fi
echo -e "       ${GREEN} Installed Postman"
