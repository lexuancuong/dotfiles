is_installed() {
    command -v "$1" >/dev/null 2>&1
}
if [ "$(is_installed brew)" == "0" ]; then
  echo "Installing Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "✓ brew is already installed"
    echo "  Version: $(brew --version)"
fi

