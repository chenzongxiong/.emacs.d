;;;###autoload
(defun create-tags (dir-name)
  "Create TAGS file."
  (interactive "DDirectory: ")
  (eshell-command
   (format "find . -type f -iname \"*.scala\" | etags -" dir-name)))

(provide 'init-tags)
