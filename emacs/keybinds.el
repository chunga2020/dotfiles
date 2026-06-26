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

;; taken from https://yavchn.parkscomputing.com/hn/s/48535886
(defvar-keymap help-apropos-map
  :doc "Keymap for apropos subcommands."
  "a"   #'apropos
  "l"   #'apropos-library
  "f"   #'apropos-function
  "x"   #'apropos-command
  "v"   #'apropos-variable
  "V"   #'apropos-local-variable
  "u"   #'apropos-user-option
  "d"   #'apropos-documentation
  "C-f" #'customize-apropos-faces
  "g"   #'customize-apropos-groups
  "o"   #'customize-apropos-options
  "c"   #'customize-apropos
  "i"   #'info-apropos)
(keymap-set help-map "a" help-apropos-map)
