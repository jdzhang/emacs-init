;; experimenting init.el, starting with python stuff
;;
(defvar python-packages '(
                      magit
                      elpy
                      flymake
                      py-autopep8
                      ein  ;; emacs ipython notebook
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p python-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'magit)

;; elpy
(elpy-enable)

; flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;(elpy-use-ipython)

