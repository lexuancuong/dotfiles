#!/bin/bash
# set -e
# Utils
function is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0;  }
  # return
  echo "$return_"
}

function install_macos {
  if [[ $OSTYPE != darwin* ]]; then
    return
  fi
  echo "MacOS detected"
  xcode-select --install

  if [ "$(is_installed brew)" == "0" ]; then
    echo "Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  if [ $TERM_PROGRAM != "iTerm.app" ]; then
    echo "Installing iTerm2"
    brew tap caskroom/cask
    brew cask install iterm2
  fi

  if [ "$(is_installed zsh-completions)" == "0" ]; then
    echo "Installing zsh-completions"
    brew install zsh zsh-completions
  fi

  if [ "$(is_installed ag)" == "0" ]; then
    echo "Installing The silver searcher"
    brew install the_silver_searcher
  fi

  if [ "$(is_installed fzf)" == "0" ]; then
    echo "Installing fzf"
    brew install fzf
  fi

  if [ "$(is_installed bat)" == "0" ]; then
    echo "Installing bat - alternative for cat"
    brew install bat
  fi

  if [ "$(is_installed tmux)" == "0" ]; then
    echo "Installing tmux"
    brew install tmux
    echo "Installing reattach-to-user-namespace"
    brew install reattach-to-user-namespace
    echo "Installing tmux-plugin-manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi

  if [ "$(is_installed git)" == "0" ]; then
    echo "Installing Git"
    brew install git
  fi

  if [ "$(is_installed node)" == "0" ]; then
    echo "Installing Node"
    brew install node
  fi

  if [ "$(is_installed nvim)" == "0" ]; then
    echo "Install neovim"
    brew install neovim
    if [ "$(is_installed pip3)" == "1" ]; then
      pip3 install neovim --upgrade
    fi
  fi
  $(brew --prefix)/opt/fzf/install --all
}

function install_ubuntu {
  echo "Ubuntu detected"
  sudo apt-get update -y && sudo apt-get upgrade -y
  echo "Install necessary utilities"
  sudo apt-get install -y \
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

  if [ "$(is_installed zsh-completions)" == "0" ]; then
    echo "Installing zsh-completions"
    sudo apt-get install zsh
  fi

  if [ "$(is_installed ag)" == "0" ]; then
    echo "Installing The silver searcher"
    sudo apt install silversearcher-ag
  fi

  if [ "$(is_installed fzf)" == "0" ]; then
    echo "Installing fzf"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    bash ~/.fzf/install --all
  fi

  if [ "$(is_installed bat)" == "0" ]; then
    echo "Installing bat - alternative for cat"
    sudo apt install bat
  fi

  if [ "$(is_installed tmux)" == "0" ]; then
    echo "Installing tmux"
    sudo apt install tmux
    echo "Installing tmux-plugin-manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi

  if [ "$(is_installed git)" == "0" ]; then
    echo "Installing Git"
    sudo apt install git
  fi

  if [ "$(is_installed nvim)" == "0" ]; then
    echo "Install neovim"
    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get install neovim
    if [ "$(is_installed pip3)" == "1" ]; then
      pip3 install neovim --upgrade
    fi
    # Install plug for install plugin in vim
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  fi
}

function install_oh_my_zsh {

  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

  if [ ! -d "$zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo "Installing zsh-autosuggestions for oh-my-zsh"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  fi

}
function install_git_diff {
  # Use git diff split for easier looking
  apt install nodejs npm
  npm install -g git-split-diffs
  git config --global core.pager "git-split-diffs --color | less -RFX"
  git config split-diffs.theme-name dark
}

function link_dotfiles {
  echo "Linking dotfiles"

  ln -sf $(pwd)/tmux.conf ~/.tmux.conf
  ln -sf $(pwd)/vim ~/.vim
  ln -sf $(pwd)/vimrc ~/.vimrc
  ln -sf $(pwd)/vim/general.vimrc ~/general.vimrc
  ln -sf $(pwd)/vim/plug_list.vimrc ~/plug_list.vimrc
  ln -sf $(pwd)/vim/plug_config.vimrc ~/plug_config.vimrc
  ln -sf $(pwd)/vim/key.vimrc ~/key.vimrc
  ln -sf $(pwd)/.tern-project ~/.tern-project # use for YCM

  # Link with global vim and execute all relative files
  rm -rf $HOME/.config/nvim/init.vim
  rm -rf $HOME/.config/nvim
  rm -rf $HOME/.zshrc
  ln -s $(pwd)/zshrc $HOME/.zshrc
  mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
  ln -s $(pwd)/vim $XDG_CONFIG_HOME/nvim
  ln -s $(pwd)/vimrc $XDG_CONFIG_HOME/nvim/init.vim
  
  # Use git diff split for easier looking
#  npm install -g git-split-diffs
#  git config --global core.pager "git-split-diffs --color | less -RFX"
#  git config split-diffs.theme-name dark
}

while test $# -gt 0; do 
  case "$1" in
    --help)
      echo "Help"
      exit
      ;;
    --macos)
      install_macos
      install_oh_my_zsh
      link_dotfiles
      zsh
      source ~/.zshrc #TODO: DRY VIOLATION
      exit
      ;;
    --ubuntu)
      install_ubuntu
      install_oh_my_zsh
      link_dotfiles
      zsh
      source ~/.zshrc
      exit
      ;;
    --git_diff)
      install_git_diff
      source ~/.zshrc
      exit
      ;;
    --link_dotfiles)
      link_dotfiles
      source ~/.zshrc
      exit
      ;;
  esac

  shift
done
