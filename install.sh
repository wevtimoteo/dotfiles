f2iles=( bash_profile irbrc alias vim vimrc git-completion.sh gitconfig gitignore_global gemrc awsrc tmux.conf )

for filename in ${files[@]}
do
  [[ -s $HOME/.$filename ]] && rm $HOME/.$filename
  ln -s $PWD/$filename ~/.$filename
done

ln -fs $PWD/git-edit /usr/local/bin/git-edit
ln -fs $PWD/capssh /usr/local/bin/capssh
ln -fs $PWD/capcssh /usr/local/bin/capcssh
ln -s $PWD/emacs.d ~/.emacs.d

source ~/.bash_profile
