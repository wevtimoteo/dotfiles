files=( zshrc zsh irbrc alias vim gitconfig gitignore_global gemrc tmux.conf tmux tigrc )

for filename in ${files[@]}
do
  [[ -s $HOME/.$filename ]] && rm $HOME/.$filename
  ln -sf $PWD/$filename ~/.$filename
done

ln -sf $PWD/git-edit ~/.local/bin/git-edit
ln -sf $PWD/nvim ~/.config/nvim

source ~/.zshrc
