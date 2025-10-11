#!/usr/bin/env bash
set -euo pipefail

# === Configuration ===
SSH_DIR="$HOME/.ssh"
KEY_NAME="id_ed25519"
EMAIL="${EMAIL:-$(git config --global user.email)}"
KEY_PATH="$SSH_DIR/$KEY_NAME"

generate_ssh_key() {
  echo "🔑 No SSH key found. Generating a new one for $EMAIL..."
  mkdir -p "$SSH_DIR"
  chmod 700 "$SSH_DIR"

  ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_PATH" -N ""

  # Add to SSH agent if running
  if pgrep -u "$USER" ssh-agent >/dev/null 2>&1; then
    eval "$(ssh-agent -s)" >/dev/null
    ssh-add "$KEY_PATH"
  fi

  echo "✅ SSH key generated at: $KEY_PATH"
  echo "👉 Public key:"
  cat "$KEY_PATH.pub"
}

# === Main ===
if [[ -f "$KEY_PATH" && -f "$KEY_PATH.pub" ]]; then
  echo "✅ SSH key already exists at $KEY_PATH — skipping generation."
else
  generate_ssh_key
fi
