(if (>= emacs-major-version 25)
    (progn
      (require 'cl)
      (require 'package)
      (package-initialize)
      (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
      (require 'general-settings)
      (require 'mypackages)
      (require 'packages-settings)
  (message "Please Update the emacs")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t (:foreground "magenta")))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (go-mode yaml-mode windresize web-mode vlf sqlup-mode sql-indent python-pep8 python-mode plantuml-mode nginx-mode json-mode js3-mode js2-refactor js-doc jedi ipython iedit httpcode helm-gtags gnugo flymake-yaml flymake-cursor elpy dired-rainbow dired-filter color-theme-monokai browse-kill-ring autopair auto-complete-c-headers ace-window ac-js2))))
