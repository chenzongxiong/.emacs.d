;;; Package -- Summary
;;; Code:
;;; Commentary:

;;;###autoload
(defun create-java-tags (dir-name)
  "Create Java TAGS file.  `DIR-NAME`."
  (interactive "DDirectory: ")
  (defvar command-str
    (format "find %s -type f -iname \"*.java\" | etags -o %sTAGS -" dir-name (file-name-directory (directory-file-name dir-name))))
  (eshell-command command-str))


;;;###autoload
(defun create-c++-tags (dir-name)
  "Create C++ TAGS file.  `DIR-NAME`."
  (interactive "DDirectory: ")
  (defvar command-str
    (format "find %s -type f -iname \"*.hpp\" -o -iname \"*.cpp\" -o -iname \"*.c\" -o -iname \"*.h\" | etags -o %sTAGS -" dir-name
            (file-name-directory (directory-file-name dir-name))))
  (message "Command to run: %s" command-str)
  (eshell-command command-str))


(provide 'utils)

;;; utils.el ends here
