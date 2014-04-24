;; experimenting init.el, starting with python stuff
;;
(defvar my-packages '(;starter-kit
                      ;starter-kit-bindings
                      ;starter-kit-js
                      python-mode
                      magit
                      jedi
                      autopair
                      yasnippet
                      auto-complete
                      find-file-in-repository
                      ;fuzzy
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(require 'magit)
(require 'auto-complete)
(require 'autopair)
(require 'flymake)
(require 'yasnippet)

;; (global-set-key [f7] 'find-file-in-repository)

;; auto-complete mode extra settings
(setq
 ac-auto-start 2
 ac-override-local-map nil
 ac-use-menu-map t
 ac-candidate-limit 20)

;; -----------
;; Python-mode
(setq py-electric-colon-active t)       ;need to set per buffer
(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-hook 'python-mode-hook 'autopair-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)

;; -- auto complete
;; jedi setting
;; 1/1/14 - jedi server was raising errors on mac, will investigate later
;; need to do "pip install jedi epc"
(require 'jedi)
;; if changing python interpreter, need line like the following:
;; (setq jedi:server-args
;;       '("--sys-path"
;;         "/opt/local/Library/Frameworks/Python.framework/Versions/3.3/lib/python3.3"
;;         "--sys-path"
;;         "/opt/local/Library/Frameworks/Python.framework/Versions/3.3/lib/python3.3/site-packages"
;;        ))
;;(setq jedi:server-command
;;      '("/opt/local/Library/Frameworks/Python.framework/Versions/3.3/bin/python3.3"
;;        "/Users/jzhang/.emacs.d/elpa/jedi-0.1.2/jediepcserver.py"
;;        ))
(add-hook 'python-mode-hook
          (lambda()
            (jedi:setup)
            (jedi:ac-setup)
            (local-set-key "\C-cd" 'jedi:show-doc)
            (local-set-key (kbd "M-SPC") 'jedi:complete)
            (local-set-key (kbd "M-.") 'jedi:goto-definition)
            ))

;; ;; autocomplete
;; (require 'auto-complete-config)
;; (setq ac-dictionary-files (list (concat user-emacs-directory ".dict")))
;; (ac-config-default)
;; ;; hack to fix ac-sources after pycomplete.el breaks it
;; (add-hook 'python-mode-hook
;;           '(lambda ()
;;              (setq ac-sources '(ac-source-pycomplete
;;                                 ac-source-abbrev
;;                                 ac-source-dictionary
;;                                ac-source-words-in-same-mode-buffers))))

;; (defun load-pycomplete ()
;;   "Load and initialize pycomplete."
;;   (interactive)
;;   (let* ((pyshell (py-choose-shell))
;;          (path (getenv "PYTHONPATH")))
;;     (setenv "PYTHONPATH" (concat
;;                           (expand-file-name py-install-directory) "completion"
;;                           (if path (concat path-separator path))))
;;     (if (py-install-directory-check)
;;         (progn
;;           (setenv "PYMACS_PYTHON" (if (string-match "IP" pyshell)
;;                                       "python"
;;                                     pyshell))
;;           (autoload 'pymacs-apply "pymacs")
;;           (autoload 'pymacs-call "pymacs")
;;           (autoload 'pymacs-eval "pymacs")
;;           (autoload 'pymacs-exec "pymacs")
;;           (autoload 'pymacs-load "pymacs")
;;           (load (concat py-install-directory "completion/pycomplete.el") nil t)
;;           (add-hook 'python-mode-hook 'py-complete-initialize))
;;       (error "`py-install-directory' not set, see INSTALL"))))
;; (eval-after-load 'pymacs '(load-pycomplete))

;; pyflakes flymake integration
;; http://stackoverflow.com/a/1257306/347942
;; (when (load "flymake" t)
;;   (defun flymake-pyflakes-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "pyflakes" (list local-file))))
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.py\\'" flymake-pyflakes-init)))
;; (add-hook 'python-mode-hook 'flymake-mode)

;; todo
;; look intp integrating pep8 checker
;;
;; set pdb-path to correct file from default
;; '/usr/lib/python2.7/pdb.py

