if ! did_brew_install "ngrok" ; then
  echo "📦  Installing ngrok"
  brew install ngrok
fi

print_package_version ngrok
