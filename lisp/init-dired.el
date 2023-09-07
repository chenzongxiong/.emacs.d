;;; Package -- Summary
;;; Code:
;;; Commentary:

(add-hook 'dired-load-hook #'(lambda ()
                               (require 'wdired)
                               (defconst wdired-allow-to-change-permissions t)
                               ))
;; you can modify the files attributes in dired

(add-hook 'dired-load-hook
          #'(lambda ()
              (require 'dired-x)
              (defconst dired-omit-mode t)
              (defconst dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$|\\.pyc$\\|\\.DS_Store$\\|__pycache__\\|^\\.git\\|\\.zcompdump.*")
              ))

;;
(provide 'init-dired)

;;; init-dired.el ends here
