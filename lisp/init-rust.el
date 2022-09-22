
;; (setq rust-format-on-save nil)
(setq lsp-rust-server 'rust-analyzer)
(add-hook 'rust-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)))
;; (lambda ()
;;   (if (string-match "substrate" buffer-file-name)
;;     (rust-disable-format-on-save)))
;; (rust-disable-format-on-save)
;; (require 'rust-mode)
(setq racer-rust-src-path "/home/zxchen/.rustup/toolchains/nightly-2020-10-06-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library")

;; (add-hook 'rust-mode-hook #'racer-mode)
;; (add-hook 'racer-mode-hook #'eldoc-mode)
;; (
 ;; add-hook 'racer-mode-hook #'company-mode)
;; (yas-minor-mode-on)
(provide 'init-rust)
