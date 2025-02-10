function create_symlink() {
    local source=$1
    local target=$2
    # Handle existing target
    if [ -L "$target" ]; then
        echo -e "${YELLOW}  📁 Removing existing symlink ${target}${NC}"
        rm -f "$target"
    elif [ -f "$target" ]; then
        echo -e "${YELLOW}  📁 Backing up existing file ${target}${NC}"
        if ! mv "$target" "${target}.backup"; then
            echo -e "${RED}  ❌ Failed to backup ${target}${NC}"
            return 1
        fi
    fi

    # Create the symlink
    if ! ln -s "$source" "$target"; then
        echo -e "${RED}  ❌ Failed to create symlink from ${source} to ${target}${NC}"
        return 1
    fi
    
    echo -e "${GREEN}  ✓ Created symlink: ${target} -> ${source}${NC}"
}
