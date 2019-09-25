;;; Package -- Summary
;;; Code:
;;; Commentary:

(add-to-list 'auto-mode-alist '("\\.sls$" . yaml-mode))
;; (require 'yaml-mode)

;; (require 'flymake-yaml)
;; (require 'json)
;; (require 'json-mode)

(require 'init-dired)
(require 'init-autopair)
(require 'init-helm)
(require 'init-ibuffer)
(require 'init-python)
(require 'init-c)
;; (require 'yasnippet) ; cost less
(require 'init-code-folding)
;; (require 'init-auto-complete)
;; (require 'init-sql) ; cost less

;; (require 'init-org)
(require 'init-simple-httpd)
(require 'init-web)

;; ;; ;; start yasnippet with emacs
;; ;; (setq yas-snippet-dirs yas-installed-snippets-dir)
;; ;; (yas-global-mode 1)
;; ;; ;; Fix a key binding bug in elpy
;; ;; (define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

;; ;; http client for emacs
;; ;; (require 'http)
;; ;; ;; C-c, C-c --> http-process
;; ;; ;; some useful links
;; ;; ;; https://github.com/emacs-pe/http.el
;; ;; ;; https://github.com/gregsexton/httprepl.el
;; ;; ;; https://github.com/pashky/restclient.el
;; ;; ;; httpcode

;; ;; ;; it's a good tool to query the httpcode state offline
;; ;; ;; M-x hc RET Enter HTTP code: 500 RET
;; ;; ;; json-mode setting
;; ;; ;; they're just local key define
;; ;; ;; C-c C-f: format the region/buffer with json-reformat (https://github.com/gongo/json-reformat)
;; ;; ;; C-c C-p: display a path to the object at point with json-snatcher (https://github.com/Sterlingg/json-snatcher)
;; (require 'init-tags)
(require 'utils)
(require 'init-js)
;; (require 'init-java)
(provide 'packages-settings)

;;; packages-settings.el ends here
