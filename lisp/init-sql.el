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


(provide 'init-sql)
