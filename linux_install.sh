files=( bashrc irbrc alias vim vimrc git-completion.sh gitconfig gitignore_global gemrc tmux.conf emacs pryrc tmux )

for filename in ${files[@]}
do
  [[ -s $HOME/.$filename ]] && rm $HOME/.$filename
  ln -s $PWD/$filename ~/.$filename
done

ln -fs $PWD/git-edit /usr/local/bin/git-edit
ln -fs $PWD/capssh /usr/local/bin/capssh
ln -fs $PWD/capcssh /usr/local/bin/capcssh

dirs=( emacs.d )

for dir in ${dirs[@]}
do
  [[ -s $HOME/.$dir ]] && rm $HOME/.$dir
  ln -s $PWD/$dir ~/.$dir
done

source ~/.bashrc
