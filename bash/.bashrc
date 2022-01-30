source $XDG_CONFIG_HOME/env
source $XDG_CONFIG_HOME/alias

[[ $- != *i* ]] && return

source /usr/share/fzf/key-bindings.bash

PS1="\[\033[32m\]  \[\033[37m\]\[\033[34m\]\w \[\033[0m\]"
PS2="\[\033[32m\]  > \[\033[0m\]"

HISTSIZE=10000
HISTFILESIZE="$XDG_CONFIG_HOME"/bash/history


source /usr/share/fzf/completion.bash
source /usr/share/fzf/key-bindings.bash

eval "$(zoxide init --cmd j bash)"
xset r rate 320 40
