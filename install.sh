#!/bin/bash

files=( ackrc bashrc irbrc alias vim vimrc git-completion.sh gitconfig gitignore_global gemrc tmux.conf pryrc tmux spacemacs hub.bash_completion.sh)

for filename in ${files[@]}
do
  [[ -s $HOME/.$filename ]] && rm $HOME/.$filename
  ln -s $PWD/$filename ~/.$filename
done

sudo ln -fs $PWD/git-edit /usr/local/bin/git-edit
sudo ln -fs $PWD/capssh /usr/local/bin/capssh
sudo ln -fs $PWD/capcssh /usr/local/bin/capcssh

source ~/.bashrc
