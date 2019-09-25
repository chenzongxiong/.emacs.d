;;; Package -- Summary
;;; Code:
;;; Commentary:

;;;###autoload
(defun create-tags (dir-name suffix)
  (setq command-str (format "find %s -type f -iname \"*.%s\" | etags -o %sTAGS -" dir-name suffix (file-name-directory (directory-file-name dir-name))))
  (message "Command to run: %s" command-str)
  (eshell-command command-str))


;;;###autoload
(defun create-java-tags (dir-name)
     "Create Java TAGS file."
     (interactive "DDirectory: ")
     (create-tags dir-name "java"))

;;;TODO
;;; create-c++-tags

(provide 'utils)

;;; utils.el ends here
