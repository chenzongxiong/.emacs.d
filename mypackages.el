;; package management
(when (>= emacs-major-version 24)
  (add-to-list 'package-archives
                '("gnu" . "http://elpa.gnu.org/packages/"))
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)
  ;; Define default packages
  (defvar czx/packages '(
                         ;; packages management
                         ;; helm
                         helm
                         helm-gtags

                         yasnippet
                         auto-complete
                         auto-complete-c-headers
                         iedit
                         flymake-cursor
                         ;; python
                         autopair
                         ;; markdown-mode
                         ;; puppet-mode
                         ;; ;; python
                         jedi elpy
                         python-pep8
                         python-mode ipython
                         ;; dired
                         ;; dired-avfs
                         dired-rainbow dired-filter
                         ;;
                         web-mode
                         ;; writegood-mode
                         ;; yaml
                         yaml-mode
                         flymake-yaml
                         plantuml-mode
                         ;; git
                         ;; magit
                         ;; git github-theme gitignore-mode magit magit-popup
                         ;; magit-gitflow magit-gerrit
                         ;; dictionary
                         color-theme-monokai
                         ;; sql mode
                         sql-indent sqlup-mode
                         ;; http
                         http httpcode
                         ;; json mode
                         json-mode
                         ;; javascript
                         js-doc js2-refactor js3-mode ac-js2
                         ;; kill rings
                         browse-kill-ring
                         vlf
                         gnugo
                         ace-window
                         windresize
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

(provide 'mypackage)
