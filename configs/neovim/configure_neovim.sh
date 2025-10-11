#!/usr/bin/env bash
set -e

CONFIG_DIR="$HOME/.config/nvim"

if [ ! -d "$CONFIG_DIR" ]; then
  echo "🔹 Cloning Neovim config..."
  git clone https://github.com/lexuancuong/nvim.git "$CONFIG_DIR"
fi

echo "🔹 Installing missing Neovim plugins..."
nvim --headless "+Lazy! install" +qa
