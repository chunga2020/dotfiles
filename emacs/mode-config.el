(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :config (setq markdown-command "pandoc"))

(use-package org
  :ensure t
  :config
  (electric-quote-mode 1))

;; Text mode
(use-package text-mode
  :config
  ;; Always hard-wrap text in text mode
  (turn-on-auto-fill)
  (flyspell-mode))

;; VTerm mode
(use-package vterm
  :config
  (hl-line-mode -1))
