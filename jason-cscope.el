;; xcscope
(defvar cscope-packages '(
                      xcscope
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p cscope-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(require 'xcscope)
(cscope-setup)
(add-hook 'python-mode-hook (function cscope-minor-mode))
(add-hook 'sh-mode-hook (function cscope-minor-mode))
(add-hook 'nxml-mode-hook (function cscope-minor-mode))
(setq cscope-do-not-update-database t)

