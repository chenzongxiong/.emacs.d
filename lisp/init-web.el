;;; Package -- Summary
;;; Code:
;;; Commentary:


(require 'web-mode)
;; (require 'web-beautify)
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
(setq web-mode-enable-current-column-highlight t)
(setq web-mode-enable-current-element-highlight t)
(require 'httpcode)

(provide 'init-web)

;;; init-web.el ends here
