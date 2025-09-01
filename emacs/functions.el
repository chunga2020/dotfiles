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
    (progn (telephone-line-mode t)
           (darkman-mode t)
           (global-hl-line-mode))
    (error "Not running in a GUI frame.")))

(defun countdown-which-album (albums days-left)
  "Display which of a band's albums to play.

This function helps you build hype for a concert by having you listen to
albums in sequence in the days up to the show.  ALBUMS should be a list
of the titles of the albums in question.  This list should have at least
one element.  DAYS-LEFT should be a non-negative integer corresponding
to how many days are left before the show."
  (interactive "XAlbum list: \nnDays left: ")
  (when (length< albums 2)
    (error "ALBUMS should have at least two elements."))
  (when (<= days-left 0)
    (error "Should have non-negative number of days left."))
  (let* ((count (length albums))
         (album-index (% days-left count))
         (albums-reverse (reverse albums))
         (the-album (nth album-index albums-reverse)))
    (message "Today's album is %s" the-album)))
