{ ... }: {
  homebrew = {
    enable = true;

    global = {
      autoUpdate = false;
    };

    onActivation = {
      # Remove all apps not listed in casks/brews
      cleanup = "zap";
      autoUpdate = false;
      upgrade = false;
    };

    # CLI tools via Homebrew (when Nix version not preferred)
    brews = [
      # Add CLI tools here if needed
      # Example: "some-tool-not-in-nix"
    ];

    # GUI Applications
    casks = [
      # Terminal Emulators
      "wezterm"
      "alacritty"

      # Utilities
      "maccy"          # Clipboard manager

      # Development
      "postman"        # API testing

      # Networking
      "ngrok"          # Secure tunneling
    ];

    # Homebrew taps
    taps = [
    ];
  };
}
