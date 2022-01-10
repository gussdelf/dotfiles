if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Starship prompt
starship init fish | source

# Aliases and abbrs
source ~/.config/fish/alias.fish

# Source
source ~/.config/env

# Themes
#source ./themes/tokyoStorm.fish

zoxide init fish | source
xset r rate 320 40
set -U fish_greeting 

function fish_user_key_bindings
    bind -s -M insert -m default jk 'commandline -f repaint'
    fzf_key_bindings
    fish_vi_key_bindings
end
funcsave fish_user_key_bindings
