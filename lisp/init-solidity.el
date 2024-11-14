(require 'solidity-mode)
(require 'solidity-flycheck)
(require 'company-solidity)

(setq solidity-flycheck-solc-checker-active t)

(add-hook 'solidity-mode-hook
	        (lambda ()
           (setq tab-width 2)
	          (set (make-local-variable 'company-backends)
		             (append '((company-solidity company-capf company-dabbrev-code))
			                   company-backends))))

(provide 'init-solidity)
