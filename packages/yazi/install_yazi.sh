if ! did_brew_install "yazi" ; then
  echo "📦  Installing yazi"
  brew install yazi
fi

print_package_version yazi

ya pack -a BennyOe/tokyo-night || true

YAZI_SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CUSTOM_YAZI_THEME=$YAZI_SETUP_DIR/config/theme.toml
SYSTEM_YAZI_THEME="$HOME/.config/yazi/theme.toml"
create_symlink $CUSTOM_YAZI_THEME $SYSTEM_YAZI_THEME

CUSTOM_YAZI=$YAZI_SETUP_DIR/config/yazi.toml
SYSTEM_YAZI="$HOME/.config/yazi/yazi.toml"
create_symlink $CUSTOM_YAZI $SYSTEM_YAZI
