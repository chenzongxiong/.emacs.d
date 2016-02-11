;; helm settings
(require 'helm)
(require 'helm-config)
(setq helm-split-window-in-side-p t     ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp t    ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount 8                ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t) ;
(helm-mode 1)
(helm-autoresize-mode t)
;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; for buffers
(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
;; for files
(global-set-key (kbd "C-x C-f") 'helm-find-files)
;; for semantic
(global-set-key (kbd "C-c h i") 'helm-semantic-or-imenu)
(global-set-key (kbd "C-x c f") 'helm-multi-files)
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match t)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(provide 'init-helm)
