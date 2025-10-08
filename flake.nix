{
  description = "lexuancuong's personal profile flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    darwin.url = "github:lnl7/nix-darwin";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, darwin }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system} = {
        myProfile = pkgs.buildEnv {
          name = "my-profile";
          paths = with pkgs; [
            # Core CLI tools
            git
            neovim
            nushell
            tmux
            fzf
            bat
            ripgrep

            # Dev tools
            lazygit
            delta
            zoxide
            yazi
            pyenv
            nodejs
            python3
            uv

            # Theme
            starship

            # Terminals
            alacritty
            wezterm
          ];
        };
        default = self.packages.${system}.myProfile;
      };

      # nix-darwin configuration for macOS-specific apps
      darwinConfigurations.lexuancuong-mbp = darwin.lib.darwinSystem {
        inherit system;
        modules = [
          {
            # Homebrew for macOS-specific apps
            homebrew = {
              enable = true;
              casks = [
                "maccy"          # Clipboard manager
                "postman"        # API testing
                "ngrok"          # Tunneling
              ];
            };

            # System settings
            system.defaults = {
              dock.autohide = true;
              finder.AppleShowAllExtensions = true;
            };
          }
        ];
      };
    };
}
