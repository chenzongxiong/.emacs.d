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
 '((sequence "TODO(t)" "IN-PROGRESS(i)" "DONE (d)" "CANCELED (c)" "BUG (b)"))
 )

(setq org-todo-keyword-faces
 '(("IN-PROGRESS" . "orange") ("CANCELED" . "red") ("DONE" . "green"))
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

(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/third-parts/plantuml.jar"))

(setq ditaa-cmd "java -jar ~/tools/ditaa.jar")
(defun ditaa-generate()
  (interactive)
  (shell-command
   (concat ditaa-cmd " " buffer-file-name)))
(setq org-ditaa-jar-path "~/tools/ditaa.jar")


(require 'ob-C nil t)
(require 'ob-shell nil t)
;; (require 'ob-c++)
(require 'ob-python nil t)
(require 'ob-sql nil t)
(provide 'init-org)

;;; init-org.el ends here
