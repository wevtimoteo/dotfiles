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
bindkey -v
bindkey '^R' history-incremental-search-backward

# Other variables
source ~/.exports

LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8

ZDOTDIR="$HOME/.zsh"
ZSH_CUSTOM="$ZDOTDIR/custom"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

set -o emacs

SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  ruby          # Ruby section
  elixir        # Elixir section
  xcode         # Xcode section
  swift         # Swift section
  golang        # Go section
  rust          # Rust section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  terraform     # Terraform workspace section
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
