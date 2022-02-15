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
alias nzo="nvim -c \"lua require('telescope').extensions.zoxide.list(require('plugins.configs.telescope').minimal())\""
alias nfzf="nvim -c \"lua require('telescope.builtin').find_files(require('plugins.configs.telescope').minimal())\""
bindkey -s '^O' "nzo\n"
bindkey -s '^F' "nfzf\n"
bindkey '^K' autosuggest-accept

# Others
source $ZDOTDIR/functions.zsh
source $XDG_CONFIG_HOME/alias
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
zsh_add_plugin "hlissner/zsh-autopair"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "zsh-users/zsh-autosuggestions"
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
eval "$(zoxide init --cmd j zsh)"

# nix
if [ -e /home/haunter/.nix-profile/etc/profile.d/nix.sh ]; then . /home/haunter/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
