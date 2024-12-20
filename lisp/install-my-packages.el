;;; Package -- Summary
;;; Code:
;;; Commentary:

;; package management
(when (>= (string-to-number emacs-version) 26.3)           ; helm needs 26.3 or above
  (add-to-list 'package-archives
               '("gnu" . "http://elpa.gnu.org/packages/"))
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/")
               ;; (add-to-list 'package-archivesn
               ;;              '("popkit" . "http://elpa.popkit.org/packages/") ; packages maintained in China
               t)
  ;; Install default packages
  (defun zxchen/packages-installed-p ()
    (cl-loop for pkg in package-selected-packages
             when (not (package-installed-p pkg)) do (cl-return nil)
             finally (return t)))

  (unless (zxchen/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg package-selected-packages)
      (when (not (package-installed-p pkg))
        (ignore-errors (package-install pkg))))))


(provide 'install-my-packages)

;;; install-my-packages.el ends here
