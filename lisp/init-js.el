;;; Package -- Summary
;;; Code:
;;; Commentary:

(setq my/indent-offset 2)
(setq js2-include-node-externs t)

;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; use local eslint from node_modules before global
;; http://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))
(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

;; adjust indents for web-mode to my/indent-offset spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents."
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset my/indent-offset)
  (setq web-mode-css-indent-offset my/indent-offset)
  (setq web-mode-code-indent-offset my/indent-offset))
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
    ad-do-it))

(defun set-jsx-indentation ()
  (setq-local sgml-basic-offset my/indent-offset))
(add-hook 'js-jsx-mode-hook #'set-jsx-indentation)

(setq js-indent-level my/indent-offset)
(setq js2-basic-offset my/indent-offset)
(setq sgml-basic-offset my/indent-offset)
(setq typescript-indent-level my/indent-offset)
(setq indent-tabs-mode t)

(provide 'init-js)

;;; init-js.el ends here
