;; start auto-complete with emacs
(require 'auto-complete)
;; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
;; start yasnippet with emacs
(require 'yasnippet)
(setq yas-snippet-dirs yas-installed-snippets-dir)
(yas-global-mode 1)
;; Fix a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
;; fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)
;; helm settings
(require 'helm)
(require 'helm-config)
(setq helm-split-window-in-side-p t
      helm-move-to-line-cycle-in-source t
      helm-ff-search-library-in-sexp t
      helm-scroll-amount 8
      helm-ff-file-name-history-use-recentf t)
(helm-autoresize-mode t)
(helm-mode 1)
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
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x
;; Python Ide
;; TODO:
;;   cannot pop up python function information
;;   cannot jump to the definination of function
;; (message "%s" features)
(require 'json)
(when (require 'elpy nil t)           ; load `eply' first, or it will confict with `python-mode.el' confusing
  (elpy-enable)
  (if (member 'python-mode ac-modes)
      (setq ac-modes (delete 'python-mode ac-modes))) ; just using elpy's autocomplete
  (setq elpy-rpc-backend "jedi"))                     ; set backend as `jedi'
(require 'jedi)
(setq jedi:complete-on-dot t)
(setq jedi:tooltip-method t)
;; turn on autopair mode
(require 'autopair)
(autopair-global-mode)
;; org-mode
(require 'org)
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (ditaa . t)
   (python . t)
   (perl . t)
   (C . t)
   (sh . t)
   (sql . t)
   (ruby . t)
   (java . t)
   (js . t)
   ))

;; Extended use of TODO keywords
(setq org-todo-keywords
      '((sequence "TODO(t)" "DONE(d)" "MARK(m)")
        (sequence "REPORT(r)" "BUG(b)" "FIXED(f)")
        (sequence "CANCELD(c)")))
;; C-c '    --> org-edit-special & optional ARG
;; C-c, C-t --> org-todo
;; C-c a t  --> org-todo-list
;; C-c, / t --> org-show-todo-list
;; S-M-RET  --> org-insert-todo-heading
;; (setq org-agenda-files
;;      (directory-files "/home/czx/test/snippets/org" t "org$"))

;; ibuffer settings
;; make ibuffer default
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("Org" ;; all org-releated buffers
                (mode . org-mode))
               ("Helm" ;; all helm-releated buffers
                (predicate string-match "Helm" mode-name))
               ("Debugger" ;;
                (mode . debugger-mode))
               ("Dired"
                (mode . dired-mode))
               ("Programming" ;; prog stuff not already in MyProjectX
                (or
                 (mode . c-mode)
                 (mode . c++-mode)
                 (mode . python-mode)
                 (mode . ruby-mode)
                 (mode . emacs-lisp-mode)
                 ))
               ))))
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))
;; folding or unfolding code
;; Todo: hs-minor-mode
(defun hs-enable-and-toggle ()
  (interactive)
  (hs-minor-mode 1)
  (hs-toggle-hiding))
(defun hs-enable-and-hideshow-all (&optional arg)
  "Hide all blocks. If prefix argument is given, show all blocks"
  (interactive "P")
  (hs-minor-mode)
  (if arg
      (hs-show-all)
    (hs-hide-all)))
(global-set-key (kbd "C-c C-h") 'hs-enable-and-toggle)
(global-set-key (kbd "C-c C-j") 'hs-enable-and-hideshow-all)

;; sql mode settings
;; default db-server is mysql
(require 'sql)
(defun my/sql-mode ()
  (interactive)
  (setq sql-user "root")
  (setq sql-password "")
  (setq sql-server "localhost")
  (sql-mysql)
  (other-window -1)
  (sql-send-paragraph)
  )
(add-hook 'sql-mode-hook (lambda () (interactive) (sql-highlight-mysql-keywords)))
(define-key sql-mode-map (kbd "C-c C-c") 'my/sql-mode)
;; plugin for sql mode
(require 'sql-indent)
(eval-after-load "sql"
  '(load-library "sql-indent"))
(require 'sqlup-mode)
(add-hook 'sql-mode-hook 'sqlup-mode)
(add-hook 'sql-interactive-mode-hook 'sqlup-mode)
;; Set a global keyword to use sqlup on a region
(add-hook 'befor-save-hook '(lambda () (interactive)
                              (if (eq major-mode sql-mode)
                                  (sqlup-capitalize-keywords-in-region))))
;; (define-key sql-mode-map (kbd "C-c u") 'sqlup-capitalize-keywords-in-region)

;; http client for emacs
(require 'http)
;; C-c, C-c --> http-process
;; some useful links
;; https://github.com/emacs-pe/http.el
;; https://github.com/gregsexton/httprepl.el
;; https://github.com/pashky/restclient.el
;; httpcode
(require 'httpcode)
;; it's a good tool to query the httpcode state offline
;; M-x hc RET Enter HTTP code: 500 RET
;; json-mode setting
(require 'json-mode)
;; they're just local key define
;; C-c C-f: format the region/buffer with json-reformat (https://github.com/gongo/json-reformat)
;; C-c C-p: display a path to the object at point with json-snatcher (https://github.com/Sterlingg/json-snatcher)
(require 'web-mode)
;; (require 'web-beautify)
(add-to-list 'auto-mode-alist '("\\.html$" . web-mode))
(require 'yaml-mode)
(require 'flymake-yaml)
