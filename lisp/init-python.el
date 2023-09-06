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
                              (jedi:setup)
                              (elpy-enable)
                              ))

;; (defconst jedi:server-args '("--virtualenv" "/opt/homebrew/Caskroom/miniconda/base/envs/.torch"))
;; (global-eldoc-mode -1)
(provide 'init-python)

;;; init-python.el ends here
