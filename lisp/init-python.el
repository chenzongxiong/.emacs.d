;; Python Ide
(setq jedi:complete-on-dot t)
(setq jedi:tooltip-method t)
(setq elpy-rpc-backend "jedi")
(setq python-indent-guess-indent-offset nil)

(add-hook 'python-mode-hook (lambda ()
                              (require 'jedi)
                              (require 'elpy)
                              (jedi:setup)
                              (elpy-enable)))

(provide 'init-python)
