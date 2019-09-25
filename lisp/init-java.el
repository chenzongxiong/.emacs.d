;;; Package -- Summary
;;; Code:
;;; Commentary:

(autoload 'jde-mode "jde" "JDE mode" t)
(setq auto-mode-alist
      (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))

(provide 'init-java)


;;; init-java.el ends here
