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
      user = "cuongle";
      hostname = "lexuancuong-mbp";
    in
    {
      # Simple package profile for CLI tools
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

            # Note: Terminal GUI apps (wezterm, alacritty) managed via Homebrew in darwin config
          ];
        };
        default = self.packages.${system}.myProfile;
      };

      # nix-darwin configuration for macOS system settings and GUI apps
      darwinConfigurations.${hostname} = darwin.lib.darwinSystem {
        inherit system;
        modules = [
          # Import our darwin configuration
          ./darwin

          # User and system configuration
          ({ pkgs, ... }: {
            # Allow unfree packages (needed for some Homebrew casks)
            nixpkgs.config.allowUnfree = true;

            # System configuration
            system = {
              stateVersion = 5;
              configurationRevision = self.rev or self.dirtyRev or null;
            };

            # User configuration
            users.users.${user} = {
              home = "/Users/${user}";
              shell = pkgs.nushell;
            };

            # Networking
            networking = {
              computerName = hostname;
              hostName = hostname;
              localHostName = hostname;
            };

            # Nix configuration
            nix = {
              package = pkgs.nix;
              settings = {
                experimental-features = [ "nix-command" "flakes" ];
                warn-dirty = false;
                auto-optimise-store = false; # Can cause issues on macOS
              };
            };
          })
        ];
      };
    };
}
