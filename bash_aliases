# some more ls aliases
alias lsl='ls -lha'
alias ll='exa --long --git'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ..; ll'
alias peg='ps -ef | grep -i'
alias psg='ps aux | grep '
alias llg='launchctl list | grep'
alias ack='ack-grep'
alias vim='nvim'

# DEV
alias be="bundle exec"
alias unit="be rspec -t ~@acceptance"
alias acceptance="be rspec -t @acceptance"
alias migrate="bin/rake db:migrate && RAILS_ENV=test bin/rake db:migrate"
alias tmux="env TERM=xterm-256color tmux"
alias gitroot='cd $(git rev-parse --show-toplevel)'

# copy to clipboard
alias copy="xsel --clipboard"

# Syntax highlighting and better display of file contents
# https://github.com/sharkdp/bat
alias cat="bat"

alias emacs="emacs --no-window-system"

# others
alias myip='curl -s http://checkrealip.com/ | grep "Current IP Address"'

alias weather='curl -s http://wttr.in/'
