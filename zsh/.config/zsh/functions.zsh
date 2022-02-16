function zsh_add_file() {
	[ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function zsh_add_plugin() {
	PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
	if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
		# For plugins
		zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
			zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
				else
					git clone --depth 1 "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
	fi
}

function zsh_add_theme() {
	PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
	if [ -d "$ZDOTDIR/plugins/$PLUGIN_NAME" ]; then 
		# For plugins
		zsh_add_file "plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh-theme"
	else
		git clone --depth 1 "https://github.com/$1.git" "$ZDOTDIR/plugins/$PLUGIN_NAME"
	fi
}

function etangle() {
	emacs --batch --eval "(progn (require 'org) (setq org-confirm-babel-evaluate nil) (org-babel-tangle-file \"$1\"))"
}

fuzzy-xdg-open() {
  local output
  output=$(fzf --height 50% --reverse </dev/tty) && $EDITOR ${(q-)output}
  zle reset-prompt
}
zle -N fuzzy-xdg-open

bindkey '^F' fuzzy-xdg-open

