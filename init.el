(if (>= emacs-major-version 24)
    (progn
      (require 'cl)
      (require 'package)
      (package-initialize)
      (push "~/.emacs.d/lisp" load-path)
      (setq dired-use-ls-dired nil)
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
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(ecb-layout-window-sizes
   (quote
    (("left9"
      (ecb-methods-buffer-name 0.24 . 0.9821428571428571)))))
 '(ecb-options-version "2.40")
 '(package-selected-packages
   (quote
    (go-mode yaml-mode windresize web-mode vlf sqlup-mode sql-indent python-pep8 python-mode plantuml-mode nginx-mode json-mode js3-mode js2-refactor js-doc jedi ipython iedit httpcode helm-gtags gnugo flymake-yaml flymake-cursor elpy dired-rainbow dired-filter color-theme-monokai browse-kill-ring autopair auto-complete-c-headers ace-window ac-js2)))
 '(python-shell-interpreter "ipython")
 '(python-shell-virtualenv-path "/usr/local/bin/virtualenv"))
