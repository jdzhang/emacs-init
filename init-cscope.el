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
(add-hook 'java-mode-hook (function cscope-minor-mode))
(setq cscope-do-not-update-database t)
(setq cscope-option-use-inverted-index t)

(defun cscope-set-kernel-mode ()
  "switch cscope into kernel mode and use reverted index"
  (interactive)
  (setq cscope-option-kernel-mode t)
  )

(defun cscope-reset-kernel-mode ()
  "switch to default"
  (interactive)
  (setq cscope-option-kernel-mode nil)
  )
