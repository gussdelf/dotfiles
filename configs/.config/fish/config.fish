if status is-interactive
    # Commands to run in interactive sessions can go here
end

source ~/.config/fish/env.fish

# Starship prompt
starship init fish | source

# Aliases and abbrs
source ~/.config/fish/alias.fish

# Themes
source ~/.config/fish/themes/gruvbox.fish

zoxide init fish --cmd j | source
xset r rate 320 40
set -U fish_greeting 

function fish_user_key_bindings
	if command -s fzf-share >/dev/null
		source (fzf-share)/key-bindings.fish
	end

	fzf_key_bindings
	bind -M insert \cl forward-word
end
