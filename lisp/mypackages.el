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
  ;; Define default packages
  (defvar czx/packages '(
                         ;; packages management
                         ecb
                         helm
                         helm-gtags

                         jedi
                         elpy
                         py-autopep8

                         ;; angular-mode
                         dockerfile-mode
                         ;; go-mode
                         json-mode
                         nginx-mode
                         python-mode
                         scala-mode
                         yaml-mode

                         ;; angular-snippets
                         ;; yasnippet
                         ;; ac-html
                         ;; auto-complete
                         iedit
                         autopair
                         ;; python-pep8

                         dired-filter
                         ;; flymake-jslint

                         flycheck
                         flymake-yaml
                         httpcode
                         browse-kill-ring
                         vlf
                         web-mode
                         ;; magit
                         ;; c++ ide
                         cmake-ide
                         cmake-mode
                         rtags
                         modern-cpp-font-lock
                         flymake-google-cpplint
                         flymake-cppcheck
                         google-c-style

                         irony
                         flycheck-irony
                         rtags
                         company-rtags
                         company-irony-c-headers

                         ;; solidity
                         ;; company-solidity
                         flymake-solidity
                         solidity-mode

                         ;; jdee
                         rjsx-mode
                         simple-httpd

                         ;; haskell
                         haskell-mode
                         haskell-tab-indent
                         haskell-snippets
                         dante
                         ac-haskell-process
                         flymake-haskell-multi
                         )
    "Default packages")
  ;; Install default packages
  (defun czx/packages-installed-p ()
    (loop for pkg in czx/packages
          when (not (package-installed-p pkg)) do (return nil)
          finally (return t)))

  (unless (czx/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg czx/packages)
      (when (not (package-installed-p pkg))
        (package-install pkg)))))


(provide 'mypackages)

;;; mypackages.el ends here
