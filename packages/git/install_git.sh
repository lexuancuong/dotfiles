SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! is_installed git; then
  echo " Installing Git..."
  brew install git
fi

print_package_version git
