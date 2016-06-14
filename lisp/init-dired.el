(add-hook 'dired-load-hook '(lambda ()
                              (require 'wdired)))
;; you can modify the files attributes in dired
(setq wdired-allow-to-change-permissions t)
(add-hook 'dired-load-hook '(lambda ()
                              (require 'dired-x)))
(setq dired-omit-mode t)
(setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$|.pyc$")
(provide 'init-dired)
