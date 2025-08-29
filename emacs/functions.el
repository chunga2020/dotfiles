(defun start-vterm-with-name (&optional split-lines)
  "Prompt for a split type and name, and start a new vterm buffer.
If split-lines is supplied, resize the new window using `shrink-window'."
  (interactive "p")
  (setq horizontal-p (y-or-n-p "Horizontal split? "))
  (if horizontal-p
      (split-window-horizontally)
    (split-window-vertically))
  (other-window 1)
  (if split-lines
      (shrink-window split-lines horizontal-p)) ; delta value is unimportant.
                                                ; Just pass it along and let
                                                ; shrink-window handle it
  (vterm (read-from-minibuffer "Enter name for the new terminal buffer: ")))

(defun setup-gui-frame ()
  "Set options that I prefer to have in GUI frames only."
  (interactive)
  (when (display-graphic-p)
    (progn (telephone-line-mode t)
           (darkman-mode t)
           (global-hl-line-mode))))
