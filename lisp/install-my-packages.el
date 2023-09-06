;;; Package -- Summary
;;; Code:
;;; Commentary:

;; package management
(when (>= (string-to-number emacs-version) 24.4)           ; helm needs 24.4 or above
  (add-to-list 'package-archives
               '("gnu" . "http://elpa.gnu.org/packages/"))
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/")
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
        (package-install pkg)))))


(provide 'install-my-packages)

;;; install-my-packages.el ends here
