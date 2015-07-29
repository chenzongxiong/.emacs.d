;; ecb settings --> emacs code browse
(require 'ecb)
(setq ecb-windows-width 0.2)
(setq ecb-layout-name "leftright2")
;;; activate and deactivate ecb
(global-set-key (kbd "C-c a") 'ecb-activate)
(global-set-key (kbd "C-c d") 'ecb-deactivate)
;;; show/hide ecb window
(global-set-key (kbd "C-;") 'ecb-show-ecb-windows)
(global-set-key (kbd "C-'") 'ecb-hide-ecb-windows)
;;; quick navigation between ecb windows
(global-set-key (kbd "C-c 0") 'ecb-goto-window-edit1)
(global-set-key (kbd "C-c 1") 'ecb-goto-window-directories)
(global-set-key (kbd "C-c 2") 'ecb-goto-window-sources)
(global-set-key (kbd "C-c 3") 'ecb-goto-window-methods)
(global-set-key (kbd "C-c 4") 'ecb-goto-window-history)
(setq ecb-tip-of-the-day nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun kill-terminal-before-deactivate ()
  "Make sure the deactive the ecb before kill terminal"
  (interactive)
  (ecb-deactivate)
  (save-buffers-kill-terminal))
(global-set-key (kbd "C-x C-c") 'kill-terminal-before-deactivate)

;; start auto-complete with emacs
(require 'auto-complete)
;; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
;; (add-to-list 'ac-sources 'ac-source-filename)
;; (add-to-list 'ac-sources 'ac-source-in-current-dir)
;; (setq-default
;;  ac-sources
;;  '(
;;    ac-source-imenu
;;    ac-source-filename
;;    ac-source-files-in-current-dir
;;    ac-source-features
;;    ac-source-functions
;;    ac-source-yasnippet
;;    ac-source-variables
;;    ac-source-symbols
;;    ac-source-abbrev
;;    ac-source-dictionary
;;    ac-source-words-in-same-mode-buffers
;;    ))
;; start yasnippet with emacs
(require 'yasnippet)
(setq yas-snippet-dirs yas-installed-snippets-dir)
(yas-global-mode 1)
;; Fix a key binding bug in elpy
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
;; fix iedit bug in Mac
;; (when (eq system-type 'darwin)
(define-key global-map (kbd "C-c ;") 'iedit-mode)
;; start flymake-google-cpplint-load
;; let's define a function for flymake initialization
;; (interactive)
;; (defun my/flymake-google-init ()
;;   (require 'flymake-google-cpplint)
;;   (custom-set-variables
;;    '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
;;   (flymake-google-cpplint-load))
;; (add-hook 'c-mode-hook 'my/flymake-google-init)
;; (add-hook 'c++-mode-hook 'my/flymake-google-init)
;; ;; start google-c-style with emacs
;; (require 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; turn on Semantics in C++-mode or C-mode
;; (require 'cc-mode)
;; (require 'semantic)
;; (semantic-mode 1)
;; (global-semantic-idle-scheduler-mode 1)
;; (global-semantic-stickyfunc-mode 1)
;; (global-semantic-highlight-func-mode 1)
;; (global-semantic-idle-completions-mode 1)
;; (global-semantic-mru-bookmark-mode 1)
;; (global-semantic-show-unmatched-syntax-mode 1)
;; ;; keybindings
;; (require 'semantic/db)
;; (global-semanticdb-minor-mode 1)
;; (setq semanticdb-default-save-directory "~/.emacs.d/.semanticdb")
;; (require 'semantic/ia)
;; (semantic-add-system-include "/usr/local/include/c++/4.9.2/" 'c++-mode)
;; (semantic-add-system-include "/usr/local/include/pcl-1.8/")
;; (semantic-add-system-include "/usr/local/include/" 'c++-mode)
;; ;; (semantic-add-system-include "/usr/include/" 'c++-mode)
;; ;; (semantic-add-system-include "/usr/X11/include/" 'c++-mode)
;; ;; (semantic-add-system-include "/usr/X11R6/include/" 'c++-mode)
;; ;; C-c, j --> semantic-ia-fast-jump  ; can deal with complex name such as `this::that->foo()'
;; ;; C-x B --> semantic-mrub-switch-tag  ; return back the tag
;; ;; C-c, j --> semantic-complete-jump-local   ; just can deal with simple name such as `foo'
;; ;; C-c, J --> semantic-complete-jump
;; ;; C-c, p --> senator-previous-tag
;; ;; C-c, n --> senator-next-tag
;; ;; C-c, u --> senator-go-to-up-reference
;; ;; (define-key c++-mode-map (kbd "C-c , d") 'semantic-ia-show-doc)
;; ;; (define-key c++-mode-map (kbd "C-c , s") 'semantic-ia-show-summary)
;; ;; semantic-symref-symbol
;; ;; semantic-analyze-proto-impl-toggle ;; switch between prototype and implementation
;; (require 'semantic/senator)
;; (global-set-key (kbd "C-c , -") 'senator-fold-tag)
;; (global-set-key (kbd "C-c , +") 'senator-unfold-tag)
;; (unless (eq major-mode 'python-mode)
;;   (global-semantic-idle-summary-mode 1)   ; it confict the python-mode
;;   )

;; (global-semantic-show-parser-state-mode 1)
;; (global-semantic-decoration-mode 1)

;; ;; let's define a function which adds semantic as a suggestion backend to auto-complete
;; ;; and hook this function to c-mode-common-hook
;; (defun my/add-semantic-to-autocomplete ()
;;   (local-set-key "." 'semantic-complete-self-insert)
;;   (local-set-key ">" 'semantic-complete-self-insert)
;;   (local-set-key (kbd "C-c p") 'semantic-analyze-proto-impl-toggle)
;;   (local-set-key (kbd "C-c >") 'semantic-complete-analyze-inline)
;;   (local-set-key (kbd "C-c ?") 'semantic-ia-complete-symbol)
;;   (local-set-key (kbd "RET") 'newline-and-indent)
;;   (local-set-key [f5] 'gdb)
;;   (setq ac-sources nil)
;;   (add-to-list 'ac-sources 'ac-source-semantic)
;;   (add-to-list 'ac-sources 'ac-source-yasnippet)
;;   ;; (add-to-list 'ac-sources 'ac-source-semantic-raw)
;;   (add-to-list 'ac-sources 'ac-source-filename)
;;   (add-to-list 'ac-sources 'ac-source-files-in-current-dir)
;;   )
;; (add-hook 'c-mode-common-hook 'my/add-semantic-to-autocomplete)
;; (add-hook 'c++-mode-hook 'my/add-semantic-to-autocomplete)


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
(require 'json)
(when (require 'elpy nil t)           ; load `eply' first, or it will confict with `python-mode.el' confusing
  (elpy-enable)
  (if (member 'python-mode ac-modes)
      (setq ac-modes (delete 'python-mode ac-modes))) ; just using elpy's autocomplete
  (setq elpy-rpc-backend "jedi"))                     ; set backend as `jedi'
(require 'jedi)
(setq jedi:complete-on-dot t)
(setq jedi:tooltip-method t)
;; (define-key python-mode-map (kbd "C-c C-f") 'elpy-find-file)
;; (define-key python-mode-map (kbd "C-c C-s") 'elpy-rgrep-symbol)
;; (define-key python-mode-map (kbd "M-TAB") 'elpy-company-backend)
;; (define-key python-mode-map (kbd "M-.") 'elpy-goto-definition)
;; (define-key python-mode-map (kbd "M-*") 'pop-tag-mark)
;; (define-key python-mode-map (kbd "C-c C-z") 'elpy-shell-switch-to-shell)
;; (define-key python-mode-map (kbd "C-c C-c") 'elpy-shell-send-region-or-buffer)
;; (define-key python-mode-map (kbd "C-M-x") 'python-shell-send-defun)
;; (define-key python-mode-map (kbd "C-c C-n") 'elpy-flymake-next-error)
;; (define-key python-mode-map (kbd "C-c C-p") 'elpy-flymake-previous-error)
;; (define-key python-mode-map (kbd "C-c C-v") 'elpy-check)
;; (define-key python-mode-map (kbd "C-c C-d") 'elpy-doc)
;; (define-key python-mode-map (kbd "C-c C-r") 'elpy-refactor)
;; (define-key python-mode-map (kbd "C-c C-e") 'elpy-multiedit-python-symbol-at-point)
;; (define-key python-mode-map (kbd "C-c C-t") 'elpy-test)
(defun my/python-mode ()
  ;; ipython setting
  (setq py-install-directory "~/.emacs.d/")
  (require 'python-mode)
  (require 'ipython)
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args ""
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
   python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
   python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
   )
  ;; add break point for debugging
  (defun my/python-add-breakpoint ()
    "Add a break point"
    (interactive)
    (newline-and-indent)
    (insert "import ipdb; ipdb.set_trace()")
    (open-line 1)
    (highlight-lines-matching-regexp "^[ ]*import ipdb; ipdb.set_trace()"))
  (local-set-key (kbd "C-c C-b") 'my/python-add-breakpoint)
  ;; invoke an interactive interpreter.
  (defun my/python-interactive ()
    "Enter the interactive python enviroment"
    (interactive)
    (progn
      (insert "!import code; code.interact(local=vars())")
      (move-end-of-line 1)
      (comint-send-input)))
  (local-set-key (kbd "C-c i") 'my/python-interactive)
  (local-set-key [f5] 'pdb)
  (message "Hello, I'm trampped in python-mode.")
  )
(add-hook 'python-mode-hook 'my/python-mode)
;; ;; isend setting
;; (defvar isend--command-buffer)
;; (make-variable-buffer-local 'isend--command-buffer)
;; (require 'isend-mode)
;; (setq isend-skip-empty-lines nil)
;; (setq isend-strip-empty-lines nil)
;; (setq isend-delete-indentation t)
;; (setq isend-end-with-empty-line t)
;; (defadvice isend-send (after advice-run-code-sent activate compile)
;;   "Execute whatever sent to the python buffer"
;;   (interactive)
;;   (let ((old-buf (buffer-name)))
;;     (progn
;;       (switch-to-buffer isend--command-buffer)
;;       (goto-char (point-max))
;;       (comint-send-input)
;;       (switch-to-buffer old-buf))))

;; (defun python-cmd ()
;;   (interactive)
;;   (shell-command
;;    (message "%s" buffer-file-name)
;;    (concat "python " buffer-file-name)))
;; (define-key python-mode-map (kbd "C-c |") 'python-cmd)

;; using flymake with pep8
;; (when (load "flymake" t)
;;   (defun flymake-pep8-init ()
;;     (let* ((temp-file (flymake-init-create-tempn-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "pep8" (list "--repeat"local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\" flymake-pep8-init)))
;; (defun my-flymake-show-help ()
;;   (when (get-char-property (point) 'flymake-overlay)
;;     (let ((help (get-char-property (point) 'help-at-pt)))
;;       (if help (message "%s" help)))))
;; (add-hook 'post-command-hook 'my-flymake-show-help)
;; jedi settings
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (setq jedi:server-command "~/.emacs.d/.python-environments/default/bin/jediepcserver.py"))

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
      '((sequence "TODO(t)" "DONE(d)")
        (sequence "REPORT(r)" "BUG(b)" "FIXED(f)")
        (sequence "CANCELD(c)")))
;; C-c '    --> org-edit-special & optional ARG
;; C-c, C-t --> org-todo
;; C-c a t  --> org-todo-list
;; C-c, / t --> org-show-todo-list
;; S-M-RET  --> org-insert-todo-heading

;; artist mode setting
;; P==>Pen                                l==>Line                 C-c C-a L
;; R==>Rectangle            C-c C-a r 	S==>Square               C-c C-a s
;; p==>Poly-line            C-c C-a P 	E==>Ellipse              C-c C-a c
;; T==>Text                 C-c C-a T 	s==>Spray-can            C-c C-a z
;; e==>Erase                C-c C-a E 	v==>Vaporize             C-c C-a V
;; F==>Character for Fill...  C-c C-a C-f 	f==>Character for Line...  C-c C-a C-l
;; C==>Character to Erase...  C-c C-a C-e 	r==>Rubber-banding     C-c C-a C-r
;; t==>Trim Line Endings  C-c C-a C-t 	d==>Draw Shape Borders  C-c C-a C-s
;; c==>Characters for Spray

;; plantum-mode
;; set ditaa
(defun ditaa ()
  (interactive)
  (shell-command
   (concat "ditaa " buffer-file-name)))
(defun plantuml ()
  (interactive)
  (shell-command
   (concat "plantuml " buffer-file-name)))

;; AUCTex setting
;; (load "auctex.el" nil t t)
;; (setq TeX-auto-save t)
;; (setq TeX-parse-self t)
;; (set-default TeX-master nil)
;; (add-hook 'LaTeX-mode-hook 'visual-line-mode-map)
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; (add-hook 'LaTeX-mode-hook 'turn-on-reftex)
;; ;; compile documents to pdf
;; (setq TeX-PDF-mode t)

;; Version Control settings
(require 'vc)
(defun ensure-in-vc-or-check-in ()
  "To make every file under version-control"
  (interactive)
  (if (file-exists-p (formate "%s" (buffer-file-name)))
      (progn
        (vc-checkin (buffer-file-name) nil "")
        (vc-toggle-read-only)
        (message "Check in"))
    (message "You need to check this file in !M-x vc-use" )))
(defun vc-use ()
  (interactive)
  (vc-register)
  (vc-toggle-read-only))
;; add hook to ensure in vc or check-in
;; (add-hook 'after-save-hook 'ensure-in-vc-or-check-in)
;; keybindings
;; C-x v v     vc-next-action -- perform the next logical control operation on file
;; C-x v i     vc-register -- add a new file to version control
;; C-x v +     vc-update -- Get latest changes from version control
;; C-x v ~     vc-version-other-window -- look at other revisions
;; C-x v =     vc-diff -- diff with other revisions
;; C-x v u     vc-revert-buffer -- undo checkout
;; C-x v c     vc-cancel-version -- delete the latest revision (often it makes more sense to look at an old revision and check that in again!)
;; C-x v d     vc-directory -- show all files which are not up to date
;; C-x v g     vc-annotate -- show when each line in a tracked file was added and by whom
;; C-x v s     vc-create-snapshot -- tag all the files with a symbolic name
;; C-x v r     vc-retrieve-snapshot -- undo checkouts and return to a snapshot with a symbolic name
;; C-x v l     vc-print-log -- show log (not in ChangeLog format)
;; C-x v a     vc-update-change-log -- update ChangeLog
;; C-x v m     vc-merge
;; C-x v h     vc-insert-headers
;; M-x vc-resolve-conflicts -- pop up an ediff-merge session on a file with conflict markers

;; Ediff mode settings
(defun command-line-diff (switch)
  (let ((file1 (pop command-line-args-left))
        (file2 (pop command-line-args-left)))
    (ediff file1 file2)))
(add-to-list 'command-switch-alist '("--diff" . command-line-diff))
(setq ediff-split-window-function (if (> (window-width) 160)
                                      'split-window-vertically
                                    'split-window-horizontally))

;; Git setting using magit
(autoload 'magit-status "magit" nil t)
;; keybindings
;; 1 --> `magit-jump-to-untracked'
;; 2 --> `magit-jump-to-unstaged'
;; 3 --> `magit-jump-to-staged'
;; 4 --> `magit-jump-to-unpushed'
;; k --> `magit-discard-item'
;; i --> `magit-ignore-item'
;; I --> `magit-ignore-item-locally'
;; RET --> `magit-visit-item'
;; c --> `magit-log-edit'
;; C --> `magit-log-add'
;; s --> `magit-stash-item'
;; S --> `magit-stash-all'
;; u --> `magit-unstash-item'
;; U --> `magit-unstash-all'
;; d --> `magit-diff-working-tree'
;; D --> `magit-diff'
;; x --> `magit-reset-head'
;; X --> `magit-reset-working-tree'
;; l --> `magit-log-head'
;; L --> `magit-log'
;; . --> `magit-mark-item'
;; = --> `magit-diff-with-mark'
;; a --> `magit-apply-item'
;; A --> `magit-cherry-pick-item'
;; v --> `magit-revert-item'
;; h --> `magit-reflog-head'
;; H --> `magit-head'
;; t --> `magit-tag'
;; T --> `magit-annotated-tag'
;; B --> `magit-create-branch'
;; b --> `magit-checkout'
;; r --> `magit-rebase-step'
;; M --> `magit-automatic-merge'
;; m --> `magit-manual-merge'
;; f --> `magit-remote-update'
;; F --> `magit-pull'
;; P --> `magit-push'
(defun my/magit-status ()
  (interactice)
  (magit-status ))
(global-set-key (kbd "C-c m") `magit-status)
;; Todo:
;;   to judge the `dir' is under version-control
;;   if `dir' is, add-hook to  `magit-stauts' to display the file automatically

;; youdao-dictionary
;; Enable cache
(setq url-automatic-caching t)
(global-set-key (kbd "C-c s") 'youdao-dictionary-search-at-point+)
;; Set file path for saving search history
(setq youdao-dictionary-search-history-file "~/.emacs.d/.youdao")
;; Enable Chinese word segmentation support (支持中文分词)
(setq youdao-dictionary-use-chinese-word-segmentation t)

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

;; dired setting
;; dired-rainbow may not work well under terminal
(require 'dired-rainbow)
(defconst dired-audio-files-extensions
  '("mp3" "MP3" "ogg" "OGG" "flac" "FLAC" "wav" "WAV")
  "Dired Audio files extensions")
(defconst dired-video-files-extensions
  '("vob" "VOB" "mkv" "MKV" "mpe" "mpg" "MPG" "mp4" "MP4" "ts" "TS" "m2ts"
    "M2TS" "avi" "AVI" "mov" "MOV" "wmv" "asf" "m2v" "m4v" "mpeg" "MPEG" "tp")
  "Dired Video files extensions")
(defconst dired-ms-office-files-extensions
  '("doc" "docx" "xls" "ppt" "pptx" "xlsx")
  "Dired MS-Office files extensions")
(defconst dired-archives-files-extensions
  '("zip" "rar" "gz" "bz2" "tar" "7z")
  "Archive files extension")
(defconst dired-image-files-extensions
  '("jpg" "JPG" "png" "PNG" "gif")
  "image files extensions")
(dired-rainbow-define audio "#329EE8" dired-audio-files-extensions)
(dired-rainbow-define video "#B3CCFF" dired-video-files-extensions)
(dired-rainbow-define pdf "#4e9a06" ("pdf"))
(dired-rainbow-define word "#B3CCFF" dired-ms-office-files-extensions)

(require 'dired-filter)
(setq dired-filter-group-saved-groups
      '(("default"
        ("PDF"
         (extension . "pdf"))
        ("MS-Office"
         (extension "doc" "docx" "xls" "xlsx" "ppt" "pptx"))
        ("video"
         (extension "mp4" "avi" "AVI" "MP4" "mov" "MOV" "flv" "FLV"))
        ("audio"
         (extension "flac" "mp3" "wav" "MP3" "FLAC" "WAV"))
        ("LaTeX"
         (extension "tex" "bib"))
        ("Org"
         (extension . "org"))
        ("Image"
         (extension "jpg" "png" "gif" "JPG" "PNG"))
        ("Archives"
         (extension "zip" "rar" "gz" "bz2" "tar" "7z")))))
(add-hook 'dired-mode-hook
          '(lambda ()
             (dired-filter-group-mode)))
;; Todo: auto complete the path
;;   Using autocomplete package
;; (fset 'my/complete-file-name
;;       (make-hippie-expand-function '(try-complete-file-name-partially
;;                                      try-complete-file-name)))
;; (global-set-key (kbd "M-/") 'my/complete-file-name)
;; (require 'comint)
;; (global-set-key "\M-\\" 'comint-dynamic-complete-filename)

;; debug settings
(defun my/gdb-many-windows-toggle ()
  (interactive)
  (gdb-many-windows t)                ; toggle on it
 )
(add-hook 'gud-mode-hook
          '(lambda ()
             (message "Hello, I'm trapped in gud-mode")
             (local-set-key [f6] 'my/gdb-many-windows-toggle)
             (local-set-key [f5] 'gdb)))
;; (defun my/activate-debug ()
;;   (interactive)
;;   (if (eq major-mode 'c++-mode)
;;       (local-set-key (kbd "f5") 'gdb)
;;   ))
(defun my/show-ac-sources ()
  (interactive)
  (message "%s" ac-sources))
;; loading color theme settings and maximun the frame
(require 'color-theme)
(color-theme-initialize)
(color-theme-monokai)
(add-hook 'after-init-hook '(lambda ()
                              (set-face-attribute 'default (selected-frame) :height 150)
                              (setq default-frame-alist '(
                                                          (width . 500)
                                                          (height . 500)
                                                          ))
                              (toggle-frame-fullscreen)
                              (message "Toggle Frame FULLSCREEN")
                              ))
;; sql mode settings
;; default db-server is mysql
(require 'sql)
(defun my/sql-mode ()
  (interactive)
  (setq sql-user "root")
  (setq sql-password "")
  (setq sql-database "mysql")
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

;; web-mode && php-mode
(require 'php-mode)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-hook 'php-mode-hook 'php-enable-symfony2-coding-style)
(require 'ac-php)
(add-to-list 'ac-sources 'ac-php)
(defun my/show-ac-source ()
  (interactive)
  (print ac-sources))

;; golden ratio
(require 'golden-ratio)
(golden-ratio-mode 1)
(setq golden-ratio-exclude-modes '("ediff-mode"
                                   "eshell-mode"
                                   "dired-mode"))
(setq split-width-threshold nil)
;; god-mode, I don't what's it. just for fun
;; eww mode & w3 mode
(require 'eww)
;; browse kill ring
(require 'browse-kill-ring)
(global-set-key (kbd "C-c y") 'browse-kill-ring)
;; (require 'undo-tree)
;; (global-undo-tree-mode 1)
;; (defalias 'redo 'undo-tree-redo)
;; (global-set-key (kbd "C-z") 'undo)
;; (global-set-key (kbd "C-M-z") 'redo)
;; evil settings for vimmer
(require 'evil)
;; M-x turn-on-evil-mode RET
;; M-x turn-off-evil-mode RET
;; (evil-mode 1)
;; yaml mode
(require 'yaml-mode)
(add-hook 'yaml-mode-hook
          (lambda()
            (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
(add-to-list 'auto-mode-alist '("\\.sls$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

(require 'markdown-mode)
