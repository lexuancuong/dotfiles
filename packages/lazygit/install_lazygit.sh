SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! is_installed lazygit; then
    echo " 📦 Installing LazyGit..."
    brew install lazygit
fi
print_package_version lazygit
# Create LazyGit config directory
CUSTOM_LG_FILE="$SCRIPT_DIR/congig.yml"
SYSTEM_LG_FILE="$(lazygit --print-config-dir)"
create_symlink $CUSTOM_LG_FILE $SYSTEM_LG_FILE
