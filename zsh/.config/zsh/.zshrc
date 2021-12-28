## Completetions
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

##Aliases
alias g='git'
alias v='nvim'
alias c='clear;'
alias N='nnn -e'
alias d='~/.Doom/bin/doom'
alias lg='lazygit'
alias nf='neofetch'
alias vi='/usr/bin/vim'
alias se='sudoedit'
alias nw='newsboat'
alias nf='neofetch'
alias cp='rsync'
alias uf='ufetch'
alias ls='exa --icons -s type'
alias ll='exa --icons -s type -l'
alias la='exa --icons -s type -la'
alias lla='exa --icons -s type -la'
alias doo='doas'
alias zzz='systemctl suspend'
alias vim='nvim'
alias tree='exa --icons -s type -T'
alias magit='emacsclient -nc -e "(magit-status)"'
alias sxiv='nsxiv'
alias server='python -m http.server'

bindkey -v
xset r rate 320 40
eval "$(starship init zsh)"

# Sources
export ZDOTDIR=~/.config/zsh
source $ZDOTDIR/add-plugins.zsh
zsh_add_file "zsh-exports.zsh"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-autopair/autopair.plugin.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

zsh_add_plugin "hlissner/zsh-autopair"

export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt appendhistory
unsetopt BEEP
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time
setopt autocd extendedglob nomatch menucomplete
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
