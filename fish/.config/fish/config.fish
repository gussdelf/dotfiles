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
alias e='emacsclient -nw'
alias ee='emacsclient -nc'
alias vi='/usr/bin/vim'
alias se='sudoedit'
alias cc='clang -o'
alias pp='clang++ -o'
alias nw='newsboat'
alias nf='neofetch'
alias cp='rsync'
alias uf='ufetch'
alias tree='exa --icons -s type -T'
alias d='~/.Doom/bin/doom'
alias magit='emacsclient -nw -e "(magit-status)"'
alias server="python -m http.server"
alias zzz='systemctl suspend'
abbr c 'clear;'
abbr N 'nnn -e'

# Exports and sets
set --export NNN_FIFO "/tmp/nnn.fifo"
export VISUAl='/usr/local/bin/emacsclient -nc'
export EDITOR='/usr/local/bin/emacsclient -nc'
export NNN_PLUG='c:fzcd;l:launch;z:autojump;p:preview-tui;P:preview-tabbed;o:fzopen;'
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/Projects/shell:$PATH"
export ZDOTDIR=$HOME/.config/zsh

# Source
source ~/.config/diricons.fish

xset r rate 320 40

function fish_user_key_bindings
    bind -s -M insert -m default jk 'commandline -f repaint'
    fzf_key_bindings
end

funcsave fish_user_key_bindings

xi
