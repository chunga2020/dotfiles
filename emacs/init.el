(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(telephone-line evil prettier vue vue-mode web-mode company darkman markdown-mode emmet-mode treemacs smart-comment vterm winum magit highlight-indent-guides which-key browse-kill-ring)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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
(add-hook 'prog-mode-hook #'hs-minor-mode)
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
(global-unset-key (kbd "C-<delete>"))   ; Default: kill-word (shared with M-d)
                                        ; and I use M-d far more often
(global-set-key (kbd "C-<delete>") 'delete-region)

;; ################################ Packages ###################################

;; browse-kill-ring setup
(use-package browse-kill-ring
  :ensure t
  :config
  (global-set-key (kbd "C-c k") 'browse-kill-ring))
(setq kill-do-not-save-duplicates t)

;; compilation setup
(setq compilation-scroll-output 'first-error)

;; company-mode
(use-package company
  :ensure t
  :init
  (global-company-mode)
  :config
  (setq
   company-minimum-prefix-length 5
   company-idle-delay 0.1))

;; darkman
(use-package darkman
  :ensure t
  :init
  (darkman-mode))

;; eglot setup
(setq eglot-events-buffer-size 0)

;; evil mode
(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (evil-mode t)
  :config
  (setq evil-want-Y-yank-to-eol t))

;; highlight-indent-guides mode
(use-package highlight-indent-guides
  :config
  (setq highlight-indent-guides-method 'fill))

;; Minibuffer completion
;; let me use spaces normally in the minibuffer
(define-key minibuffer-local-completion-map " " 'self-insert-command)

;; telephone-line
(use-package telephone-line
  :init
  (setq
   ;; telephone-line-primary-left-separator telephone-line-flat
   ;; telephone-line-secondary-left-separator telephone-line-abs-left
   telephone-line-lhs '((evil . (telephone-line-evil-tag-segment))
                        (accent . (telephone-line-vc-segment))
                        (nil . (telephone-line-major-mode-segment))
                        (accent . (telephone-line-minor-mode-segment))
                        (nil . (telephone-line-buffer-segment))
                        (accent . (telephone-line-airline-position-segment)))
   telephone-line-rhs nil)
  (telephone-line-mode t))

;; treemacs setup
(use-package treemacs
  :ensure t
  :config
  (setq treemacs-no-png-images t)
  (global-set-key (kbd "C-x t t") 'treemacs-select-window))

;; which-key setup
(use-package which-key
  :ensure t
  :init
  (which-key-mode)
  :config
  (setq which-key-popup-type 'minibuffer))

;; winum mode
(use-package winum
  :init
  (winum-mode 1)
  :config
  (setq
   winum-scope 'frame-local))

;; ######################### Mode-specific settings ############################

;; HTML mode
(use-package html-mode
  :hook
  (html-mode . emmet-mode)
  (html-mode . hs-minor-mode)
)

;; JavaScript mode
(use-package javascript-mode
  :config
  :hook
  (js-mode . emmet-mode)
  (js-mode . hs-minor-mode)
)

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "pandoc"))

;; Text mode
(use-package text
  :hook
  ;; Always hard-wrap text in text mode
  (text-mode . turn-on-auto-fill)
  (text-mode . flyspell-mode))

;; ############################# Useful functions ##############################

(defun start-vterm-with-name (&optional split-lines)
  "Prompt for a split type and name, and start a new vterm buffer.
If split-lines is supplied, resize the new window using `shrink-window'."
  (interactive "p")
  (setq horizontal-p (y-or-n-p "Horizontal split? "))
  (if horizontal-p
      (split-window-horizontally)
    (split-window-vertically))
  (other-window 1)
  (if split-lines
      (shrink-window split-lines horizontal-p)) ; delta value is unimportant.
                                                ; Just pass it along and let
                                                ; shrink-window handle it
  (vterm (read-from-minibuffer "Enter name for the new terminal buffer: ")))
