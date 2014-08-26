(add-to-list 'load-path "~/.emacs.d")
;(add-to-list 'load-path "~/Dropbox/lisp")
(load "jason-packages")
(load "jason-general")
(load "jason-versioncontrol")
(load "jason-cmode")
(load "jason-python")
(load "jason-xml")
(load "jason-cscope")
;;(load "startup")

;; (setq x-select-enable-clipboard t)

;; ; trick from http://stackoverflow.com/questions/8606954/path-and-exec-path-set-but-emacs-does-not-find-executable
;; ; but doesn't seem to work, thus the explicit setq after, put it here to revisit when time allows
;; ; by default, emacs from launchpad gets very limited path, add more:
;; (defun set-exec-path-from-shell-PATH ()
;;   "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
;;    This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
;;   (interactive)
;;   (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
;;     (setenv "PATH" path-from-shell)
;;     (setq exec-path (split-string path-from-shell path-separator))))
;; (setq exec-path (concat '("~/bin") exec-path))

;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(make-backup-files nil)
; '(show-trailing-whitespace t)
; '(exec-path (quote ("/opt/local/bin" "/usr/bin" "/usr/local/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/MacPorts/Emacs.app/Contents/MacOS/libexec" "/Applications/MacPorts/Emacs.app/Contents/MacOS/bin" "/opt/local/Library/Frameworks/Python.framework/Versions/3.3/bin" "~/bin"))))
;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; )
