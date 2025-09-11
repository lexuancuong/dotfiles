did_app_install() {
    local app_name="$1"
    
    # Check brew formulae
    if brew list | grep -q "$app_name"; then
        return 0
    fi
    
    # Check brew casks
    if brew list --cask | grep -q "$app_name"; then
        return 0
    fi
    
    # Check Applications folder (case-insensitive)
    if ls /Applications | grep -iq "$app_name"; then
        return 0
    fi
    
    return 1
}