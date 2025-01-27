apt-get update -y && apt-get upgrade -y
echo "Starting system update and upgrade..."
echo "✓ System update and upgrade completed"

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
source "utils/is_install.sh"
if [ "$(is_installed zsh-completions)" == "0" ]; then
  echo "Starting zsh-completions installation..."
  apt-get install zsh
  echo "✓ zsh-completions installed successfully"
fi

if [ "$(is_installed ag)" == "0" ]; then
  echo "Starting The Silver Searcher (ag) installation..."
  apt install silversearcher-ag
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
  apt install bat
  echo "✓ bat installed successfully"
fi

if [ "$(is_installed tmux)" == "0" ]; then
  echo "Starting tmux installation..."
  apt install tmux
  echo "✓ tmux installed successfully"
  echo "Starting tmux-plugin-manager installation..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo "✓ tmux-plugin-manager installed successfully"
fi

if [ "$(is_installed git)" == "0" ]; then
  echo "Starting Git installation..."
  apt install git
  echo "✓ Git installed successfully"
fi

if [ "$(is_installed nvim)" == "0" ]; then
  echo "Starting Neovim installation..."
  add-apt-repository ppa:neovim-ppa/unstable
  apt-get install neovim
  echo "✓ Neovim installed successfully"
  if [ "$(is_installed pip3)" == "1" ]; then
    echo "Starting Neovim Python provider installation..."
    pip3 install neovim --upgrade
    echo "✓ Neovim Python provider installed successfully"
  fi
fi
