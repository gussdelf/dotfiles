source $HOME/.config/env
source $HOME/.config/alias

[[ $- != *i* ]] && return

PS1="\[\033[35m\]  \[\033[37m\]\[\033[34m\]\w \[\033[0m\]"
PS2="\[\033[32m\]  > \[\033[0m\]"

HISTSIZE=10000
HISTFILESIZE="$XDG_CONFIG_HOME"/bash/history

if command -v fzf-share >/dev/null; then
 	source "$(fzf-share)/key-bindings.bash"
 	source "$(fzf-share)/completion.bash"
fi

eval "$(zoxide init --cmd j bash)"
xset r rate 320 40
set -o vi
