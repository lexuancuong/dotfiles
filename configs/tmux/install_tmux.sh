print_package_version tmux
TMUX_SETUP_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CUSTOM_TMUX_FILE=$TMUX_SETUP_DIR/tmux.conf
SYSTEM_TMUX_FILE="$HOME/.tmux.conf"
create_symlink $CUSTOM_TMUX_FILE $SYSTEM_TMUX_FILE
echo -e "${GREEN}   [i] Plesae restart with tmux shortcut: Prefix + I (capital i)"
