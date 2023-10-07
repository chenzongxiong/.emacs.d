;;; Package -- Summary
;;; Code:
;;; Commentary:

(defalias 'list-buffers 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("org" ;; all org-releated buffers
                (mode . org-mode))
               ("helm" ;; all helm-releated buffers
                (predicate string-match "Helm" mode-name))
               ("directory"
                (mode . dired-mode))
               ("code" ;; prog stuff not already in MyProjectX
                (or
                 (mode . c-mode)
                 (mode . c++-mode)
                 (mode . python-mode)
                 (mode . ruby-mode)
                 (mode . emacs-lisp-mode)
                 ))
               ("conf"
                (mode . conf-mode)
                (mode . json-mode)
                (mode . yaml-mode)
                (mode . xml-mode)
                (mode . nxml-mode)
                )
               ))))
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (require 'ibuffer)
            (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'init-ibuffer)

;;; init-ibuffer.el ends here
