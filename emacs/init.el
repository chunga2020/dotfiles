(setq custom-file (locate-user-emacs-file "custom.el"))

;; Add MELPA to known package repos
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

 '(package-selected-packages
   '(browse-kill-ring company darkman highlight-indent-guides hl-todo magit
                      magit-todos markdown-mode org-mode telephone-line vterm
                      winum))

;; Interface options
(load-file (locate-user-emacs-file "interface.el"))

;; Text editing options
(load-file (locate-user-emacs-file "editing.el"))

;; Consolidate backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Enable disabled commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Keybinds
(load-file (locate-user-emacs-file "keybinds.el"))

;; Packages
(load-file (locate-user-emacs-file "package-config.el"))

;; Mode-specific settings
(load-file (locate-user-emacs-file "mode-config.el"))

;; Useful functions
(load-file (locate-user-emacs-file "functions.el"))
