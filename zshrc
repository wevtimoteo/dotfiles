. "$HOME/.asdf/asdf.sh"

# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# initialise completions with ZSH's compinit
autoload -Uz compinit && compinit

unsetopt nomatch

source ~/.alias

HISTCONTROL=ignoreboth

# fast access to projects folder
typeset -U path cdpath fpath

setopt auto_cd
cdpath=($HOME/Sites $HOME/Apps)

# Enable comment in command line
setopt interactivecomments

zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format %d
zstyle ':completion:*:descriptions' format %B%d%b
zstyle ':completion:*:complete:(cd|pushd):*' tag-order \
        'local-directories named-directories'

# Reverse history search
bindkey -e
bindkey '^R' history-incremental-search-backward

# Other variables
source ~/.exports

LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8

ZDOTDIR="$HOME/.zsh"
ZSH_CUSTOM="$ZDOTDIR/custom"

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

