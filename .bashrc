if [ -f /etc/bashrc ]; then
     . /etc/bashrc
fi

alias cd='cd -P'
alias vi='vim'
alias tmux='tmux -2'
alias grep='grep --color -I'
alias pkill='pkill -u $USER'
alias ll='ls -la'
alias pw='pwd'
alias locate='locate -b'
