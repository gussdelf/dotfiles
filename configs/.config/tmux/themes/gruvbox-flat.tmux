#!/usr/bin/env bash
# Nightfox colors for Tmux
# Style: nightfox
# Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nightfox/nightfox_tmux.tmux
set -g mode-style "fg=#a89984,bg=#504945"
set -g message-style "fg=#a89984,bg=#504945"
set -g message-command-style "fg=#a89984,bg=#504945"
set -g pane-border-style "fg=#504945"
set -g pane-active-border-style "fg=#a89984"
set -g status "on"
set -g status-justify "left"
set -g status-style "none,bg=#3a3735"
set -g status-left-length "100"
set -g status-right-length "100"
set -g status-left-style NONE
set -g status-right-style NONE


set -g status-left "#[fg=#282828,bg=#a89984,bold] #S #[fg=#a89984,bg=#504945,nobold,nounderscore,noitalics]#[fg=#a89984,bg=#504945] %R #[fg=#504945,bg=#3a3735,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#504945,bg=#3a3735,nobold,nounderscore,noitalics]#[fg=#a89984,bg=#504945] %a #[fg=#a89984,bg=#504945,nobold,nounderscore,noitalics]#[fg=#282828,bg=#a89984,bold] #h "
setw -g window-status-activity-style "underscore,fg=#AEAFB0,bg=#131A24"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#AEAFB0,bg=#131A24"
setw -g window-status-format "#[fg=#3a3735,bg=#504945,nobold,nounderscore,noitalics]#[fg=#a89984,bg=#504945] #I #W #F #[fg=#504945,bg=#3a3735,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#3a3735,bg=#a89984,nobold,nounderscore,noitalics]#[fg=#282828,bg=#a89984,bold] #I #W #F #[fg=#a89984,bg=#3a3735,nobold,nounderscore,noitalics]"
  
set -g status-justify "centre"
