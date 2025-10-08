.PHONY: help install build update clean darwin-setup darwin-switch darwin-build

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: build ## Install dotfiles (build Nix packages and run dotbot)
	./install

build: ## Build Nix packages
	nix build

profile-install: build ## Install Nix packages to profile
	nix profile install .

update: ## Update Nix flake dependencies
	nix flake update
	nix build

upgrade: update ## Update and upgrade Nix profile packages
	nix profile upgrade '.*'

darwin-setup: ## First-time nix-darwin setup (installs GUI apps and system settings)
	nix run nix-darwin -- switch --flake .#default

darwin-switch: ## Apply darwin configuration changes (after first setup)
	darwin-rebuild switch --flake .#default

darwin-build: ## Build darwin configuration without applying
	darwin-rebuild build --flake .#default

clean: ## Clean Nix build artifacts
	rm -rf result

nushell: ## Set Nushell as default shell
	@echo "Adding nushell to /etc/shells..."
	@which nu | sudo tee -a /etc/shells
	@echo "Changing default shell to nushell..."
	@chsh -s $$(which nu)
	@echo "✓ Nushell is now your default shell. Restart your terminal."

tmux-plugins: ## Install tmux plugin manager
	@if [ ! -d ~/.tmux/plugins/tpm ]; then \
		git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; \
		echo "✓ TPM installed. Open tmux and press prefix + I to install plugins"; \
	else \
		echo "✓ TPM already installed"; \
	fi

pyenv-setup: ## Setup Python with pyenv
	@echo "Installing Python 3.11.9..."
	pyenv install -s 3.11.9
	pyenv global 3.11.9
	@echo "✓ Python 3.11.9 installed and set as global"

full-setup: profile-install install gui tmux-plugins ## Complete setup: Install everything
	@echo ""
	@echo "======================================"
	@echo "✓ Setup complete!"
	@echo "======================================"
	@echo ""
	@echo "Next steps:"
	@echo "  1. Run 'make nushell' to set Nushell as default shell"
	@echo "  2. Run 'make pyenv-setup' to install Python"
	@echo "  3. Restart your terminal"
	@echo "  4. Launch WezTerm or Alacritty"
