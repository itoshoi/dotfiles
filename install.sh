#!/bin/bash

dir="${PWD}"

# ln in dotfiles directory
# for f in .??*
# do
# 	[[ "$f" == ".git" ]] && continue
# 	[[ "$f" == ".DS_Store" ]] && continue
# 	[[ -d "$f" ]] && continue
# 
# 	ln -s $dir/"$f" ~/"$f"
# 
# 	echo "$f"
# done

# ln in other directory
# ln -s $dir/.config/fish/config.fish ~/.config/fish/config.fish
ln -s $dir/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -s $dir/.config/nvim/dein.toml ~/.config/nvim/dein.toml
ln -s $dir/.config/nvim/dein_lazy.toml ~/.config/nvim/dein_lazy.toml
ln -s $dir/.config/nvim/cheatsheet.md ~/.config/nvim/cheatsheet.md
