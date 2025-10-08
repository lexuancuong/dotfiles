# Dotfiles

Personal development environment configuration managed with Nix and Dotbot.

## 🎯 Features

- **Nix Package Management**: Declarative CLI tool installation
- **Nushell**: Modern shell with vi mode, replacing zsh
- **Starship**: Cross-shell prompt theme
- **Dotbot**: Automated symlink management
- **nix-darwin**: Declarative macOS system configuration
- **Portable**: Works on any macOS machine without hardcoded usernames/hostnames

## 📦 Included Tools

### CLI Tools (via Nix)
- **Shell**: nushell, starship
- **Editor**: neovim
- **Version Control**: git, lazygit, delta
- **File Management**: yazi, fzf, bat, ripgrep, zoxide
- **Terminal**: tmux
- **Development**: pyenv, nodejs, python3, uv

### GUI Applications (via Homebrew)
- **Terminals**: WezTerm, Alacritty
- **Utilities**: Maccy (clipboard manager)
- **Development**: Postman (API testing), ngrok (tunneling)

## 🚀 Installation

### Prerequisites
- macOS
- [Nix package manager](https://nixos.org/download.html)

### Quick Start

1. **Clone this repository:**
   ```bash
   git clone <your-repo-url> ~/.config/dotfiles
   cd ~/.config/dotfiles
   ```

2. **Install CLI tools via Nix:**
   ```bash
   nix build
   nix profile install .
   ```

3. **Install GUI apps and system settings via nix-darwin:**
   ```bash
   make darwin-setup
   ```

   This will:
   - Automatically detect your username and hostname
   - Install Homebrew (if needed)
   - Install GUI applications (WezTerm, Alacritty, Maccy, Postman, ngrok)
   - Apply macOS system settings (dock, finder, keyboard, etc.)
   - Set up fonts
   - Configure nushell as your shell

   **Note:** First-time setup may take a while and will ask for sudo password.

4. **Create dotfile symlinks:**
   ```bash
   ./install
   ```

   This will:
   - Create symlinks for all configuration files
   - Initialize Starship and Zoxide for Nushell

5. **Set Nushell as default shell:**
   ```bash
   make nushell
   # Or manually:
   echo $(which nu) | sudo tee -a /etc/shells
   chsh -s $(which nu)
   ```

6. **Install tmux plugin manager:**
   ```bash
   make tmux-plugins
   ```

7. **Restart your terminal**

## 📁 Structure

```
dotfiles/
├── flake.nix              # Nix package definitions
├── flake.lock             # Locked dependencies
├── install                # Dotbot installer script
├── install.conf.yaml      # Dotbot configuration
├── darwin/                # macOS-specific configurations (nix-darwin)
│   ├── default.nix        # System settings and preferences
│   └── homebrew.nix       # Homebrew apps (casks/brews)
├── git/
│   └── gitconfig          # Git configuration
├── nushell/
│   ├── config.nu          # Shell configuration
│   └── env.nu             # Environment variables & PATH
├── starship/
│   └── starship.toml      # Prompt configuration
├── tmux/
│   └── tmux.conf          # Tmux configuration
├── alacritty/
│   └── alacritty.toml     # Alacritty terminal config
├── wezterm/
│   └── wezterm.lua        # WezTerm terminal config
├── lazygit/
│   └── config.yml         # Lazygit configuration
└── yazi/                  # File manager configs
    ├── yazi.toml
    └── theme.toml
```

## 🔧 Post-Installation

### Python Setup (via pyenv)
```bash
pyenv install 3.11.9
pyenv global 3.11.9
```

### Tmux Plugin Installation
1. Open tmux: `tmux`
2. Press `prefix + I` (Ctrl+t, then Shift+I) to install plugins

### Configure Git
Update `git/gitconfig` with your email and GPG key:
```bash
git config --global user.email "your.email@example.com"
git config --global user.signingkey "YOUR_GPG_KEY"
```

## 🎨 Customization

### Nushell
- Edit `nushell/config.nu` for shell settings and aliases
- Edit `nushell/env.nu` for environment variables and PATH

### Starship Prompt
- Edit `starship/starship.toml` to customize prompt appearance

### Terminal
- **WezTerm**: Edit `wezterm/wezterm.lua`
- **Alacritty**: Edit `alacritty/alacritty.toml`

### macOS System Settings
- Edit `darwin/default.nix` to customize system preferences
- Changes apply automatically when you run `make darwin-switch`

### Adding New Packages

#### CLI Tools (Nix)
Edit `flake.nix` and add to the `paths` list:
```nix
paths = with pkgs; [
  # ... existing packages
  your-new-package
];
```

Then rebuild:
```bash
nix flake update
nix build
nix profile install .
```

#### GUI Apps (Homebrew via nix-darwin)
Edit `darwin/homebrew.nix` and add to the casks list:
```nix
casks = [
  # ... existing casks
  "your-app"  # Description
];
```

Then apply changes:
```bash
make darwin-switch
```

## 📝 Nushell Cheat Sheet

### Vi Mode
- Default mode: insert
- Press `Esc` for normal mode
- Press `i` for insert mode

### Key Differences from Bash/Zsh
- Structured data: Everything is tables/records
- Different syntax: `ls | where size > 1mb`
- Better error messages
- Built-in completions and syntax highlighting

### Common Commands
```bash
# Change directory (with zoxide)
z <directory>

# Find files
fd <pattern>

# Search content
rg <pattern>

# Interactive file manager
yazi

# Git UI
lazygit
```

## 🔄 Updating

### Update CLI tools:
```bash
cd ~/.config/dotfiles
nix flake update
nix build
nix profile upgrade '.*'
```

### Update GUI apps and system settings:
```bash
make darwin-switch
```

### Reapply dotfile symlinks:
```bash
./install
```

## 🐛 Troubleshooting

### Starship or Zoxide not working in Nushell
Make sure the init files are created:
```bash
mkdir -p ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
zoxide init nushell | save -f ~/.zoxide.nu
```

### GUI apps not appearing
Rebuild and apply darwin configuration:
```bash
make darwin-switch
```

### System settings not applying
First time setup:
```bash
make darwin-setup
```

Subsequent changes:
```bash
make darwin-switch
```

### Tmux plugins not loading
Install TPM and reload tmux:
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
```

## 📚 Resources

- [Nix Documentation](https://nixos.org/manual/nix/stable/)
- [Nushell Book](https://www.nushell.sh/book/)
- [Starship Configuration](https://starship.rs/config/)
- [WezTerm Configuration](https://wezfurlong.org/wezterm/config/files.html)
