;; version control
(defvar versioncontrol-packages '(
                      psvn
		      magit
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p versioncontrol-packages)
  (when (not (package-installed-p p))
    (package-install p)))

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
(global-set-key "\C-xg" 'magit-status)


