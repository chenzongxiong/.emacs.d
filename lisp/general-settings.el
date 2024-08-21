;;; Package -- Summary
;;; Code:
;;; Commentary:

;; User details
;;; Code:
(setq user-full-name "Zongxiong Chen")
(setq user-mail-address "czxczf@gmail.com")
;; Turn on debugging, it will be turned off at the end. In case something happens during loading that breaks something, it's nice to have a debug information.
;;  (setq debug-on-error t)
;; Always, always, prefer UTF-8, anything else is insanity
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
;; Turn on syntax highlighting for all buffers
(global-font-lock-mode t)
;; Echo commands I haven't finished quicker than the default of 1 second
(setq echo-keystrokes 0.1)
;; If you change buffer, or focus, disable the current buffer's mark:
(transient-mark-mode t)
;; Don't warn me about large files unless they're at least 25mb:
(setq large-file-warning-threshold (* 25 1024 1024))
;; Don't indicate empty lines or the end of a buffer with visual marks (the lines are cleaned up automatically anyway)
(setq-default indicate-empty-lines nil)
(setq-default indicate-buffer-boundaries nil)
;; Why would you not want to know lines/columns in your mode-line?
(line-number-mode t)
(cond
 ((>= (string-to-number emacs-version) 26.3) (global-display-line-numbers-mode 1))
 ((< (string-to-number emacs-version) 26.3) (global-linum-mode t)))
(column-number-mode t)
;; Nobody likes to have to type "yes" to questions, so change it to just hitting the y key to confirm:
(defalias 'yes-or-no-p 'y-or-n-p)
;; It's much easier to move around lines based on how they are displayed, rather than the actual line. This helps a ton with long log file lines that may be wrapped:
(setq line-move-visual t)
;; Set up the fill-column to 80 characters and set tab width to 2
(setq-default fill-column 80)

(setq-default default-tab-width 2)
(setq tab-width 2)
(setq-default indent-tabs-mode nil)
;; Require a newline at the end of files
(setq require-final-newline t)
;; disable startup info
(setq inhibit-startup-message t)
;; Search (and search/replace) using regex by default, since that's usually what I want to do
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)
;; backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(defconst delete-old-version t)

;; (when (eq system-type 'darwin)
;;   (toggle-frame-fullscreen))


;; (setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))
;;Hide the mouse while typing
(setq make-pointer-invisible t)
;; make parent visible
(show-paren-mode 1)
;; hidden start-up message
(setq inhibit-startup-message t)
;;
(setq-default transient-mark-mode t)
;; display time
(display-time-mode 1)
;; File association
(setq auto-mode-alist (cons '("README" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("README.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("README.mk" . markdown-mode) auto-mode-alist))
;; Unicode on MacOSX
(setenv "LC_CTYPE" "UTF-8")
;; enable narrow-to-region
(put 'narrow-to-region 'disabled nil)
;; delete the trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; goto the next window
(defun goto-next-window ()
  "goto the next window"
  (interactive)
  (other-window 1))
;; goto the previous window
(defun goto-previous-window ()
  "goto the previous window"
  (interactive)
  (other-window -3))
(global-set-key (kbd "C-c n") 'goto-next-window)
(global-set-key (kbd "C-c p") 'goto-previous-window)
;; unset `C-x o' key bound, for I just want to use `C-c p' or `C-c n'
(global-set-key (kbd "C-x o") 'other-window)

(defun show-all-activate-windows ()
  "list all activate windows in current frame"
  (interactive)
  (message "%s" (window-list)))

;; disable auto save mode for speeding up
(auto-save-mode 0)

;; Using emacs client to kill emacs
(defun server-shutdown ()
  "Save Buffers, Quit, and Shutdown(kill) Server"
  (interactive)
  (save-some-buffers)
  (kill-emacs))
;; Bind shortcut to scroll-other-window
(global-set-key (kbd "C-M-n") #'(lambda () (interactive) ; must be `interactive' explict
                                 (scroll-other-window 1)))
(global-set-key (kbd "C-M-p") #'(lambda () (interactive)
                                 (scroll-other-window -1)))
;; To scroll the window smoothly, line by line scroll
(setq scroll-step 1)
;; Display buffer name style
(setq frame-title-format "%b@zxchen")
;; Enable version-control
;; (setq version-control t)
;; Copy and Paste in Emacs
;; yank --> C-y, cut --> C-w, yank-next --> M-y, copy --> M-w
(defun show-curr-major-mode ()
  (interactive)
  (message "%s" major-mode))

;; (setq ad-handle-definition 'accept)     ;;
(setq ad-redefinition-action 'accept)

;; define the const variable
(auto-fill-mode)
;; set the size of font
(set-face-attribute 'default nil :height 130)
;; (if (eq system-type 'darwin)
;;   ; something for OS X if true
;;   ; optional something if not
;; )

(setq pb-copy "pbcopy")
(setq pb-paste "pbpaste")

(if (equal system-type 'gnu/linux)
    (setq pb-copy "cat | xclip -selection clipboard"
          pb-paste "xclip -selection clipboard -o")
  )


;; add pbpaste and pbcodpy
;;;###autoload
(defun pbpaste ()
  "Paste data from clipboard"
  (interactive)
  (shell-command-on-region
   (point)
   (if mark-active (mark) (point))
   pb-paste nil t))

;;;###autoload
(defun pbcopy ()
  "Copy region to pasteboard."
  (interactive)
  (print (mark))
  (when mark-active
    (shell-command-on-region
     (point) (mark) pb-copy)
    (kill-buffer "*Shell Command Output*")))

;; setting for ecb
(defconst ecb-layout-name "left9")
(defconst ecb-tip-of-the-day nil)

(setq package-check-signature nil)
(xterm-mouse-mode)

;; (toggle-scroll-bar -1)
;; (menu-bar-mode -1)
;; (tool-bar-mode -1)
(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(setq visible-bell 1)
(global-set-key (kbd "C-2") 'set-mark-command)

;; (setq shell-file-name "/usr/bin/zsh")

;; (global-eldoc-mode -1)

(setq auth-sources '("~/.authinfo"))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(defun save-buffer-without-tabs ()
  (interactive)
  (untabify (point-min) (point-max))
  (save-buffer))
(global-set-key "\C-x\C-s" 'save-buffer-without-tabs)

(add-to-list 'auto-mode-alist '("\\.ttl$" . ttl-mode))
(provide 'general-settings)


;;; general-settings.el ends here
