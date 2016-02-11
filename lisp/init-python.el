;; Python Ide
(require 'jedi)
(setq jedi:complete-on-dot t)
(setq jedi:tooltip-method t)

(require 'elpy)
(elpy-enable)
(setq elpy-rpc-backend "jedi")

(provide 'init-python)
