(when (eq system-type 'darwin)
  (setq mac-command-modifier nil)
  (setq mac-option-modifier 'meta)
  (message "The current system is Mac OSX"))

(when (eq system-type 'gnu/linux)
  (message "The current system is GNU/Linux"))
