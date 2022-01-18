# This tmux statusbar config was created by tmuxline.vim
# on Wed, 17 Mar 2021

set -g status-justify "centre"
set -g status "on"
set -g status-left-style "none"
set -g message-command-style "fg=#999f93,bg=#4a555b"
set -g status-right-style "none"
set -g pane-active-border-style "fg=#a7c080"
set -g status-style "none,bg=#374247"
set -g message-style "fg=#999f93,bg=#4a555b"
set -g pane-border-style "fg=#4a555b"
set -g status-right-length "100"
set -g status-left-length "100"
setw -g window-status-activity-style "none,fg=#a7c080,bg=#374247"
setw -g window-status-separator ""
setw -g window-status-style "none,fg=#999f93,bg=#374247"

set -g status-left "#[fg=#2f383e,bg=#a7c080] #S #[fg=#a7c080,bg=#4a555b,nobold,nounderscore,noitalics] #[fg=#999f93,bg=#4a555b] %R #[fg=#4a555b,bg=#374247,nobold,nounderscore,noitalics] "
set -g status-right "#[fg=#4a555b,bg=#374247,nobold,nounderscore,noitalics] #[fg=#999f93,bg=#4a555b] %a #[fg=#a7c080,bg=#4a555b,nobold,nounderscore,noitalics] #[fg=#2f383e,bg=#a7c080] #H #{prefix_highlight} "
setw -g window-status-format "#[fg=#374247,bg=#374247,nobold,nounderscore,noitalics] #[fg=#999f93] #I  #W #[fg=#374247,bg=#374247,nobold,nounderscore,noitalics] "
setw -g window-status-current-format "#[fg=#374247,bg=#4a555b,nobold,nounderscore,noitalics] #[fg=#999f93,bg=#4a555b] #I   #W   #F #[fg=#4a555b,bg=#374247,nobold,nounderscore,noitalics] "

