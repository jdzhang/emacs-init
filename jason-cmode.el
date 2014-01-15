;;;---------------------------------------------------------------------
;;; Stuff for C/C++ mode
;;;---------------------------------------------------------------------

;; use spaces in stead of tabs, overwrite it in customer style like
;; kernel as needed
;;(setq indent-tabs-mode nil)

(defmacro add-hook* (hook &rest args)
  "Packages up ARGS into a lambda and puts it on HOOK."
  (list 'add-hook hook (list 'function (cons 'lambda (cons () args)))))

(defconst my-c-style
  '((c-basic-offset              . 4)
    (c-tab-always-indent         . nil)
    (indent-tab-mode             . nil) ; tab create spaces
    (c-hungry-delete-key         . t)
    (c-hanging-comment-ender-p   . nil)
    (c-auto-newline              . t)
    (c-offsets-alist
     . ((substatement-open       . 0)          ;don't indent braces!
        (inline-open             . 0)          ;don't indent braces, please.
        (label                   . -1000)      ;flush labels left
        (statement-cont          . c-lineup-math)))))

(defconst my-kernel-style
  '((c-basic-offset              . 8)
    (c-tab-always-indent         . nil)
    (indent-tabs-mode            . t)
    (c-hungry-delete-key         . t)
    (c-hanging-comment-ender-p   . nil)
    (c-offsets-alist
     . ((substatement-open       . 0)          ;don't indent braces!
        (inline-open             . 0)          ;don't indent braces, please.
        (label                   . -1000)      ;flush labels left
        (statement-cont          . c-lineup-math)))))

(add-hook* 'c-mode-common-hook
  (c-add-style "me-c" my-c-style)
  (c-add-style "me-kernel" my-kernel-style)
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  )

(defun guess-a-style ()
      (if (and buffer-file-name
                 (string-match "kernel" buffer-file-name))
        (c-set-style "me-kernel")
        (c-set-style "me-c")
        ))

(add-hook 'c-mode-hook 'guess-a-style)
(setq c-default-style '(;(jave-mode . "java")
                        (other . "me-c")
                        ))

;; compile code, from http://www.emacswiki.org/emacs/CompileCommand
;; by order of Makefile, environment variables, defaults
(require 'compile)
(add-hook 'c-mode-hook
           (lambda ()
	     (unless (file-exists-p "Makefile")
	       (set (make-local-variable 'compile-command)
                    ;; emulate make's .c.o implicit pattern rule, but with
                    ;; different defaults for the CC, CPPFLAGS, and CFLAGS
                    ;; variables:
                    ;; $(CC) -c -o $@ $(CPPFLAGS) $(CFLAGS) $<
		    (let ((file (file-name-nondirectory buffer-file-name)))
                      (format "%s -c -o %s.o %s %s %s"
                              (or (getenv "CC") "gcc")
                              (file-name-sans-extension file)
                              (or (getenv "CPPFLAGS") "-DDEBUG=9")
                              (or (getenv "CFLAGS") "-ansi -pedantic -Wall -g")
			      file))))))
(global-set-key [f9] 'compile)

;; gdb
;; this opens multiple windows (local watch, etc.)
(setq gdb-many-windows t);
(global-set-key [f10] 'gdb)


