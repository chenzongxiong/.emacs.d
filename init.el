(if (>= emacs-major-version 24)
    (progn
      (require 'cl)
      (load-file "~/.emacs.d/general-settings.el")
      (load-file "~/.emacs.d/OS-specific.el")
      (load-file "~/.emacs.d/mypackages.el")
      (load-file "~/.emacs.d/packages-settings.el")
      (load-file "~/.emacs.d/third-part-loading.el"))
  (message "Please Update the emacs"))
(put 'erase-buffer 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t (:foreground "magenta")))))
