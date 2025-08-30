(global-unset-key (kbd "<menu>"))
(global-set-key (kbd "C-x M-t") 'transpose-sentences)
(global-unset-key (kbd "C-<delete>"))   ; Default: kill-word (shared with M-d)
                                        ; and I use M-d far more often
(global-set-key (kbd "C-<delete>") 'delete-region)

;; Default ‘C-h a’ is nice, but it only shows commands.  Re-binding it to
;; execute ‘apropos’ might make the result list much longer, but that’s a
;; worthwhile trade for having it return results of all types
(global-unset-key (kbd "C-h a"))
(global-set-key (kbd "C-h a c") 'apropos-command)
(global-set-key (kbd "C-h a f") 'apropos-function)
(global-set-key (kbd "C-h a v") 'apropos-variable)
