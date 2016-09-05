;; copy this file to .emacs in homedir
;;
;;; Mac OS X Setup
(when (eq system-type 'darwin)
  (setenv "PATH" (concat "/usr/local/go/bin:/usr/local/bin:/Users/jzhang/bin:" (getenv "PATH")))
  (setq exec-path (append '("/usr/local/go/bin" "/usr/local/bin") exec-path))
  )

(add-to-list 'load-path "~/.emacs.d/lisp")
(load "init-packages")
(load "init-general")
(load "init-versioncontrol")
(load "init-cmode")
(load "init-python")
(load "init-xml")
(load "init-cscope")

;; (setq x-select-enable-clipboard t)

