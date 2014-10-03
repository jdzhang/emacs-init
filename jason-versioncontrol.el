;; version control
(defvar my-vc-packages '(
			 magit
			 psvn
			 )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-vc-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; svn
(require 'psvn)

;; magit
(require 'magit)
(if (>= emacs-major-version 24)
    (require 'git-rebase-mode)
    (require 'rebase-mode))
(global-set-key "\C-xg" 'magit-status)


