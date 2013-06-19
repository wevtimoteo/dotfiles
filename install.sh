files=( bash_profile irbrc alias vim vimrc git-completion.sh gitconfig gitignore_global gemrc awsrc )

for filename in ${files[@]}
do
  [[ -s $HOME/.$filename ]] && rm $HOME/.$filename
  ln -s $PWD/$filename ~/.$filename
done

ln -fs $PWD/git-edit /usr/local/bin/git-edit

source ~/.bash_profile
