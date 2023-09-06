(require 'yaml-mode)
(require 'flymake-yaml)
(defconst yaml-indent-offset 2)

(add-to-list 'auto-mode-alist '("\\.sls$" . yaml-mode))

(provide 'init-yaml)
