#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "Installation failed! You can retry by running: source ~/.local/share/initial-setup/install.sh"' ERR

# Check the distribution name and version and abort if incompatible
source ~/.local/share/initial-setup/install/check-version.sh

echo "Get ready to make a few choices..."
source ~/.local/share/initial-setup/install/first-run-choices.sh
source ~/.local/share/initial-setup/install/identification.sh

echo "Installing terminal and tools..."
source ~/.local/share/initial-setup/install/terminal.sh
