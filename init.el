(if (>= emacs-major-version 24)
    (progn
      (require 'cl)
      (require 'package)
      (package-initialize)
      (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
      (setq dired-use-ls-dired nil)
      (require 'general-settings)
      (require 'mypackages)
      (require 'packages-settings)
      (message "Please Update the emacs")))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(company-tooltip ((t (:foreground "magenta")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(ecb-layout-window-sizes
   (quote
    (("left9"
      (ecb-methods-buffer-name 0.24 . 0.9821428571428571)))))
 '(ecb-options-version "2.40")
 '(package-selected-packages
   (quote
    (php-mode flycheck-irony irony google-c-style yaml-mode web-mode vlf scala-mode rtags python-mode py-autopep8 nginx-mode modern-cpp-font-lock json-mode jedi iedit httpcode helm-gtags flymake-yaml flymake-google-cpplint flymake-cppcheck flycheck elpy ecb dockerfile-mode dired-filter cmake-mode cmake-ide browse-kill-ring autopair))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
