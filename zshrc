zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash

fpath=(~/.zsh $fpath)
fpath=(${ASDF_DIR}/completions $fpath)
fpath=(~/.zsh/completions $fpath)

## enable the default zsh completions!
autoload -Uz compinit && compinit

unsetopt nomatch

source ~/.alias

# rbenv
PATH="/usr/local/bin:/usr/local/sbin:$HOME/.local/bin:$PATH"
PATH="$HOME/.rbenv/bin:$PATH"

# golang
PATH="$HOME/go/bin:$PATH"
GOPATH=$HOME/go

EDITOR="nvim"

unset DOCKER_CERT_PATH
unset DOCKER_TLS_VERIFY

eval "$(rbenv init -)"

PATH="/usr/local/heroku/bin:$PATH"

HISTCONTROL=ignoreboth

# fast access to projects folder
typeset -U path cdpath fpath

setopt auto_cd
cdpath=($HOME/Sites $HOME/Apps)

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %d
zstyle ':completion:*:descriptions' format %B%d%b
zstyle ':completion:*:complete:(cd|pushd):*' tag-order \
        'local-directories named-directories'

# Other variables
source ~/.exports

LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8

ZDOTDIR="$HOME/.zsh"
ZSH_CUSTOM="$ZDOTDIR/custom"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  rust          # Rust section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  terraform     # Terraform workspace section
  battery       # Battery level and status
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
