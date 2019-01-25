. ~/.alias

# rbenv
export PATH="/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

# golang
export PATH="$HOME/go/bin:$PATH"
export GOPATH=$HOME/go

export EDITOR="nvim"

unset DOCKER_CERT_PATH
unset DOCKER_TLS_VERIFY

eval "$(rbenv init -)"

eval "$(stack --bash-completion-script stack)"

export PATH="/usr/local/heroku/bin:$PATH"

export HISTCONTROL=ignoreboth

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
  export PS1="\[\033[01;31m\]➔  \[\033[01;32m\]\\W \[\033[00;35m\]\$(parse_git_branch) \[\033[01;33m\]\$\[\033[00m\] "
else
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

. $HOME/.git-completion.sh
. $HOME/.hub.bash_completion.sh

# fast access to projects folder
CDPATH=".:~:~/Sites:~/Apps"

source ~/.exports

# Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.bash.inc" ]; then . "$HOME/google-cloud-sdk/path.bash.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.bash.inc" ]; then . "$HOME/google-cloud-sdk/completion.bash.inc"; fi
