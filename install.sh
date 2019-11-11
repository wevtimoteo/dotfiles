files=( bash_profile zshrc zsh irbrc alias vim vimrc git-completion.sh gitconfig gitignore_global gemrc tmux.conf emacs pryrc tmux hub.bash_completion.sh hyper.js tigrc )

for filename in ${files[@]}
do
  [[ -s $HOME/.$filename ]] && rm $HOME/.$filename
  ln -sf $PWD/$filename ~/.$filename
done

ln -sf $PWD/git-edit /usr/local/bin/git-edit
ln -sf $PWD/capssh /usr/local/bin/capssh
ln -sf $PWD/capcssh /usr/local/bin/capcssh
ln -sf ~/.vim ~/.config/nvim

dirs=( emacs.d )

for dir in ${dirs[@]}
do
  [[ -s $HOME/.$dir ]] && rm $HOME/.$dir
  ln -sf $PWD/$dir ~/.$dir
done

source ~/.bash_profile
