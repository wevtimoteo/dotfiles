#!/bin/bash

files=( ackrc bashrc irbrc alias vim vimrc git-completion.sh gitconfig gitignore_global gemrc tmux.conf pryrc tmux spacemacs gh.bash_completion.sh hyper.js )

for filename in ${files[@]}
do
  [[ -s $HOME/.$filename ]] && rm $HOME/.$filename
  ln -sf $PWD/$filename ~/.$filename
done

sudo ln -fs $PWD/git-edit /usr/local/bin/
sudo ln -fs $PWD/capssh /usr/local/bin/
sudo ln -fs $PWD/capcssh /usr/local/bin/
sudo ln -fs $PWD/docker_remote_tags /usr/local/bin/
ln -sf ~/.vim ~/.config/nvim

ln -sf /opt/google/chrome/chrome ~/.local/bin/

source ~/.bashrc
