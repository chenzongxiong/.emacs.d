;; helm settings
(require 'helm)
;; (require 'helm-config)
(setq helm-split-window-in-side-p t     ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp t    ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount 8                ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t) ;

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
;; ;; for buffers
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; the following command will take a second
;; (helm-mode 1)
(provide 'init-helm)
