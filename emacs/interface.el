(setq
 inhibit-startup-screen t
 initial-scratch-message nil)

(line-number-mode t)
(column-number-mode t)
(add-hook 'prog-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)
(add-hook 'text-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'text-mode-hook #'display-line-numbers-mode)

;; no gui toolbars or scrollbar
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq-default fill-column 80) ;; Make <M-q> wrap at 80 columns
