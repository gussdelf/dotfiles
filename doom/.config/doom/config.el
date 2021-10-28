(setq user-full-name "Gustavo Freitas"
      user-mail-address "flovatsug@gmail.com")

(setq org-directory "~/.config/org/")

(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font" :size 14)
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 17))

(setq doom-theme 'doom-material)

(setq display-line-numbers-type `relative)

(setq fancy-splash-image "~/.config/doom/misc/emacs-e.svg")
(remove-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(add-hook! '+doom-dashboard-mode-hook (hide-mode-line-mode 1) (hl-line-mode -1))
(setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))
(doom-big-font-mode)

(defun doom-dashboard-widget-footer ()
  (insert
   "\n"
   (+doom-dashboard--center
    (- +doom-dashboard--width 2)
    (with-temp-buffer
      (insert-text-button (or (all-the-icons-octicon "octoface" :face 'doom-dashboard-footer-icon :height 1.3 :v-adjust -0.15)
                              (propertize "github" 'face 'doom-dashboard-footer))
                          'action (lambda (_) (browse-url "https://github.com/gussdelf/"))
                          'follow-link t
                          'help-echo "Open my github page")
      (buffer-string)))
   "\n"))

(add-hook! 'doom-load-theme-hook
  (set-face-attribute 'font-lock-comment-face nil :slant 'italic)
  (set-face-attribute 'font-lock-keyword-face nil :slant 'italic))

(dolist (mode '(org-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))
