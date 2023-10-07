;;; Package -- Summary
;;; Code:
;;; Commentary:

;; Python Ide
(defconst py-autopep8-options '("--max-line-length=120"))

;; (setenv "IPY_TEST_SIMPLE_PROMPT" "1")

;; /home/zxchen/.venv3/bin/flake8
;; (setenv "WORKON_HOME" "/opt/homebrew/Caskroom/miniconda/base/envs")
;; (defconst python-shell-virtualenv-path "/opt/homebrew/Caskroom/miniconda/base/envs/.torch")
(defconst python-shell-virtualenv-path "~/.emacs.d/.python-environments/default")
(defconst my-virtualenv-path python-shell-virtualenv-path)
(defconst elpy-syntax-check-command "~/.pyenv/shims/flake8")
(defconst python-shell-interpreter (concat my-virtualenv-path "/bin/python"))

(setenv "WORKON_HOME" python-shell-virtualenv-path)
(defconst pyvenv-activate (getenv "WORKON_HOME"))

;; (defconst python-shell-interpreter (concat my-virtualenv-path "/bin/python3"))
;; (defconst jedi:environment-root python-shell-virtualenv-path)

(defconst jedi:complete-on-dot t)
(defconst jedi:tooltip-method t)
(defconst elpy-rpc-backend "jedi")
(defconst python-indent-guess-indent-offset nil)

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
