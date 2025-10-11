if ! is_installed brew; then
  echo " Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo >> /Users/lexuancuong/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/lexuancuong/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
print_package_version brew
