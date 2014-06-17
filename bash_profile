. ~/.alias

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export PATH="/usr/local/heroku/bin:$PATH"
export EDITOR="vim"

eval "$(rbenv init -)"

# prompt with git && rbenv
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# set ps1
if [ -f $BASH_COMPLETION_DIR/git ] && [ -f `which rbenv` ]; then
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
elif [ -f $BASH_COMPLETION_DIR/git ]; then
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\]  '
elif [ `which rbenv` ]; then
  export PS1=" \[\033[01;32m\]\\w\[\033[03;35m\] \$(parse_git_branch) \[\033[03;30m\]\$(__awsenv_ps1) \[\033[01;34m\]\$\[\033[00m\] "
else
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi

unset RUBY_FREE_MIN
unset RUBY_HEAP_MIN_SLOTS

# load AWSen
export AWSENV_PROFILES_DIR="$HOME/Sites/aws-profiles"
. $HOME/Sites/dotfiles/awsenv.sh
. $HOME/.awsrc
awsenv-set dev

. $HOME/.git-completion.sh

# fast access to projects folder
CDPATH=".:~:~/Sites:~/Apps"

