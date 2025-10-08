-- WezTerm Configuration
-- Similar look and feel to Alacritty with Tokyo Night Storm theme

local wezterm = require 'wezterm'
local config = {}

-- Use config builder for better error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- ============================================================================
--                                   Appearance
-- ============================================================================

-- Tokyo Night Storm color scheme
config.colors = {
  -- Background and foreground
  foreground = '#c0caf5',
  background = '#1a1b26',

  -- Cursor
  cursor_bg = '#c0caf5',
  cursor_fg = '#24283b',
  cursor_border = '#c0caf5',

  -- Selection
  selection_fg = 'none',
  selection_bg = '#364a82',

  -- Scrollbar
  scrollbar_thumb = '#414868',

  -- Split separators
  split = '#414868',

  -- ANSI colors
  ansi = {
    '#15161e', -- black
    '#f7768e', -- red
    '#9ece6a', -- green
    '#e0af68', -- yellow
    '#7aa2f7', -- blue
    '#bb9af7', -- magenta
    '#7dcfff', -- cyan
    '#a9b1d6', -- white
  },
  brights = {
    '#414868', -- bright black
    '#f7768e', -- bright red
    '#9ece6a', -- bright green
    '#e0af68', -- bright yellow
    '#7aa2f7', -- bright blue
    '#bb9af7', -- bright magenta
    '#7dcfff', -- bright cyan
    '#c0caf5', -- bright white
  },
}

-- Font configuration (matching Alacritty)
config.font = wezterm.font('FiraCode Nerd Font', { weight = 'Regular' })
config.font_size = 13.9
config.line_height = 1.2
config.cell_width = 1.0

-- Enable font features
config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }

-- Window appearance
config.window_padding = {
  left = 8,
  right = 8,
  top = 8,
  bottom = 8,
}

config.window_decorations = "RESIZE"  -- Native title bar with buttons
config.window_background_opacity = 0.7
config.macos_window_background_blur = 20

-- Tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true  -- macOS-style tabs
config.tab_bar_at_bottom = false

-- ============================================================================
--                                   Behavior
-- ============================================================================

-- Scrollback
config.scrollback_lines = 10000

-- Shell
config.default_prog = { '/opt/homebrew/bin/nu' }  -- Use nushell

-- Enable CSI u mode for better key handling
config.enable_csi_u_key_encoding = true

-- ============================================================================
--                                   Keybindings
-- ============================================================================

config.keys = {
  -- Split panes (similar to tmux)
  { key = '\\', mods = 'CTRL', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = '-', mods = 'CTRL', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },

  -- Navigate panes (vim-style)
  { key = 'h', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'j', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection 'Down' },
  { key = 'k', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'l', mods = 'CTRL', action = wezterm.action.ActivatePaneDirection 'Right' },

  -- Zoom pane
  { key = 'f', mods = 'CTRL', action = wezterm.action.TogglePaneZoomState },

  -- Close pane
  { key = 'w', mods = 'CTRL', action = wezterm.action.CloseCurrentPane { confirm = true } },
}

-- ============================================================================
--                                   Performance
-- ============================================================================

-- Enable GPU acceleration
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"

-- Animation
config.animation_fps = 60
config.max_fps = 60

return config
