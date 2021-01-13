(if (>= emacs-major-version 24)
    (progn
      (require 'cl)
      (require 'package)
      (package-initialize)
      (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
      (setq dired-use-ls-dired nil)
      (require 'general-settings)
      (require 'mypackages)
      (require 'packages-settings)
      (message "Please Update the emacs")))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(company-tooltip ((t (:foreground "magenta")))))

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
 '(ecb-options-version "2.50")
 '(elpy-syntax-check-command "~/.venv3/bin/flake8")
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-agenda-files (quote ("~/Desktop/TODO.org")))
 '(package-selected-packages
   (quote
    (typescript-mode racer editorconfig-generate editorconfig lsp-mode rustic helm-c-moccur helm-ag flycheck-rust cargo password-vault password-generator org-password-manager id-manager pbcopy nasm-mode yasnippet-snippets irony-eldoc company-irony websocket web-server flymake-haskell-multi dante haskell-mode haskell-snippets haskell-tab-indent rjsx-mode eslint-fix yaml-mode web-mode vlf scala-mode python-mode py-autopep8 pug-mode php-mode nginx-mode modern-cpp-font-lock markdown-preview-eww markdown-mode latex-math-preview json-mode jedi iedit httpcode htmlize helm-gtags google-c-style flymake-yaml flymake-solidity flymake-google-cpplint flymake-eslint flymake-cppcheck flycheck-irony elpy ecb dockerfile-mode dired-filter company-solidity company-rtags company-irony-c-headers company-bibtex company-auctex cmake-mode cmake-ide browse-kill-ring bibtex-utils autopair ac-js2)))
 '(pyvenv-activate "~/.venv3")
 '(tab-width 4))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
