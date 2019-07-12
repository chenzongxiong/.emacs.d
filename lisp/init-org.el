require 'org)
(setq org-babel-load-languages
 '(
   (ditaa . t)
   (python . t)
   (perl . t)
   (C . t)
   (C++ . t)
   (sh . t)
   (sql . t)
   (ruby . t)
   (java . t)
   (js . t)
   (plantuml . t)
   (lisp . t)
   (emacs-lisp . t)
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

(setq ditaa-cmd "java -jar ~/tools/ditaa.jar")
(defun ditaa-generate()
  (interactive)
  (shell-command
   (concat ditaa-cmd " " buffer-file-name)))
(setq org-ditaa-jar-path "~/tools/ditaa.jar")

(setq org-todo-keywords
'((sequence "TODO(t)" "DOING" "|" "DONE(d!)" "CANCELED(c@)")))

(require 'ob-C)

(provide 'init-org)
