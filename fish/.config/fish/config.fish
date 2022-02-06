if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Starship prompt
starship init fish | source

# Aliases and abbrs
# Source
# source ~/.config/env

# Themes
source ~/.config/fish/themes/gruvbox.fish

zoxide init fish --cmd j | source
xset r rate 320 40
set -U fish_greeting 

function fish_user_key_bindings
    fzf_key_bindings
    fish_vi_key_bindings
end
funcsave fish_user_key_bindings
