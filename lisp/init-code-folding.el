;; folding or unfolding code
;; Todo: hs-minor-mode
(defun hs-enable-and-toggle ()
  (interactive)
  (hs-minor-mode 1)
  (hs-toggle-hiding))
(defun hs-enable-and-hideshow-all (&optional arg)
  "Hide all blocks. If prefix argument is given, show all blocks"
  (interactive "P")
  (hs-minor-mode)
  (if arg
      (hs-show-all)
    (hs-hide-all)))
(global-set-key (kbd "C-c C-h") 'hs-enable-and-toggle)
(global-set-key (kbd "C-c C-j") 'hs-enable-and-hideshow-all)

(provide 'init-code-folding)
