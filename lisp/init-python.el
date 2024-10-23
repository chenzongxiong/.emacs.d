;;; Package -- Summary
;;; Code:
;;; Commentary:

(require 'python-environment)
(require 'jedi)
(require 'elpy)

(setq python-shell-interpreter (concat (python-environment-root-path) "/bin/python"))
(setq elpy-rpc-python-command python-shell-interpreter)
(setq elpy-rpc-default-virtualenv-path (python-environment-root-path))

;; Python Ide
(defvar pip-command (concat (python-environment-root-path) "/bin/pip"))
(defvar py-autopep8-options '("--max-line-length=140"))

;; (setenv "IPY_TEST_SIMPLE_PROMPT" "1")

(defvar elpy-syntax-check-command (concat (python-environment-root-path) "/bin/flake8"))

;; install flake8
(defvar flake8-install-command (concat pip-command " install --upgrade flake8"))
;; install jupytext
(defvar jupytext-install-command (concat pip-command " install --upgrade jupytext"))

(unless (file-exists-p elpy-syntax-check-command)
  (shell-command-to-string flake8-install-command))

(unless (file-exists-p (concat (python-environment-root-path) "/bin/jupytext"))
  (shell-command-to-string jupytext-install-command))



;; (setenv "WORKON_HOME" python-shell-virtualenv-path)
;; (defvar pyvenv-activate (getenv "WORKON_HOME"))

;; (defvar python-shell-interpreter (concat my-virtualenv-path "/bin/python3"))
;; (defvar jedi:environment-root python-shell-virtualenv-path)

(defvar jedi:complete-on-dot t)
(defvar jedi:tooltip-method t)
(defvar elpy-rpc-backend "jedi")
(defvar python-indent-guess-indent-offset nil)

(defun ipdb-break-point()
  (interactive)
  (insert "import ipdb; ipdb.set_trace()")
  )

(add-hook 'python-mode-hook (lambda ()
                              (require 'jedi)
                              (require 'elpy)
                              (require 'conda nil t)
                              (jedi:setup)
                              (elpy-enable)
                              (conda-env-initialize-interactive-shells)
                              ;; if you want eshell support, include:
                              (conda-env-initialize-eshell)
                              ;; if you want auto-activation (see below for details), include:
                              (conda-env-autoactivate-mode t)
                              ))

;; if you want to automatically activate a conda environment on the opening of a file:
;; (add-to-hook 'find-file-hook (lambda () (when (bound-and-true-p conda-project-env-path)
;;                                           (conda-env-activate-for-buffer))))

(custom-set-variables
 '(conda-anaconda-home "/opt/homebrew/Caskroom/miniconda/base"))

(provide 'init-python)

;;; init-python.el ends here
