if ! did_brew_install "zoxide" ; then
  echo "📦  Installing zoxide"
  brew install zoxide
fi

print_package_version z
