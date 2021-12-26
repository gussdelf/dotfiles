export HISTFILE=~/.config/zsh/.history
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt appendhistory

## Completetions
autoload -Uz compinit
zstyle ':completion:*' menu select
compinit
_comp_options+=(globdots)

unsetopt BEEP
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time
setopt autocd extendedglob nomatch menucomplete

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

set --export NNN_FIFO "/tmp/nnn.fifo"
export VISUAl='emacsclient -nc' 
export EDITOR='emacsclient -nc'
export NNN_PLUG='c:fzcd;l:launch;z:autojump;p:preview-tui;P:preview-tabbed;o:fzopen;'
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Repos/asdf/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/Projects/shell:$PATH"
export PAGER="bat --paging=always"
export LC_CTYPE=pt_BR.UTF-8

bindkey -v
xset r rate 320 40
eval "$(starship init zsh)"

# Sources
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-autopair/autopair.plugin.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source $ZDOTDIR/add-plugins.zsh

zsh_add_plugin "hlissner/zsh-autopair"
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh
