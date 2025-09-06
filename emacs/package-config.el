
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
  :config
  (global-company-mode)
  (setq
   company-minimum-prefix-length 5
   company-idle-delay 0.1))

;; darkman
(use-package darkman
  :ensure t
  :if (display-graphic-p))

;; eldoc
(setq eldoc-echo-area-prefer-doc-buffer t)

;; emms
(use-package emms
  :config
  (emms-all)
  (setq-default emms-source-file-default-directory "~/Music")
  (setq emms-player-list '(emms-player-mpv)))

;; eglot setup
(setq eglot-events-buffer-size 0)

;; highlight-indent-guides mode
(use-package highlight-indent-guides
  :if (display-graphic-p (selected-frame))
  :config
  (setq highlight-indent-guides-method 'fill)
  :hook
  (prog-mode))

;; Minibuffer completion
;; let me use spaces normally in the minibuffer
(define-key minibuffer-local-completion-map " " 'self-insert-command)

;; smart-comment
(use-package smart-comment
  :ensure t
  :bind ("M-;" . smart-comment))

;; telephone-line
(use-package telephone-line
  :if (display-graphic-p (selected-frame))
  :config
  (setq
   telephone-line-primary-left-separator 'telephone-line-flat
   telephone-line-secondary-left-separator 'telephone-line-flat
   telephone-line-lhs '((accent . (telephone-line-vc-segment))
                        (nil . (telephone-line-major-mode-segment))
                        (accent . (telephone-line-minor-mode-segment))
                        (nil . (telephone-line-buffer-segment))
                        (accent . (telephone-line-airline-position-segment)))
   telephone-line-rhs nil))

;; which-key setup
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (setq which-key-popup-type 'minibuffer))

;; winum mode
(use-package winum
  :config
  (winum-mode 1)
  (setq
   winum-scope 'frame-local))
