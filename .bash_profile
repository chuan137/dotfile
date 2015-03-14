# aliases
test -s ~/.alias && . ~/.alias || true
alias ls="ls --color -h --group-directories-first"
alias du="du -h"
alias l="ls -l"
alias ll="ls -la"
alias la='ls -A'
alias ltr="ls -ltr"
alias open='xdg-open 2>/tmp/xdg-open'
alias ..='cd ..'
alias ...='cd ../..'
alias vi='vim -X'

# Path
export PATH=$(find $HOME/applications -maxdepth 2 -type d -name bin -printf "%p:")$PATH

# Python virtual env wrapper
export WORKON_HOME=~/.virtualenv
source /usr/bin/virtualenvwrapper.sh

# term
if [[ -z $TMUX ]]; then
    if [ -e /usr/share/terminfo/x/xterm+256color ]; then # may be xterm-256 depending on your distro
        export TERM='xterm-256color'
    else
        export TERM='xterm'
    fi
else
    if [ -e /usr/share/terminfo/s/screen-256color ]; then
        export TERM='screen-256color'
    else
        export TERM='screen'
    fi
fi
#export TERM=xterm-256color

# cmd prompt
if [ -n "$SSH_CLIENT" ]; then
    export PS1='\[\033[0;36m\]\h \[\033[0;32m\]\W :> \[\033[0m\]'
else
    export PS1='\[\033[0;32m\]\W :> \[\033[0m\]'
fi
case $(ps -o comm $PPID) in *vi|*vim)
  #PS1="( $(ps $PPID | awk '{print $NF}' | sed 1d) ) $PS1" ;;
  PS1="( vim ) $PS1" ;;
esac

# readline binding
#>> kill word at cursor
bind '"\C-p": shell-kill-word'