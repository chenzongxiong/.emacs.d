;;; Package -- Summary
;;; Code:
;;; Commentary:

;; Python Ide
(setq jedi:complete-on-dot t)
(setq jedi:tooltip-method t)
(setq elpy-rpc-backend "jedi")
(setq python-indent-guess-indent-offset nil)

(add-hook 'python-mode-hook (lambda ()
                              ;; pip install jedi, epc
                              (require 'jedi)
                              (require 'elpy)
                              ;; (elpy-use-ipython)
                              (jedi:setup)
                              ;; (elpy-disable)
                              (elpy-enable)
                              ))

(setq py-autopep8-options
      '("--max-line-length=100"))
(setq python-shell-interpreter "~/.venv3/bin/ipython"
      python-shell-interpreter-args "-i --simple-prompt")
;; (setenv "IPY_TEST_SIMPLE_PROMPT" "1")

;; (setq python-shell-virtualenv-path "/usr/local/bin/virtualenv")
;; (setq python-shell-virtualenv-path "/home/zxchen/.local/bin/virtualenv")
;; (eldoc-message (format "%s%s" prefix args))

;; /home/zxchen/.venv3/bin/flake8

(global-eldoc-mode -1)
(provide 'init-python)

;;; init-python.el ends here
