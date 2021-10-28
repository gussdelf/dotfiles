if status is-interactive
# Commands to run in interactive sessions can go here
end

# Starship prompt
starship init fish | source

# Aliases and abbrs
alias bat='bat --theme Solarized\ \(dark\)'
alias ls='exa --icons -s type'
alias ll='exa --icons -s type -l'
alias la='exa --icons -s type -la'
alias lg='lazygit'
alias nf='neofetch'
alias g='git'
alias v='nvim'
alias vi='/usr/bin/vim'
alias se='sudoedit'
alias nw='newsboat'
alias nf='neofetch'
alias cdr='cd (ghq list --full-path | fzf --reverse)'
alias uf='ufetch'
alias tree='exa --icons -s type -T'
alias doom='~/.emacs.d/bin/doom'
abbr c 'clear;'
abbr N 'nnn -e'

# Exports and sets
set --export NNN_FIFO "/tmp/nnn.fifo"
export VISUAl='nvim' 
export EDITOR='nvim'
export NNN_PLUG='c:fzcd;l:launch;z:autojump;p:preview-tui;P:preview-tabbed;o:fzopen;'
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Projects/shell:$PATH"
export PAGER="bat --paging=always"
export ZDOTDIR=$HOME/.config/zsh

# Source
source ~/.config/diricons.fish

xset r rate 210 40

function fish_user_key_bindings
  bind -s -M insert -m default jk 'commandline -f repaint'
  bind -s -M insert \cn cdr
end
funcsave fish_user_key_bindings
