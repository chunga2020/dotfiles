;; Always add final newline to the end of a file
(setq require-final-newline t)

;; I typically use 4 spaces per tab
(setq tab-width 4)
(setq c-basic-offset 4)
;; spaces > tabs
(setq-default indent-tabs-mode nil)

;; Automatic closing of matched delimiters; also provides overtype of
;; auto-inserted closing symbols
(electric-pair-mode t)
(setq electric-pair-delete-adjacent-pairs t)
