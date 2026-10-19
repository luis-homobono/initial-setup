#!/bin/bash

if [[ $OS == "macos" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo >>~/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew upgrade
  brew install curl git
  brew cleanup
  brew doctor
elif [[ $OS == "debian" ]]; then
  sudo apt update
  sudo apt -y upgrade
  sudo apt install -y curl git unzip
elif [[ $OS == "arch" ]]; then
  sudo pacman -Syu --noconfirm
  sudo pacman -S --noconfirm curl git unzip
elif [[ $OS == "fedora" ]]; then
  sudo dnf upgrade --refresh
fi

source ~/.local/share/initial-setup/install/required.sh
source ./install/required.sh

# Run terminal installers
TARGET_DIR=".local/share/initial-setup/install/terminal/$OS"

shopt -s nullglob
for installer in "$TARGET_DIR"/*.sh; do
  source "$installer"
done
shopt -u nullglob

source ~/.local/share/initial-setup/install/set-neovim.sh
