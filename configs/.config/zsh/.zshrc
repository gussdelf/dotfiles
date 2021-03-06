# source env file
source $XDG_CONFIG_HOME/env

# completetions
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

# vim bindings
bindkey -v

# load some useful functions
source $ZDOTDIR/functions.zsh

# plugins
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"

# some bindings
bindkey '^H' backward-delete-char
bindkey '^L' autosuggest-accept
bindkey '^K' up-line-or-history
bindkey '^J' down-line-or-history
bindkey '^O' fzf-cd-widget

# other
if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi
source $XDG_CONFIG_HOME/alias
export HISTFILE="$XDG_DATA_HOME"/zsh/history
export HISTSIZE=10000
export SAVEHIST=10000

# opts
unsetopt BEEP
setopt autocd extendedglob nomatch menucomplete interactivecomments\
	appendhistory HIST_IGNORE_ALL_DUPS HIST_SAVE_NO_DUPS\
	HIST_REDUCE_BLANKS INC_APPEND_HISTORY_TIME EXTENDED_HISTORY  

# prompt
eval "$(starship init zsh)"
ZSH_HIGHLIGHT_STYLES[comment]=fg=245 # Fix invisible comments

# zoxide
eval "$(zoxide init --cmd j zsh)"

# asdf
if [ -e  $PATH/asdf.sh ]; then . /opt/asdf-vm/asdf.sh; fi

# nix
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi 
