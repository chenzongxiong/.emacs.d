(when (< (string-to-number emacs-version) 26.3)           ; helm needs 26.3 or above
  (defconst package-check-signature nil))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(conda-anaconda-home "/opt/homebrew/Caskroom/miniconda/base")
 '(custom-enabled-themes '(tsdh-dark))
 '(ecb-layout-window-sizes
   '(("left9"
      (ecb-methods-buffer-name 0.24 . 0.9821428571428571))))
 '(ecb-options-version "2.50")
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-selected-packages
   '(conda pip-requirements vue-html-mode vue-mode flex-autopair simple-httpd lsp-mode typescript-mode flycheck-kotlin mvn kotlin-mode rdf-prefix go-mode caddyfile-mode rust-auto-use rust-mode cargo-mode graphql graphql-mode prettier exec-path-from-shell docker tablist magit jinja2-mode racer editorconfig-generate editorconfig rustic helm-c-moccur helm-ag flycheck-rust cargo password-vault password-generator nasm-mode yasnippet-snippets irony-eldoc websocket web-server rjsx-mode eslint-fix yaml-mode web-mode vlf scala-mode python-mode py-autopep8 php-mode nginx-mode modern-cpp-font-lock markdown-mode json-mode jedi iedit httpcode htmlize helm-gtags google-c-style flymake-yaml flymake-solidity flymake-eslint flycheck-irony elpy ecb dockerfile-mode dired-filter company-solidity company-rtags company-irony-c-headers cmake-mode cmake-ide browse-kill-ring))
 '(tab-width 2)
 '(warning-suppress-types '((emacs))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq byte-compile-warnings '(cl-functions)) ; suppress the warning message `cl is deprecated`
(defconst dired-use-ls-dired nil)
(require 'package)
(package-initialize)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'install-my-packages)
(require 'general-settings)
(require 'packages-settings)
