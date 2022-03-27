#!/usr/bin/env bash
# Nightfox colors for Tmux
# Style: nightfox
# Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/nightfox/nightfox_tmux.tmux
set -g mode-style "fg=#7E9CD8,bg=#223249"
set -g message-style "fg=#7E9CD8,bg=#1F1F28"
set -g message-command-style "fg=#7E9CD8,bg=#1F1F28"
set -g pane-border-style "fg=#1F1F28"
set -g pane-active-border-style "fg=#7E9CD8"
set -g status "on"
set -g status-justify "left"
set -g status-style "none,bg=#2A2A37"
set -g status-left-length "100"
set -g status-right-length "100"
set -g status-left-style NONE
set -g status-right-style NONE


set -g status-left "#[fg=#2A2A37,bg=#7E9CD8,bold] #S #[fg=#7E9CD8,bg=#1F1F28,nobold,nounderscore,noitalics]#[fg=#7E9CD8,bg=#1F1F28] %R #[fg=#1F1F28,bg=#2A2A37,nobold,nounderscore,noitalics]"
set -g status-right "#[fg=#1F1F28,bg=#2A2A37,nobold,nounderscore,noitalics]#[fg=#7E9CD8,bg=#1F1F28] %a #[fg=#7E9CD8,bg=#1F1F28,nobold,nounderscore,noitalics]#[fg=#2A2A37,bg=#7E9CD8,bold] #h "
setw -g window-status-activity-style "underscore,fg=#AEAFB0,bg=#131A24"
setw -g window-status-separator ""
setw -g window-status-style "NONE,fg=#2A2A37,bg=#2A2A37"
setw -g window-status-format "#[fg=#2A2A37,bg=#1F1F28,nobold,nounderscore,noitalics]#[fg=#7E9CD8,bg=#1F1F28] #I  #W #F #[fg=#1F1F28,bg=#2A2A37,nobold,nounderscore,noitalics]"
setw -g window-status-current-format "#[fg=#2A2A37,bg=#7E9CD8,nobold,nounderscore,noitalics]#[fg=#2A2A37,bg=#7E9CD8,bold] #I  #W #F #[fg=#7E9CD8,bg=#2A2A37,nobold,nounderscore,noitalics]"
  
set -g status-justify "centre"
