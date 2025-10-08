# Nushell Configuration
# Migrated from zsh configuration

# ============================================================================
#                                   Environment
# ============================================================================

$env.EDITOR = "nvim"
$env.LANG = "en_US.UTF-8"
$env.GPG_TTY = (tty)

# FZF Configuration
$env.FZF_DEFAULT_COMMAND = 'ag -g ""'
$env.FZF_DEFAULT_OPTS = '--height 40% --reverse --border'

# ============================================================================
#                                   Vi Mode & Keybindings
# ============================================================================

$env.config = {
  show_banner: false
  edit_mode: vi  # Enable vi mode (equivalent to zsh-vi-mode)

  # Better completions (equivalent to zsh-completions)
  completions: {
    case_sensitive: false
    quick: true
    partial: true
    algorithm: "fuzzy"
  }

  # History configuration (equivalent to zsh history settings)
  history: {
    max_size: 10000
    sync_on_enter: true
    file_format: "sqlite"
  }

  # Shell behavior
  shell_integration: true
  use_kitty_protocol: false
  highlight_resolved_externals: true

  # Cursor shapes for vi mode
  cursor_shape: {
    vi_insert: line
    vi_normal: block
  }
}

# ============================================================================
#                                   Aliases
# ============================================================================

# Docker (equivalent to docker plugin)
alias dc = docker compose

# Neovim
alias vim = nvim
alias vi = nvim

# Python
alias python = python3

# System
alias reload = source ~/.config/nushell/config.nu

# Git (equivalent to git plugin aliases)
alias gl = git log --graph --oneline --decorate --all
alias lg = lazygit
alias gsync = git checkout master; git fetch upstream; git rebase upstream/master; git push

# ============================================================================
#                                   Integrations
# ============================================================================

# Starship prompt (replaces oh-my-posh)
mkdir ~/.cache/starship
starship init nu | save -f ~/.cache/starship/init.nu
use ~/.cache/starship/init.nu

# Zoxide (smart cd - replaces traditional cd)
zoxide init nushell | save -f ~/.zoxide.nu
source ~/.zoxide.nu

# FZF integration (equivalent to fzf plugin)
# Note: fzf works with nushell but you may want to use nu's built-in filter commands

# Load secrets if exists
if ("~/.nu_secrets" | path expand | path exists) {
  source ~/.nu_secrets
}

# ============================================================================
#                                   Functions
# ============================================================================

# Custom functions can be added here
# Example: function to quickly switch projects
def projects [] {
  ls ~/projects | get name
}
