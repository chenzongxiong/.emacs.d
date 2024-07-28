;;; Package -- Summary
;;; Code:
;;; Commentary:


(require 'org)
(setq org-babel-load-languages
 '(
   (ditaa . t)
   (python . t)
   (haskell . t)
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
 '((sequence "TODO(t)" "IN-PROGRESS(i@)" "BUG(b@/!)" "|" "CANCELED(c@/!)" "DONE(d!)" ))
 )

(setq org-todo-keyword-faces
 '(("TODO" . "orange")  ("IN-PROGRESS" . "yellow") ("CANCELED" . "gray") ("DONE" . "green") ("BUG" . "red"))
 )

;; C-c '    --> org-edit-special & optional ARG
;; C-c, C-t --> org-todo
;; C-c a t  --> org-todo-list
;; C-c, / t --> org-show-todo-list
;; S-M-RET  --> org-insert-todo-heading
(defun create-folder-if-not-exists (folder)
  "Creat a FOLDER is not existed."
  (unless (file-directory-p folder)
    (make-directory folder t))
  )
(create-folder-if-not-exists "~/.todo")

(setq org-agenda-files
     (directory-files "~/.todo" t "org$"))

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook #'org-summary-todo)

;; (defconst org-log-done 'time)
;; (defconst org-log-done 'note)

(require 'ob-C nil t)
(require 'ob-shell nil t)
;; (require 'ob-c++)
(require 'ob-python nil t)
(require 'ob-sql nil t)
(provide 'init-org)

;;; init-org.el ends here
