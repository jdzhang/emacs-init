;; version control
(defvar my-vc-packages '(
			 magit
			 ; magit-svn
			 ; psvn
			 )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-vc-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; svn
;(require 'psvn)

;; magit
(require 'magit)
(if (>= emacs-major-version 24)
    (require 'git-rebase)
    (require 'rebase-mode)
  )
;(add-hook 'magit-mode-hook (lambda()
;                             (require 'magit-svn)
;                             (if (magit-svn-get-ref-info)
;                                 (magit-svn-mode))))
(global-set-key "\C-xg" 'magit-status)


