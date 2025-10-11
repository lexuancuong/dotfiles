SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

print_package_version lazygit
# Create LazyGit config directory
CUSTOM_LG_FILE="$SCRIPT_DIR/config.yml"
SYSTEM_LG_FILE="$(lazygit --print-config-dir)/config.yml"
create_symlink "$CUSTOM_LG_FILE" "$SYSTEM_LG_FILE"
