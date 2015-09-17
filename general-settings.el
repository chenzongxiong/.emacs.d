; Time-stamp: <[general-settings.el] modified by BrownBear on Friday, 2015-05-08 at 20:15:14 on czxczf.local>
;; User details
(setq user-full-name "chenzongxiong")
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
(global-linum-mode t)
(column-number-mode t)
;; Nobody likes to have to type "yes" to questions, so change it to just hitting the y key to confirm:
(defalias 'yes-or-no-p 'y-or-n-p)
;; It's much easier to move around lines based on how they are displayed, rather than the actual line. This helps a ton with long log file lines that may be wrapped:
(setq line-move-visual t)
;; Set up the fill-column to 80 characters and set tab width to 2
(setq-default fill-column 80)
(setq-default default-tab-width 4)
(setq-default indent-tabs-mode nil)
;; Require a newline at the end of files
(setq require-final-newline t)
;; disable startup info
(setq inhibit-startup-message t)
;; Search (and search/replace) using regex by default, since that's usually what I want to do
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "M-%") 'query-replace-regexp)
;; Emacs starts up with way too much enabled. Turn off the scroll bar, menu bar, and tool bar. There isn't really a reason to have them on
(scroll-bar-mode nil)
(tool-bar-mode nil)
(menu-bar-mode nil)
;; backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-version t)
;; dont' show menu-bar, tool-bar, scroll-bar
(setq menu-bar-mode nil)
(setq tool-bar-mode nil)
(setq scroll-bar-mode nil)
;; disable mouse action, I don't like to use it
(setq mouse-wheel-mode nil)
(dolist (k '([mouse-1] [down-mouse-1] [drag-mouse-1] [double-mouse-1] [triple-mouse-1]
             [mouse-2] [down-mouse-2] [drag-mouse-2] [double-mouse-2] [triple-mouse-2]
             [mouse-3] [down-mouse-3] [drag-mouse-3] [double-mouse-3] [triple-mouse-3]
             [mouse-4] [down-mouse-4] [drag-mouse-4] [double-mouse-4] [triple-mouse-4]
             [mouse-5] [down-mouse-5] [drag-mouse-5] [double-mouse-5] [triple-mouse-5]))
  (global-unset-key k))
;; (setq version-control t)
;; (setq vc-make-backup-files nil)
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
(setq auto-mode-alist (cons '("README" . text-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("README.md" . text-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("README.mk" . text-mode) auto-mode-alist))
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
  (other-window -1))
(global-set-key (kbd "C-c n") 'goto-next-window)
(global-set-key (kbd "C-c p") 'goto-previous-window)
;; unset `C-x o' key bound, for I just want to use `C-c p' or `C-c n'
(global-unset-key (kbd "C-x o"))

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
(global-set-key (kbd "C-M-n") '(lambda () (interactive) ; must be `interactive' explict
                                 (scroll-other-window 1)))
(global-set-key (kbd "C-M-p") '(lambda () (interactive)
                                 (scroll-other-window -1)))
;; To scroll the window smoothly, line by line scroll
(setq scroll-step 1)
;; Display buffer name style
(setq frame-title-format "%b@czx")
;; Enable version-control
(setq version-control t)
;; Copy and Paste in Emacs
;; yank --> C-y, cut --> C-w, yank-next --> M-y, copy --> M-w
(defun show-curr-major-mode ()
  (interactive)
  (message "%s" major-mode))

;; ;; redo and undo
;; (defvar undo-toggle t)
;; (defun undo-by-u ()
;;   "when `undo-by-u' is invoked, just type the `u' and it'll do the `undo' action until
;; `C-x, C-s' is typed. And then you still type `u', it'll do the `redo' action. To
;; enable this function you should type `C-c . u'"
;;   (interactive)
;;   (if undo-toggle
;;       (progn
;;         (message "open")
;;         (local-set-key "u" 'undo)
;;         (setq undo-toggle nil))
;;     (progn
;;       (message "close")
;;       (local-unset-key "u")
;;       (setq undo-toggle t))))
;; (global-set-key (kbd "C-c . u") 'undo-by-u)

;; insert time-stamp before saving
;; Time-stamp:
;; (add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-pattern nil)
(setq time-stamp-format
      "[%f] modified by BrownBear on %:a, %y-%02m-%02d at %02H:%02M:%02S on %s"
      time-stamp-active t
      time-stamp-warn-inactive t)
(defun my/insert-time-stamp ()
  "Insert time-stamp at the top of file"
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (insert comment-start)
    (insert " Time-stamp: <>")
    (open-line 1)
    (highlight-lines-matching-regexp "^[ ]*Time-stamp: <>")
    ))
;; (gl-set-key (kbd "C-x t") 'my/insert-time-stamp)
(setq c-default-style "linux" c-basic-offset 4)
