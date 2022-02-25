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
bindkey '^H' backward-char-delete
bindkey '^L' autosuggest-accept
bindkey '^K' up-line-or-history
bindkey '^J' down-line-or-history
bindkey '^O' fzf-cd-widget

# other
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
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
. /opt/asdf-vm/asdf.sh

# nix
if [ -e /home/haunter/.nix-profile/etc/profile.d/nix.sh ]; then . /home/haunter/.nix-profile/etc/profile.d/nix.sh; fi # added by nix installer
