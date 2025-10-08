# Darwin Configuration

This directory contains nix-darwin configuration for macOS system settings and Homebrew apps.

## Files

- **`default.nix`**: System-wide settings (dock, finder, keyboard, fonts, Touch ID)
- **`homebrew.nix`**: GUI applications managed by Homebrew

## Usage

The configuration automatically detects your username and hostname, so it works on any Mac without modification.

### Apply Configuration

```bash
# First time setup
make darwin-setup

# Apply changes after editing configs
make darwin-switch

# Build without applying (test)
make darwin-build
```

## Adding Custom Configurations

### For Specific Machines

If you want different configurations for different machines, edit `flake.nix`:

```nix
darwinConfigurations = {
  # Default configuration - uses current user and hostname
  default = mkDarwinConfiguration {
    user = builtins.getEnv "USER";
    hostname = builtins.getEnv "HOSTNAME";
  };

  # Custom configuration for work laptop
  work-mbp = mkDarwinConfiguration {
    user = "yourname";
    hostname = "work-mbp";
  };

  # Custom configuration for personal laptop
  personal-mbp = mkDarwinConfiguration {
    user = "yourname";
    hostname = "personal-mbp";
  };
};
```

Then use:
```bash
darwin-rebuild switch --flake .#work-mbp
darwin-rebuild switch --flake .#personal-mbp
```

## Adding GUI Apps

Edit `homebrew.nix` and add apps to the `casks` list:

```nix
casks = [
  # ... existing apps
  "your-new-app"
  "another-app"
];
```

Then run:
```bash
make darwin-switch
```

The `cleanup = "zap"` setting will automatically remove any apps not in the list.

## System Settings

All macOS system preferences are in `default.nix`. Common customizations:

- **Dock**: Position, autohide, size
- **Finder**: Show hidden files, extensions, default view
- **Keyboard**: Key repeat rate, caps lock remapping
- **Trackpad**: Tap to click, gestures
- **Fonts**: Nerd Fonts for terminal use

Edit these settings and run `make darwin-switch` to apply.
