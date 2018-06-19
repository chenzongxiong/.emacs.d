;; Python Ide
(setq jedi:complete-on-dot t)
(setq jedi:tooltip-method t)
(setq elpy-rpc-backend "jedi")
(setq python-indent-guess-indent-offset nil)

(add-hook 'python-mode-hook (lambda ()
                              ;; pip install jedi, epc
                              (require 'jedi)
                              (require 'elpy)
                              (jedi:setup)
                              (elpy-enable)))

(setq py-autopep8-options
      '("--max-line-length=100"))
(setq python-shell-interpreter "ipython")
(setq python-shell-virtualenv-path "/usr/local/bin/virtualenv")

(provide 'init-python)
