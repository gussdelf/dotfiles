# Source env file
source $XDG_CONFIG_HOME/env

# Completetions
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

# Vim bindings
bindkey -v

# Some bindings
bindkey -s '^N' "\n"
bindkey '^H' backward-char-delete
bindkey '^L' autosuggest-accept

# load some useful functions
source $ZDOTDIR/functions.zsh

# plugins
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"

# othere
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export HISTSIZE=10000
export SAVEHIST=10000
source $XDG_CONFIG_HOME/alias
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
unsetopt BEEP
setopt appendhistory
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS 
setopt HIST_REDUCE_BLANKS 
setopt INC_APPEND_HISTORY_TIME 
setopt EXTENDED_HISTORY 
setopt autocd extendedglob nomatch menucomplete interactivecomments

# Prompt
eval "$(starship init zsh)"
ZSH_HIGHLIGHT_STYLES[comment]=fg=245

# Zoxide
eval "$(zoxide init --cmd j zsh)"

# nix
if [ -e /home/haunter/.nix-profile/etc/profile.d/nix.sh ]; then . /home/haunter/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
