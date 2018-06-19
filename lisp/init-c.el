(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.c\\'" . c++-mode))

;; (add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
;; (add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
;; (add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)

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

;; settings for c++
(add-hook 'c++-mode-hook #'modern-c++-font-lock-mode)

;; (eval-after-load 'flycheck
  ;; '(progn
  ;;    (require 'flymake-google-cpplint)
  ;;    (executable-find "cpplint")
  ;;    ;; Add Google C++ Style checker.
  ;;    ;; In default, syntax checked by Clang and Cppcheck.
  ;;    (flycheck-add-next-checker 'c/c++-cppcheck
  ;;                               'c/c++-googlelint 'append)))
(require 'flymake-google-cpplint)
(add-hook 'c++-mode-hook 'flymake-google-cpplint-load)
(add-hook 'c++-mode-hook '(lambda ()
                            (setq flycheck-clang-language-standard "c++11")
                            (cmake-ide-setup)
                            (setf company-backends '())
                            (add-to-list 'company-backends 'company-keywords)
                            (add-to-list 'company-backends 'company-irony)
                            (add-to-list 'company-backends 'company-irony-c-headers)
                            ))

(add-hook 'flycheck-mode-hook 'flycheck-irony-setup)

(defun trivialfis/flycheck ()
  "Configurate flycheck."
  (add-to-list 'display-buffer-alist
	       `(,(rx bos "*Flycheck errors*" eos)
		 (display-buffer-reuse-window
		  display-buffer-in-side-window)
		 (side            . bottom)
		 (reusable-frames . visible)
		 (window-height   . 0.23)))
  (setq flycheck-display-errors-function
        #'flycheck-display-error-messages-unless-error-list))
(add-hook 'prog-mode-hook 'trivialfis/flycheck)

(defun trivialfis/irony ()
  "Irony mode configuration."
  (add-hook 'irony-mode-hook 'irony-eldoc)
  (add-to-list 'company-backends 'company-irony)
  (add-to-list 'company-backends 'company-irony-c-headers)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'flycheck-mode-hook 'flycheck-irony-setup)
  (when (or (eq major-mode 'c-mode)	; Prevent from being loaded by c derived mode
            (eq major-mode 'c++-mode))
    (irony-mode 1)))

(add-hook 'irony-mode-hook 'irony-eldoc)

(defun trivialfis/cc-base ()
  "Common configuration for c and c++ mode."
  ;; Company mode
  (setf company-backends '())
  (add-to-list 'company-backends 'company-keywords)
  (trivialfis/irony))
;; Add it to c++-mode-hook
(add-hook 'c++-mode-hook 'trivialfis/cc-base)

;;(use-package rtags
;;  :commands rtags-start-process-unless-running
;;  :config (progn
;;	    (message "Rtags loaded")
;;	    (use-package company-rtags)))

(require 'rtags)
(defun trivialfis/rtags ()
  "Rtags configuration.
Used only for nevigation."
  (interactive)
  (rtags-start-process-unless-running)
  (setq rtags-display-result-backend 'helm)
  (trivialfis/local-set-keys
   '(
     ("M-."     .  rtags-find-symbol-at-point)
	 ("M-?"     .  rtags-find-references-at-point)
     ("M-,"     .  rtags-location-stack-back)
     ("C-,"   .    rtags-location-stack-forward)
     ("C-c r r" .  rtags-rename-symbolrtags-next-match)
     ))
  (add-hook 'kill-emacs-hook 'rtags-quit-rdm))

;; http://syamajala.github.io/c-ide.html
(setq rtags-autostart-diagnostics t)
(rtags-diagnostics)
(setq rtags-completions-enabled t)
(rtags-enable-standard-keybindings)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set up code completion with company and irony
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'company)
(require 'company-rtags)
(global-company-mode)

;; Enable semantics mode for auto-completion
(require 'cc-mode)
(require 'semantic)
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)
(semantic-mode 1)

;; Setup irony-mode to load in c-modes
(require 'irony)
(require 'company-irony-c-headers)
;; (require 'cl)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; irony-mode hook that is called when irony is triggered
(defun my-irony-mode-hook ()
  "Custom irony mode hook to remap keys."
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))

(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; company-irony setup, c-header completions
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
;; Remove company-semantic because it has higher precedance than company-clang
;; Using RTags completion is also faster than semantic, it seems. Semantic
;; also provides a bunch of technically irrelevant completions sometimes.
;; All in all, RTags just seems to do a better job.
(setq company-backends (delete 'company-semantic company-backends))
;; Enable company-irony and several other useful auto-completion modes
;; We don't use rtags since we've found that for large projects this can cause
;; async timeouts. company-semantic (after company-clang!) works quite well
;; but some knowledge some knowledge of when best to trigger is still necessary.
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers
                        company-irony company-yasnippet
                        company-clang company-rtags)
    )
  )

(defun my-disable-semantic ()
  "Disable the company-semantic backend."
  (interactive)
  (setq company-backends (delete '(company-irony-c-headers
                                   company-irony company-yasnippet
                                   company-clang company-rtags
                                   company-semantic) company-backends))
  (add-to-list
   'company-backends '(company-irony-c-headers
                       company-irony company-yasnippet
                       company-clang company-rtags))
  )
(defun my-enable-semantic ()
  "Enable the company-semantic backend."
  (interactive)
  (setq company-backends (delete '(company-irony-c-headers
                                   company-irony company-yasnippet
                                   company-clang) company-backends))
  (add-to-list
   'company-backends '(company-irony-c-headers
                       company-irony company-yasnippet company-clang))
  )

;; Zero delay when pressing tab
(setq company-idle-delay 0)
(define-key c-mode-map [(tab)] 'company-complete)
(define-key c++-mode-map [(tab)] 'company-complete)
;; Delay when idle because I want to be able to think
(setq company-idle-delay 0.2)

;; Prohibit semantic from searching through system headers. We want
;; company-clang to do that for us.
(setq-mode-local c-mode semanticdb-find-default-throttle
                 '(local project unloaded recursive))
(setq-mode-local c++-mode semanticdb-find-default-throttle
                 '(local project unloaded recursive))

(semantic-remove-system-include "/usr/include/" 'c++-mode)
(semantic-remove-system-include "/usr/local/include/" 'c++-mode)
(add-hook 'semantic-init-hooks
          'semantic-reset-system-include)


(provide 'init-c)

;;; init-c.el ends here
