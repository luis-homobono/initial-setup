# Only attempt to set configuration if Neovim has never been run
if [[ ! -d "$HOME/.config/nvim" ]]; then
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git

  mkdir -p ~/.config/nvim/plugin/after
  cp ~/.local/share/initial-setup/configs/neovim/transparency.lua ~/.config/nvim/plugin/after/

  cp ~/.local/share/initial-setup/configs/neovim/snacks-animated-scrolling-off.lua ~/.config/nvim/lua/plugins/

  echo "vim.opt.relativenumber = false" >>~/.config/nvim/lua/config/options.lua

  cp ~/.local/share/initial-setup/configs/neovim/lazyvim.json ~/.config/nvim/
fi
