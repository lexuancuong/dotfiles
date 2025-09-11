if ! did_app_install alacritty; then
  echo "📦  Installing alacritty"
  brew install --cask alacritty
fi

print_package_version alacritty

ALACRITTY_SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CUSTOM_ALACRITTY_CONFIG=$ALACRITTY_SETUP_DIR/alacritty.toml
SYSTEM_ALACRITTY_CONFIG="$HOME/.config/alacritty/alacritty.toml"
create_symlink $CUSTOM_ALACRITTY_CONFIG $SYSTEM_ALACRITTY_CONFIG
