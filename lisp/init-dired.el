;;; Package -- Summary
;;; Code:
;;; Commentary:

(add-hook 'dired-load-hook #'(lambda ()
                               (require 'wdired)
                               (require 'dired-x)
                               (defconst wdired-allow-to-change-permissions t)
                               (defconst dired-omit-mode t)
                               (defconst dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$|\\.pyc$\\|\\.DS_Store$\\|__pycache__$\\|^\\.git\\|\\.zcompdump.*")
                               ))
;; you can modify the files attributes in dired
;;
(provide 'init-dired)

;;; init-dired.el ends here
