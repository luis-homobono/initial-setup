#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Configure the bash shell using defaults
[[ -f ~/.zhsrc ]] && mv ~/.zshrc ~/.zshrc.bak
cp ~/.local/share/initial-setup/configs/zshrc ~/.zshrc

# Load the PATH for use later in the installers
source ~/.local/share/initial-setup/defaults/zsh/shell
