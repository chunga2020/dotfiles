(setq custom-file (locate-user-emacs-file "custom.el"))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq straight-use-package-by-default t)

;; Packages
(load-file (locate-user-emacs-file "package-config.el"))

;; Text editing options
(load-file (locate-user-emacs-file "editing.el"))

;; Consolidate backup files
(setq backup-directory-alist '(("." . "~/.local/state/emacs/backups"))
      auto-save-list-file-prefix 'nil
      auto-save-list-file-name 'nil)

;; Enable disabled commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; Keybinds
(load-file (locate-user-emacs-file "keybinds.el"))

;; Useful functions
(load-file (locate-user-emacs-file "functions.el"))
