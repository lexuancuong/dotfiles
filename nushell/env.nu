# Nushell Environment Configuration
# Migrated from zsh PATH and environment setup

# ============================================================================
#                                   PATH Setup
# ============================================================================

# Base PATH - prepend custom paths
$env.PATH = (
  $env.PATH
  | split row (char esep)
  | prepend "/opt/homebrew/bin"
  | prepend ($env.HOME | path join ".local" "bin")
  | prepend "/usr/local/bin"
  | uniq
)

# Python tools (pyenv)
$env.PYENV_ROOT = ($env.HOME | path join ".pyenv")
$env.PATH = (
  $env.PATH
  | split row (char esep)
  | prepend ($env.PYENV_ROOT | path join "bin")
  | prepend ($env.HOME | path join ".poetry" "bin")
  | uniq
)

# Initialize pyenv
if (which pyenv | is-not-empty) {
  $env.PYENV_SHELL = "nu"
  # Note: Full pyenv integration requires running: pyenv init - | save -f ~/.pyenv.nu
  # Then add: source ~/.pyenv.nu in this file
}

# Java
$env.JAVA_HOME = "/opt/homebrew/opt/openjdk@17"
$env.PATH = (
  $env.PATH
  | split row (char esep)
  | prepend ($env.JAVA_HOME | path join "bin")
  | prepend "/opt/homebrew/opt/icu4c/bin"
  | uniq
)

# Volta (Node version manager) - before Homebrew due to nodejs priority
$env.VOLTA_HOME = ($env.HOME | path join ".volta")
$env.PATH = (
  $env.PATH
  | split row (char esep)
  | prepend ($env.VOLTA_HOME | path join "bin")
  | uniq
)

# PostgreSQL
$env.PATH = (
  $env.PATH
  | split row (char esep)
  | prepend "/opt/homebrew/opt/postgresql@15/bin"
  | prepend "/opt/homebrew/opt/npm/bin"
  | uniq
)

# ============================================================================
#                                   Additional Environment
# ============================================================================

# Docker completions path (if Docker Desktop is installed)
let docker_completions = ($env.HOME | path join ".docker" "completions")
if ($docker_completions | path exists) {
  # Docker completions are handled by nushell's completion system
}
