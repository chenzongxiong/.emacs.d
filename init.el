(if (>= emacs-major-version 24)
    (progn
      (require 'cl)
      (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
      (load-file "~/.emacs.d/general-settings.el")
      (load-file "~/.emacs.d/mypackages.el")
      ;; (load-file "~/.emacs.d/packages-settings.el")
      (require 'packages-settings)
  (message "Please Update the emacs")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t (:foreground "magenta")))))
