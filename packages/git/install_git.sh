SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0;  }
  # return
  echo "$return_"
}

if [ "$(is_installed git)" == "0" ]; then
  echo "Installing Git"
  brew install git
  echo "✓ Git has been installed"
else
  echo "✓ Git has been installed"
  echo "  Version: $(git --version)"
fi
