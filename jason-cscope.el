;; xcscope
(require 'xcscope)
(cscope-setup)
(add-hook 'python-mode-hook (function cscope-minor-mode))
(add-hook 'sh-mode-hook (function cscope-minor-mode))
(setq cscope-do-not-update-database t)

