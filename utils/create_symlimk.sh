function create_symlink() {
    local source=$1
    local target=$2
    if [ -L "$target" ]; then
        echo -e "${YELLOW}  📁 Removing existing symlink ${target}${NC}"
        rm -f "$target"
    elif [ -f "$target" ]; then
        echo -e "${YELLOW}  📁 Backing up existing file ${target}${NC}"
        mv "$target" "${target}.backup"
    fi
    ln -s "$source" "$target"
    echo -e "${GREEN}  📁 Linked config from ${source} to ${target}${NC}"
}
