ln -fs /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
export DEBIAN_FRONTEND=noninteractive
echo "Starting system update and upgrade..."
apt-get update -y && apt-get upgrade -y
echo "✓ System update and upgrade completed"

function is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0;  }
  # return
  echo "$return_"
}

echo "Starting installation of necessary utilities..."
apt-get install -y \
  python3-dev \
  git \
  libncurses5-dev \
  unzip \
  libxt-dev \
  libx11-dev \
  libxtst-dev \
  build-essential \
  cmake \
  ninja-build \
  gettext \
  libtool \
  libtool-bin \
  autoconf \
  automake \
  g++ \
  pkg-config \
  curl \
  wget
echo "✓ Base utilities installation completed"
if [ "$(is_installed zsh-completions)" == "0" ]; then
  echo "Starting zsh-completions installation..."
  apt-get install zsh -y
  echo "✓ zsh-completions installed successfully"
fi

if [ "$(is_installed ag)" == "0" ]; then
  echo "Starting The Silver Searcher (ag) installation..."
  apt install silversearcher-ag -y
  echo "✓ The Silver Searcher (ag) installed successfully"
fi

if [ "$(is_installed fzf)" == "0" ]; then
  echo "Starting fzf installation..."
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  bash ~/.fzf/install --all
  echo "✓ fzf installed successfully"
fi

if [ "$(is_installed bat)" == "0" ]; then
  echo "Starting bat installation (alternative for cat)..."
  apt install bat -y
  echo "✓ bat installed successfully"
fi

if [ "$(is_installed lazygit)" == "0" ]; then
  echo "Starting lazygit installation..."
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
  tar xf lazygit.tar.gz lazygit
  install lazygit -D -t /usr/local/bin/
  echo "✓ lazygit installed successfully"
fi

if [ "$(is_installed tmux)" == "0" ]; then
  echo "Starting tmux installation..."
  apt install tmux -y
  echo "✓ tmux installed successfully"
  echo "Starting tmux-plugin-manager installation..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo "✓ tmux-plugin-manager installed successfully"
fi

if [ "$(is_installed git)" == "0" ]; then
  echo "Starting Git installation..."
  apt install git -y
  echo "✓ Git installed successfully"
fi

if [ "$(is_installed nvim)" == "0" ]; then
  echo "Starting Neovim installation..."
  add-apt-repository ppa:neovim-ppa/unstable
  apt-get install neovim -y
  echo "✓ Neovim installed successfully"
  if [ "$(is_installed pip3)" == "1" ]; then
    echo "Starting Neovim Python provider installation..."
    pip3 install neovim --upgrade
    echo "✓ Neovim Python provider installed successfully"
  fi
fi

if [ "$(is_installed pyenv)" == "0" ]; then
  echo "Starting pyenv installation..."
  # Install pyenv dependencies
  apt-get install -y make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
  
  # Add pyenv to PATH (temporary for this session)
  export PYENV_ROOT="$HOME/.pyenv"
  if [ -e "$PYENV_ROOT" ] || [ -L "$PYENV_ROOT" ]; then
    echo "   Removing existing Pyenv config at $PYENV_ROOT"
    rm -rf "$PYENV_ROOT"
  fi
  # Install pyenv
  curl https://pyenv.run | bash
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  
  echo "✓ pyenv installed successfully"
fi

echo "Installing oh-my-zsh..."
source "configs/install_oh_my_zsh.sh"
install_oh_my_zsh 

source "configs/link_configs.sh"
echo "Starting configuration files linking process..."
link_configs
