;; package management
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives
                '("gnu" . "http://elpa.gnu.org/packages/"))
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize)
  ;; Define default packages
  (defvar czx/packages '(
                         ;; packages management
                         yasnippet
                         auto-complete
                         auto-complete-c-headers
                         iedit
                         flymake-google-cpplint
                         google-c-style
                         flymake-cursor
                         ;; python
                         autopair
                         ;; coffee-mode
                         ;; markdown-mode
                         ;; puppet-mode
                         ;; ;; python
                         jedi elpy
                         python-pep8
                         python-mode ipython
                         ;; dired
                         ;; dired-avfs
                         dired-rainbow dired-filter
                         ;; ;;
                         ;; web-mode
                         ;; writegood-mode
                         ;; ;; yaml
                         ;; yaml-mode
                         ;; ;; highlighting
                         ;; idle-highlight-mode highlight-symbol highlight-numbers highlight-quoted
                         ;; LaTeX
                         auctex
                         ;; ;; themeing
                         ;; rainbow-mode leuven-theme dakrone-theme
                         ;; color-identifiers-mode moe-theme nyan-mode
                         ;; flatui-theme smyx-theme monokai-theme
                         ;; ;; helm
                         ;; helm-descbinds helm-ag helm-projectile helm-swoop
                         helm
                         helm-gtags
                         ;; ggtags
                         ;; ;; eshell
                         ;; eshell-prompt-extras
                         ;; ;;
                         ecb
                         ;; function-args
                         plantuml-mode
                         ;; git
                         ;; magit
                         ;; git github-theme gitignore-mode magit magit-popup
                         ;; magit-gitflow magit-gerrit
                         ;; dictionary
                         dictionary
                         ;; youdao-diction     ;; theme
                         color-theme-monokai
                         ;; sql mode
                         sql-indent sqlup-mode
                         ;; http
                         http httpcode
                         ;; json mode
                         json-mode
                         ;;
                         golden-ratio god-mode
                         ;;
                         w3
                         ;; javascript
                         js-doc js2-refactor js3-mode ac-js2
                         ;; php
                         php-auto-yasnippets ac-php ac-html php-mode
                         ;;
                         browse-kill-ring
                         ;;
                         evil
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
