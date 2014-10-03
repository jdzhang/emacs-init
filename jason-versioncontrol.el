;; version control
(defvar versioncontrol-packages '(
                      psvn
		      magit
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p versioncontrol-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; svn
(require 'psvn)

;; magit
(require 'magit)
(require 'rebase-mode)
(global-set-key "\C-xg" 'magit-status)


