did_brew_install() {
    brew list | grep -q "$1" || brew list --cask | grep -q "$1"
}
