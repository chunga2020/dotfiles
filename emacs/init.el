(setq custom-file (locate-user-emacs-file "custom.el"))

;; Add MELPA to known package repos
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Packages
(load-file (locate-user-emacs-file "package-config.el"))

;; Text editing options
(load-file (locate-user-emacs-file "editing.el"))

;; Consolidate backup files
(setq backup-directory-alist '(("." . "~/.local/state/emacs/backups"))
      auto-save-list-file-prefix 'nil
      auto-save-list-file-name 'nil)

;; Enable disabled commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Keybinds
(load-file (locate-user-emacs-file "keybinds.el"))

;; Useful functions
(load-file (locate-user-emacs-file "functions.el"))
