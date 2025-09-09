(global-unset-key (kbd "<menu>"))
(global-set-key (kbd "C-x M-t") 'transpose-sentences)
(global-unset-key (kbd "C-<delete>"))   ; Default: kill-word (shared with M-d)
                                        ; and I use M-d far more often
(global-set-key (kbd "C-<delete>") 'delete-region)

;; Having M-z (note lowercase) bound to zap-to-char by default is great, but
;; it’s nice to be able to easily invoke zap-up-to-char as well
(global-set-key (kbd "M-Z") 'zap-up-to-char)

;; Default ‘C-h a’ is nice, but it only shows commands.  Removing the binding
;; allows me to make ‘C-h a’ a prefix instead.  So now I can drill down.
(global-unset-key (kbd "C-h a"))
;; a for "a"ny/"a"ll, for when I don’t know what kind of thing I need
(global-set-key (kbd "C-h a a") 'apropos)
(global-set-key (kbd "C-h a c") 'apropos-command)
(global-set-key (kbd "C-h a f") 'apropos-function)
(global-set-key (kbd "C-h a v") 'apropos-variable)
