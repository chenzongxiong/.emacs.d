(if (>= emacs-major-version 24)
    (progn
      (require 'cl)
      (load-file "~/.emacs.d/general-settings.el")
      (load-file "~/.emacs.d/mypackages.el")
      (load-file "~/.emacs.d/packages-settings.el")
      ;; if the system-type if darwin
      (when (eq system-type 'darwin)
        (setq mac-command-modifier nil)
        (setq mac-option-modifier 'meta)
        (load-file "~/.emacs.d/third-part-loading.el"))
      )
  (message "Please Update the emacs")
)
