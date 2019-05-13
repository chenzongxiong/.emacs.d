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
                              (elpy-enable)))

(setq py-autopep8-options
      '("--max-line-length=100"))
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
;; (setenv "IPY_TEST_SIMPLE_PROMPT" "1")

(setq python-shell-virtualenv-path "~/.emacs.d/.python-environments/default")

(provide 'init-python)
