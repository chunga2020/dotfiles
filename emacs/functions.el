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
  (if (display-graphic-p (selected-frame))
    (progn (global-hl-line-mode))
    (error "Not running in a GUI frame.")))

(defun read-list (prompt &optional reverse-list)
  "Read a list of strings from the minibuffer, prompting with PROMPT.

REVERSE-LIST, if non-nil, reverses the list after the last element is
added."
  (let ((input nil)
        (list ()))
    (while (not (string= input ""))
      (setq input (read-string (concat prompt " (leave blank to finish): ")))
      (unless (string= input "")
        (setq list (cons input list))))
    (if (not reverse-list)
        (reverse list)
      list)))

(defun countdown-which-album (days-left)
  "Display which of a band's albums to play.

This function helps you build hype for a concert by having you listen to
albums in sequence in the days up to the show.  DAYS-LEFT should be a
non-negative integer corresponding to how many days are left before the
show."
  (interactive "nDays left: ")
  (let ((albums (read-list "Album title:" t)))
        (when (length< albums 2)
          (error "ALBUMS should have at least two elements."))
        (when (<= days-left 0)
          (error "Should have non-negative number of days left."))
        (let* ((count (length albums))
               (album-index (% days-left count))
               (the-album (nth album-index albums)))
          (message "Today's album is %s" the-album))))
