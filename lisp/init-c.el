(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

;; (semantic-mode 1)
;; (semanticdb-enable-gnu-global-databases 'c-mode t)
;; (semanticdb-enable-gnu-global-databases 'c++-mode t)

;; (global-ede-mode 1)
;; (ede-enable-generic-projects)
;; (require 'semantic/ia)

;; (require 'semantic/db)
;; (global-semanticdb-minor-mode 1)
;; (setq-mode-local c-mode
;;                  semanticdb-find-default-throttle
;;                  '(project unloaded system recursive))
;; (setq-mode-local c++-mode
;;                  semanticdb-find-default-throttle
;;                  '(project unloaded system recursive))

;; ;; (setq semanticdb-default-file-name "semantic.cache")
;; (setq semanticdb-default-file-name ".semanticdb")
;; ;; (setq semanticdb-default-save-directory "~/.emacs.d/semanticdb")
;; (setq semanticdb-default-save-directory "./")
;; (setq semanticdb-default-system-save-directory "~/.semanticdb")
;; ;; (semanticdb-create-ebrowse-database semanticdb-default-system-save-directory)
;; ;; (semantic-idle-completions-mode 1)
;; ;; smart jump
;; ;; TODO: key binding for (semantic-ia-fast-jump)
;; ;;
;; (semantic-idle-scheduler-mode 1)
;; (setq semantic-idle-scheduler-max-buffer-size 104857600)
;; (setq semantic-idle-scheduler-working-in-modeline-flag t)
;; (require 'semantic/bovine/gcc)
;; (require 'semantic/bovine/clang)
;; (require 'semantic/sb)  ; enable speedbar, just like dired, buffer
(provide 'init-c)
