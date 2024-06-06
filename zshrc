# initialise completions with ZSH's compinit
fpath+=~/.zfunc

autoload -Uz compinit && compinit

unsetopt nomatch

source ~/.alias

HISTCONTROL=ignoreboth
setopt HIST_IGNORE_SPACE

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

# Other environment variables
source $HOME/.exports

[[ -s $HOME/.custom_exports ]] && source $HOME/.custom_exports

# source antidote
source ${ZDOTDIR:-~}/.antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

#PROMPT="%F{175}➔ %F{33}%~ %f%F{44}\$%f "
eval "$(starship init zsh)"

. "$HOME/.asdf/asdf.sh"
# append completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)

# bun completions
[ -s "/Users/wevtimoteo/.bun/_bun" ] && source "/Users/wevtimoteo/.bun/_bun"
