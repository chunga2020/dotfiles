
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

;; eldoc
(setq eldoc-echo-area-prefer-doc-buffer t)

;; eglot setup
(setq eglot-events-buffer-size 0)

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
   telephone-line-lhs '((accent . (telephone-line-vc-segment))
                        (nil . (telephone-line-major-mode-segment))
                        (accent . (telephone-line-minor-mode-segment))
                        (nil . (telephone-line-buffer-segment))
                        (accent . (telephone-line-airline-position-segment)))
   telephone-line-rhs nil)
  (telephone-line-mode t))

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
