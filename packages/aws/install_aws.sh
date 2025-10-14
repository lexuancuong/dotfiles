#!/bin/bash
set -e

# Check if AWS CLI is already installed
if command -v aws &> /dev/null; then
    echo "AWS CLI is already installed. Skipping installation."
else
    echo "Installing AWS CLI..."
    curl -s "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
    sudo installer -pkg AWSCLIV2.pkg -target /
    echo "AWS CLI installation complete."
fi
