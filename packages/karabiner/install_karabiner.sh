KARABINER_SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CUSTOM_KARABINER_CONFIG=$KARABINER_SETUP_DIR/karabiner.json
mkdir -p $HOME/.config/karabiner/
SYSTEM_KARABINER_CONFIG="$HOME/.config/karabiner/karabiner.json"
create_symlink $CUSTOM_KARABINER_CONFIG $SYSTEM_KARABINER_CONFIG

