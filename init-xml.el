;; xml & other language modes

(defvar data-packages '(
                        yaml-mode
                        )
  "A list of packages for data format modes")

(dolist (p data-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))

(add-to-list 'auto-mode-alist '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode))
(setq nxml-child-indent 4)

