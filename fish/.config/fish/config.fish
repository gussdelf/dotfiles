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
alias v='nvim'
alias vi='/usr/bin/vim'
alias se='sudoedit'
alias tree='exa --icons -s type -T'
alias doom='~/.emacs.d/bin/doom'

abbr c 'clear'
abbr g 'git'
abbr N 'nnn -e'

# Exports
set --export NNN_FIFO "/tmp/nnn.fifo"
export VISUAl='nvim' 
export EDITOR='nvim'
export NNN_PLUG='c:fzcd;l:launch;z:autojump;p:preview-tui;P:preview-tabbed;o:fzopen;'
export PATH="$HOME/go/bin:$PATH"
export PAGER="bat --paging=always"
source ~/.config/diricons.fish
