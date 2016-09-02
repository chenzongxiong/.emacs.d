;; package management
(when (>= emacs-major-version 24)
  (add-to-list 'package-archives
                '("gnu" . "http://elpa.gnu.org/packages/"))
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/")
               t)
  ;; Define default packages
  (defvar czx/packages '(
                         ;; packages management
                         ecb
                         helm
                         helm-gtags
                         jedi
                         elpy

                         angular-mode
                         dockerfile-mode
                         go-mode
                         json-mode
                         nginx-mode
                         python-mode
                         scala-mode
                         yaml-mode

                         angular-snippets
                         yasnippet
                         ac-html
                         auto-complete
                         iedit
                         autopair
                         python-pep8
                         dired-filter
                         flymake-jslint
                         flymake-yaml
                         httpcode
                         browse-kill-ring
                         vlf
                         ;; edbi-sqlite
                         ;; eshell-git-prompt
                         ;; git
                         ;; gerrit-download
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
