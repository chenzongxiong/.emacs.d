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
                         jedi
                         elpy
                         python-pep8
                         python-mode
                         dired-filter
                         yaml-mode
                         flymake-yaml
                         httpcode
                         json-mode
                         browse-kill-ring
                         vlf
                         nginx-mode
                         go-mode
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
