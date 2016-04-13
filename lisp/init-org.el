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
   (plantuml . t)
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

(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/third-parts/plantuml.jar"))

(provide 'init-org)
