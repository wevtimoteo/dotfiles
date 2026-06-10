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
cdpath=($HOME/Sites $HOME/Apps $HOME)

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

# Custom widget: delete until a given character (mimicking Vim's dt<char>)
function delete_until_char() {
  local target
  # Read one character without waiting for newline
  read -k 1 target || return

  local rest="${BUFFER:$CURSOR}"
  # Use parameter expansion to remove the longest match of target and anything after it
  local remainder="${rest%%$target*}"

  # If the remainder equals the full rest, the target was not found
  if [[ "$remainder" == "$rest" ]]; then
    zle beep
    return
  fi

  # The position of the target is the length of the remainder plus one
  local pos=$(( ${#remainder} + 1 ))
  local end=$(( CURSOR + pos - 1 ))

  # Set mark at current cursor position, move cursor to the target, and kill region
  zle set-mark-command
  CURSOR=$end
  zle kill-region
}

# Register the widget with zle
zle -N delete_until_char

# Bind Alt-d (Meta-d) to our custom widget (choose a different key-binding if desired)
bindkey "^[d" delete_until_char

# Other environment variables
source $HOME/.exports

[[ -s $HOME/.custom_exports ]] && source $HOME/.custom_exports

# source antidote
source ${HOMEBREW_PREFIX}/opt/antidote/share/antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

#PROMPT="%F{175}➔ %F{33}%~ %f%F{44}\$%f "
eval "$(starship init zsh)"

# asdf 0.16+ no longer ships asdf.sh — shims on PATH is the new init
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
fpath=("${ASDF_DATA_DIR:-$HOME/.asdf}/completions" $fpath)

# bun completions
[ -s "/Users/wevtimoteo/.bun/_bun" ] && source "/Users/wevtimoteo/.bun/_bun"
