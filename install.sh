files=( zshrc zsh irbrc alias vim gitconfig gitignore_global gemrc tmux.conf tmux tigrc exports )

for filename in ${files[@]}
do
  [[ -s $HOME/.$filename ]] && rm -i $HOME/.$filename
  ln -sf $PWD/$filename ~/.$filename
done

source $HOME/.exports

ln -sf $PWD/git-edit ~/.local/bin/git-edit
ln -sf $PWD/nvim $CONFIG_DIR/nvim

source ~/.zshrc
