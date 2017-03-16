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
      '((sequence "TODO(t!)" "ONGOING(o!)" "VERIFY(v!)" "|" "DONE(d!)")
        (sequence "REPORTED(r!)" "BUG(b!)" "KNOWNCAUSE(k!)" "|" "FIXED(f!)")
        ("|" "CANCELED(c!)")))
(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("ONGOING" . "yellow")
        ("CANCELED" . (:foreground "blue" :weight bold))))
(setq org-enforce-todo-dependencies t)
(setq org-log-done 'time)
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
;; C-c '    --> org-edit-special & optional ARG
;; C-c, C-t --> org-todo
;; C-c a t  --> org-todo-list
;; C-c, / t --> org-show-todo-list
;; S-M-RET  --> org-insert-todo-heading
;; (setq org-agenda-files
;;      (directory-files "/home/czx/test/snippets/org" t "org$"))

(setq org-plantuml-jar-path
      (expand-file-name "~/.emacs.d/third-parts/plantuml.jar"))

(setq org-publish-project-alist
      '(("notes"
         :base-directory "~/.notes.d"
         :base-extension "org"
         :publishing-directory "~/.notes.d/html/"
         :publishing-function org-html-publish-to-html
         :headline-levels 3
         :with-toc nil
         :html-preamble t)))

(setq org-src-fontify-natively t)
(defface org-block-begin-line
  '((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#000000")))
  "Face used for the line delimiting the begin of source blocks.")
(defface org-block-background
  '((t (:background "#FFFFEA")))
  "Face used for the source block background.")
(defface org-block-end-line
  '((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#000000")))
  "Face used for the line delimiting the end of source blocks.")

(setq org-hide-block-startup t)
(setq org-export-with-sub-superscripts nil) ; to prevent undersocre '_' from interpreting between to words

(setq org-edit-src-auto-save-idle-delay 5)
(setq org-src-ask-before-returning-to-edit-buffer nil)
(setq org-src-preserve-indentation t)

;; (setq org-export-with-toc t)
;; (setq org-export-headline-levels 2)
(setq org-html-head nil)

;; Agenda
(setq org-agenda-files '("~/.agenda/"))

(provide 'init-org)
