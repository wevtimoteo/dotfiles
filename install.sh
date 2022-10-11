#!/bin/bash

files=( ackrc bashrc irbrc bash_aliases vim vimrc git-completion.sh gitconfig gitignore_global gemrc tmux.conf pryrc tmux )

for filename in ${files[@]}
do
  [[ -s $HOME/.$filename ]] && rm $HOME/.$filename
  ln -sf $PWD/$filename ~/.$filename
done

sudo ln -fs $PWD/git-edit ~/.local/bin/
ln -sf ~/.vim ~/.config/nvim

source ~/.bashrc
