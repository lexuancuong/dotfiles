print_package_version alacritty

ALACRITTY_SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CUSTOM_ALACRITTY_CONFIG=$ALACRITTY_SETUP_DIR/alacritty.toml
mkdir -p $HOME/.config/alacritty/
SYSTEM_ALACRITTY_CONFIG="$HOME/.config/alacritty/alacritty.toml"
create_symlink $CUSTOM_ALACRITTY_CONFIG $SYSTEM_ALACRITTY_CONFIG
