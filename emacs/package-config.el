
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
  (setq-default emms-source-file-default-directory "~/Music/flac/")
  (setq emms-player-list '(emms-player-vlc
                           emms-player-mpv)
        emms-player-mpv-parameters
        (cons "--cdda-speed=1" emms-player-mpv-parameters))
  ;; only show playing time in mode line
  (emms-mode-line-mode 0)

  (emms-add-directory-tree "~/Music/yt-dlp/")
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

;; visual-fill-column
(use-package visual-fill-column
  :hook
  (fundamental-mode))                   ; scratch buffers use Fundamental mode
                                        ; and that’s where I want this to work

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
