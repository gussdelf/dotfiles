#!/usr/bin/env bash
# Nightfox colors for Tmux
# Style: nightfox
# Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nightfox/nightfox_tmux.tmux
set -g mode-style "fg=#c5cdd9,bg=#404455"
set -g message-style "fg=#c5cdd9,bg=#404455"
set -g message-command-style "fg=#c5cdd9,bg=#404455"
set -g pane-border-style "fg=#404455"
set -g pane-active-border-style "fg=#d38aea"
set -g status "on"
set -g status-justify "left"
set -g status-style "none,bg=#333644"
set -g status-left-length "100"
set -g status-right-length "100"
set -g status-left-style NONE
set -g status-right-style NONE


set -g status-left "#[fg=#2b2d37,bg=#d38aea, bold] #S #[fg=#d38aea,bg=#404455,nobold,nounderscore,noitalics]#[fg=#c5cdd9,bg=#404455] %R #[fg=#404455,bg=#333644,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#404455,bg=#333644,nobold,nounderscore,noitalics]#[fg=#c5cdd9,bg=#404455] %a #[fg=#d38aea,bg=#404455,nobold,nounderscore,noitalics]#[fg=#2b2d37,bg=#d38aea] #h "
setw -g window-status-separator ""
setw -g window-status-format "#[fg=#333644,bg=#404455,nobold,nounderscore,noitalics]#[fg=#c5cdd9,bg=#404455] #I  #W #F #[fg=#404455,bg=#333644,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#333644,bg=#d38aea,nobold,nounderscore,noitalics]#[fg=#282828,bg=#d38aea,bold] #I  #W #F #[fg=#d38aea,bg=#333644,nobold,nounderscore,noitalics]"
  
set -g status-justify "centre"
