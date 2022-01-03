export ZDOTDIR=$HOME/.config/zsh
source $ZDOTDIR/.zshrc

if [ -e /home/haunter/.nix-profile/etc/profile.d/nix.sh ]; then . /home/haunter/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
