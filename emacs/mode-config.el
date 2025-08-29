(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "pandoc"))

(use-package org
  :ensure t
  :hook
  (org-mode . electric-quote-mode))

;; Text mode
(use-package text
  :hook
  ;; Always hard-wrap text in text mode
  (text-mode . turn-on-auto-fill)
  (text-mode . flyspell-mode))

;; VTerm mode
(use-package vterm
  :hook
  (hl-line-mode -1))
