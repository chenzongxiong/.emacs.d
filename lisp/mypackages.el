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
                         scala-mode
                         dockerfile-mode

                         helm
                         helm-gtags
                         yasnippet
                         auto-complete
                         iedit
                         autopair
                         ;; markdown-mode
                         jedi
                         elpy
                         python-pep8
                         python-mode
                         ipython
                         ;; dired
                         ;; dired-avfs
                         dired-filter
                         ;;
                         web-mode
                         ;; writegood-mode
                         yaml-mode
                         flymake-yaml
                         ;; plantuml-mode
                         ;; git github-theme gitignore-mode magit magit-popup
                         ;; magit-gitflow magit-gerrit
                         ;; dictionary
                         ;; sql-indent
                         ;; sqlup-mode
                         gerrit-download
                         magit
                         password-generator
                         password-vault
                         format-sql
                         httpcode
                         json-mode
                         js-doc
                         js2-refactor
                         js3-mode
                         ac-js2
                         browse-kill-ring
                         vlf
                         gnugo
                         ace-window
                         windresize
                         nginx-mode
                         go-mode
                         circe
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
