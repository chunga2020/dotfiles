
;; browse-kill-ring setup
(use-package browse-kill-ring
  :config
  (global-set-key (kbd "C-c k") 'browse-kill-ring))
(setq kill-do-not-save-duplicates t)

;; compilation setup
(setq compilation-scroll-output 'first-error)

(use-package consult
  :bind (("C-x b" . consult-buffer)
         ("C-x 4 b" . consult-buffer-other-window)
         ("M-y" . consult-yank-pop)
         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-s l" . consult-line)
         :map minibuffer-local-map
         ("M-s" . consult-history)
         ("M-r" . consult-history)))

;; corfu
(use-package corfu
  :init
  (global-corfu-mode)
  :config
  (keymap-unset corfu-map "RET"))

;; darkman
(use-package darkman
  :if (display-graphic-p)
  :config
  (setq darkman-themes '(:light modus-operandi-tinted :dark modus-vivendi-tinted)))

;; standard emacs settings
(use-package emacs
  :config
  (setq-default fill-column 80)
  (electric-pair-mode t)
  (line-number-mode t)
  (column-number-mode t)
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (savehist-mode)
  (darkman-mode)
  (electric-quote-mode)
  (setq
   electric-pair-delete-adjacent-pairs t
   indent-tabs-mode nil
   inhibit-startup-screen t
   initial-scratch-message nil
   require-final-newline t
   tab-width 4)
  :hook
  ((prog-mode . display-fill-column-indicator-mode)
   (prog-mode . display-line-numbers-mode)
   (prog-mode . hs-minor-mode)
   (prog-mode . hl-line-mode)
   (text-mode . display-fill-column-indicator-mode)
   (text-mode . display-line-numbers-mode)
   (text-mode . hl-line-mode)))

;; eglot
(use-package eglot
  :config
  (setq eglot-ignored-server-capabilities '(:documentFormattingProvider
                                            :documentOnTypeFormattingProvider
                                            :inlayHintProvider)))

;; eldoc
(setq eldoc-echo-area-prefer-doc-buffer t)

;; elfeed
(use-package elfeed
  :config
  (setq elfeed-feeds '("https://archlinux.org/feeds/news"
                       "https://proton.me/blog/feed"
                       "https://xkcd.com/rss.xml"))
  (setq-default elfeed-search-filter "@1-week-ago ")
  :hook
  (elfeed-search-mode . elfeed-update))

;; emms
(use-package emms
  :config
  (emms-all)
  (setq-default emms-source-file-default-directory "~/Music/flac/")
  (setq emms-player-list '(emms-player-vlc
                           emms-player-mpv)
        emms-player-mpv-parameters
        (cons "--cdda-speed=1" emms-player-mpv-parameters))

  (emms-add-directory-tree emms-source-file-default-directory)
  (emms-add-directory-tree "~/Music/yt-dlp/")
  (emms-playlist-current-clear)
  :bind (("C-c e b" . emms-smart-browse)
         ("C-c e n" . emms-next)
         ("C-c e p" . emms-previous)
         ("C-c e r l" . emms-toggle-repeat-playlist)
         ("C-c e r t" . emms-toggle-repeat-track)
         ("C-c e s" . emms-stop)
         ("C-c e <SPC>" . emms-pause)))

(use-package emms-mode-line-cycle
  :after emms
  :config
  (setq emms-mode-line-cycle-max-width 20
        emms-mode-line-cycle-velocity 8)
  (emms-mode-line-cycle 1))

;; eglot setup
(setq eglot-events-buffer-size 0)

;; hide-mode-line
(use-package hide-mode-line
  :hook
  (vterm-mode . hide-mode-line-mode))

;; hl-todo mode
(use-package hl-todo
  :hook
  (prog-mode . global-hl-todo-mode))

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

(use-package magit)

(use-package marginalia
  :init
  (marginalia-mode))

(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :config (setq markdown-command "pandoc"))

(use-package orderless
  :custom
  (completion-styles '(orderless basic)))

;; Org mode
;; Need to do this outside of `use-package' to avoid "org version mismatch"
(setq org-hide-leading-stars t)

(use-package org-superstar
  :hook
  (org-mode . (lambda () (org-superstar-mode 1))))

(defun my-org-journal-save (&optional arg)
  "Save an org-journal entry.

If ARG is non-nil, kills the buffer.  The intention is that this
function can be invoked periodically without an argument while writing
an entry to save normally, while the final invocation has an argument,
signalling that the entry is complete and the buffer is no longer needed."
  (interactive "p")
  (save-buffer)

  ;; Just checking for arg isn’t enough, because it is always implicitly set.
  ;; Therefore, we need to check if it’s got a value other than the default.
  ;; Using C-u for the universal argument gives it a value of 4, so we can just
  ;; check if it’s greater than 1, which 4 is
  (when (> arg 1)
    (kill-buffer)))

;; org-journal
(use-package org-journal
  :init
  (setq org-journal-prefix-key "C-c j ")
  :config
  (setq org-journal-dir "~/Documents/org/journal"
        org-journal-file-format "%Y/%m/%d"
        org-journal-find-file-fn 'find-file
        org-extend-today-until 5
        org-journal-date-format "%A %F")
  :bind (("C-c j n" . org-journal-new-entry)
         ("C-c j t" . org-journal-open-current-journal-file)
         :map org-journal-mode-map
         ("C-x C-s" . my-org-journal-save))
  :hook
  (org-journal-mode . flyspell-mode)
  (org-journal-mode . org-indent-mode)
  (org-journal-mode . visual-line-mode)

  ;; org-journal is one of few text modes I don’t want hard-wrapping
  (org-journal-mode . turn-off-auto-fill))

;; smart-comment
(use-package smart-comment
  :bind ("M-;" . smart-comment))

;; Text mode
(use-package text-mode
  :straight nil
  :config
  (setq-default ispell-dictionary "en_US")
  :hook
  ;; Always hard-wrap text in text mode
  (text-mode . auto-fill-mode)
  (text-mode . flyspell-mode))

;; visual-fill-column
(use-package visual-fill-column)
(add-hook 'fundamental-mode-hook #'visual-line-mode)
(add-hook 'visual-line-mode-hook #'visual-fill-column-mode)
                                        ; scratch buffers use Fundamental mode
                                        ; and that’s where I want this to work

;; vertico
(use-package vertico
  :init
  (vertico-mode)
  :config
  (setq vertico-count 15))

;; VTerm mode
(use-package vterm
  :config
  (hl-line-mode -1))

;; which-key setup
(use-package which-key
  :config
  (which-key-mode)
  (setq which-key-popup-type 'side-window))

;; winum mode
(use-package winum
  :config
  (winum-mode 1)
  (setq
   winum-scope 'frame-local))
