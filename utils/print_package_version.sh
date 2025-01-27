function clean_version() {
    local raw_version="$1"
    local cmd="$2"
    
    case "$cmd" in
        "rg") echo "$raw_version" | head -n1 | sed 's/ripgrep \([0-9.]*\).*/\1/' ;;
        "nvim") echo "$raw_version" | head -n1 | sed 's/NVIM v\([0-9.]*\).*/\1/' ;;
        "git") echo "$raw_version" | sed 's/git version \([0-9.]*\).*/\1/' ;;
        *) echo "$raw_version" | head -n1 | grep -o '[0-9.]\+' | head -n1 ;;
    esac
}

function get_version() {
    local cmd=$1
    if [[ -n "${VERSION_COMMANDS[$cmd]}" ]]; then
        if version=$(eval "${VERSION_COMMANDS[$cmd]}" 2>/dev/null); then
            echo $(clean_version "$version" "$cmd")
            return 0
        fi
    fi
    for flag in "--version" "-v" "-V" "version"; do
        if version=$($cmd $flag 2>/dev/null); then
            echo $(clean_version "$version" "$cmd")
            return 0
        fi
    done
    echo "Version unknown"
    return 1
}

function print_package_version() {
    local package=$1
    local max_length=15
    printf " ${GREEN}✓${NC} ${BLUE}${BOLD}%s${NC}%-$((max_length - ${#package}))s${GRAY}%s${NC}\n" \
           "$package" "" "$(get_version "$package")"
}
