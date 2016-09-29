. ~/.alias

# rbenv
export PATH=/usr/local/bin:/usr/local/sbin:${PATH}
export PATH="$HOME/.rbenv/bin:$PATH"

export EDITOR="vim"

export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=/Users/wolcanus/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1

eval "$(rbenv init -)"

export PATH="/usr/local/heroku/bin:$PATH"

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
  export PS1="\[\033[01;31m\]➔  \[\033[01;32m\]\\W \[\033[01;35m\]\$(parse_git_branch) \[\033[01;34m\]\$\[\033[00m\] "
else
  export PS1='\[\033[01;32m\]\u@\h\[\033[01;33m\] \w \n\[\033[01;34m\]\$\[\033[00m\] '
fi

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# load AWSen
export AWSENV_PROFILES_DIR="$HOME/Sites/aws-profiles"
. $HOME/Sites/dotfiles/awsenv.sh
. $HOME/.awsrc
awsenv_set dev

. $HOME/.git-completion.sh

# fast access to projects folder
CDPATH=".:~:~/Sites:~/Apps"

