did_brew_install() {
    brew list | grep -q "$1"
}
