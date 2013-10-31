. ~/.alias

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export EDITOR="vim"

export RUBY_GC_MALLOC_LIMIT=60000000
export RUBY_FREE_MIN=200000

eval "$(rbenv init -)"
# source ~/.rbenv/completions/rbenv.bash

# prompt with ruby version
# rbenv version | sed -e 's/ .*//'
__rbenv_ps1 ()
{
  rbenv_ruby_version=`rbenv version | sed -e 's/ .*//'`
  #printf $rbenv_ruby_version
}

# prompt with git && rbenv
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# set ps1
if [ -f $BASH_COMPLETION_DIR/git ] && [ -f `which rbenv` ]; then
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1) ruby=$(__rbenv_ps1) \n\[\033[01;34m\]\$\[\033[00m\] '
elif [ -f $BASH_COMPLETION_DIR/git ]; then
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w$(__git_ps1) \n\[\033[01;34m\]\$\[\033[00m\]  '
elif [ `which rbenv` ]; then
  export PS1="\[\033[01;33m\]$(__rbenv_ps1) \[\033[01;32m\]\\w\[\033[03;35m\] \$(parse_git_branch) \[\033[03;30m\]\$(__awsenv_ps1) \[\033[01;34m\]\$\[\033[00m\] "
else
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi

# fast access to projects folder
CDPATH=".:~:~/Sites"

# load AWSenv file
export AWSENV_PROFILES_DIR="$HOME/Sites/aws-profiles"
. $HOME/Sites/dotfiles/awsenv.sh
. $HOME/.awsrc
awsenv-set dev

source "$HOME/.git-completion.sh"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
