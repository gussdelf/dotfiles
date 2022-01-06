## Completetions
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

# vim bindings
bindkey -v

# Sources
export ZDOTDIR=~/.config/zsh
source $ZDOTDIR/functions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source ~/.config/env

zsh_add_file "alias.zsh"
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "Aloxaf/fzf-tab"

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt appendhistory
unsetopt BEEP
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS 
setopt HIST_REDUCE_BLANKS 
setopt INC_APPEND_HISTORY_TIME 
setopt EXTENDED_HISTORY 
setopt autocd extendedglob nomatch menucomplete

# prompt
eval "$(starship init zsh)"

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

xset r rate 320 40
