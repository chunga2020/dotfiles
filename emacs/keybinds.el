(global-unset-key (kbd "<menu>"))
(global-set-key (kbd "C-x M-t") 'transpose-sentences)
(global-unset-key (kbd "C-<delete>"))   ; Default: kill-word (shared with M-d)
                                        ; and I use M-d far more often
(global-set-key (kbd "C-<delete>") 'delete-region)
