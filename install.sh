files=( bash_profile irbrc alias vim vimrc git-completion.sh gitconfig gitignore_global gemrc awsrc tmux.conf tmux-powerlinerc )

for filename in ${files[@]}
do
  [[ -s $HOME/.$filename ]] && rm $HOME/.$filename
  ln -s $PWD/$filename ~/.$filename
done

ln -fs $PWD/git-edit /usr/local/bin/git-edit
ln -fs $PWD/capssh /usr/local/bin/capssh

source ~/.bash_profile
