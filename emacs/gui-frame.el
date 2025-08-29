;; Settings only applicable when in a GUI frame.
;;
;; This is meant to be loaded on-demand

(if (display-graphic-p)
    (progn (telephone-line-mode t)
           (darkman-mode t)
           (global-hl-line-mode t))
  (error "Not running in a GUI frame."))
