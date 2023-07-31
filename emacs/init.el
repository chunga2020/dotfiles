;; Add MELPA to known package repos
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq
 inhibit-startup-screen t
 initial-scratch-message nil)

;; Interface options
(line-number-mode t)
(column-number-mode t)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'text-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook #'display-line-numbers-mode)

;; no gui toolbars or scrollbar
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq-default fill-column 80) ;; Make <M-q> wrap at 80 columns

;; Always add final newline to the end of a file
(setq require-final-newline t)

;; I typically use 4 spaces per tab
(setq tab-width 4)
(setq c-basic-offset 4)
;; spaces > tabs
(setq-default indent-tabs-mode nil)

;; Automatic closing of matched delimiters; also provides overtype of
;; auto-inserted closing symbols
(electric-pair-mode t)
(setq electric-pair-delete-adjacent-pairs t)

;; Consolidate backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; ######################## Enable disabled commands ###########################
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; ################################# Keybinds ##################################

(global-unset-key (kbd "<menu>"))
(global-set-key (kbd "C-x M-t") 'transpose-sentences)
