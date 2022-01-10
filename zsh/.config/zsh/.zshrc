# Source env file
source $XDG_CONFIG_HOME/env

## Completetions
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

# Vim bindings
bindkey -v

# Sources
source $ZDOTDIR/functions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

zsh_add_file "alias.zsh"
zsh_add_plugin "hlissner/zsh-autopair"

export HISTFILE="$XDG_DATA_HOME"/zsh/history
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

# Prompt
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# Increase autorepeat 
xset r rate 320 40

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
