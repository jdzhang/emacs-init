;; general editting settings

(defvar general-packages '(
                      hide-lines
                      )
  "A list of packages to ensure are installed at launch.")

(dolist (p general-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; abbreviation
(defalias 'yes-or-no-p 'y-or-n-p)

;; when dabbrev-expand expanding the work, let it preserve the case
;; pattern, this is useful in programming
(setq dabbrev-case-fold-search t)
(setq dabbrev-case-replace nil)


;; ==========================
;; Moving around and display
;; -------------------------------------------------------------------------
;;{{{ Search for selected text forward or backward courtesy jpatel@synopsys.com
(defun find-selection-forward ()
  "Find text cut buffer forward"
  (interactive "")
  (let (sel len)
    (setq sel (car kill-ring))
    (setq len (length sel))
    (search-forward sel)
    (deactivate-mark)
    (isearch-highlight (set-marker (make-marker) (- (point) len))
                       (set-marker (make-marker) (point)))
    )
  )

(defun find-selection-backward ()
  "Find text cut buffer forward"
  (interactive "")
  (let (sel len)
    (setq sel (car kill-ring))
    (setq len (length sel))
    (search-backward sel)
    (deactivate-mark)
    (isearch-highlight (set-marker (make-marker) (point))
                       (set-marker (make-marker) (+ (point) len)))
    )
  )
(global-set-key [f3] 'find-selection-forward)

;; hide-lines
(require 'hide-lines)
(global-set-key (kbd "C-c /") 'hide-lines)

;; split windows horizontally by default
(setq split-width-threshold 1000)

;; load log files in text-mode
;; this reduces the chance of emacs hogging cpu
(setq auto-mode-alist
      (cons '("\\.[1-9]\\'" . text-mode)
            auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.[1-9]\\.gz\\'" . text-mode)
            auto-mode-alist))


;;=========================================================================
;; Editing
;;-------------------------------------------------------------------------
;;; delete horizontal space in region
(defun delete-horizontal-space-region (beg-region end-region)
  "Deletes horizontal spaces at the end of every line in the region.
   BEG-REGION and END-REGION are args which specify the region
   boundaries."
  (interactive "*r")
  (let ((end-region-mark (make-marker))
        (save-point (point-marker)))
    (set-marker end-region-mark end-region)
    (goto-char beg-region)
    (end-of-line)
    (delete-horizontal-space)
    (while (and  (= (forward-line 1) 0)
                 (< (point) end-region-mark))
      (end-of-line)
      (delete-horizontal-space))
    (goto-char save-point)
    (set-marker end-region-mark nil)
    (set-marker save-point nil)))

;; -------------------------------------------------------------------------
;; find-assignment() and align-equals() courtesy of NTemacs mailing list
;;
;; To: unix-emacs@bbn.com
;; Date: 18 Nov 88 10:55:11 GMT
;; From: MIT.EDU!@EDDIE
;; Subject: Fn. to line up assigment ops.
;;
;; The following little bit of lisp will ensure the first assignment operators
;; on each of the lines line up. This is part of our local formatting style
;; 'cos it looks nice ;-)
;;
;; The style of the lisp however, is atrocious. All the problems come from ==,
;; which looks too much like 'op='.
;;
;; Enjoy.
;;
;; Paul Hudson
;;
;; Snail mail:      Monotype ADG Email:   ...!ukc!acorn!moncam!paul
;; Science Park,    paul@moncam.co.uk
;; Milton Road,     "Sun Microsysytems:
;; Cambridge,       The Company is Arrogant (TM)"
;; CB4 4FQ

(defun find-assignment ()
  (if (re-search-forward
       "[^<>=!]=\\|\\+=\\|-=\\|\\*=\\|/=\\|&=\\||=\\|\\^=\\|<<=\\|>>="
       (save-excursion (end-of-line) (point)) t)
      (progn
        (goto-char (match-beginning 0))
        (if (looking-at ".==")
            nil
          (if (looking-at "\\+=\\|-=\\|\\*=\\|/=\\|&=\\||=\\|\\^=\\|<<=\\|>>=")
              (set-mark (match-end 0))
            (forward-char 1)
            (set-mark (1+ (point))))
          (delete-horizontal-space)
          t))
    nil)
  )

(defun align-equals (start end)
  "make the first assignment operator on each line line up vertically"
  (interactive "*r")
  (save-excursion
    (let ((indent 0))
      (narrow-to-region start end)
      (beginning-of-buffer)
      (while (not (eobp))
        (if (find-assignment)
            (progn
              (exchange-point-and-mark)
              (setq indent (max indent (current-column)))
              (delete-horizontal-space)
              (insert " ")))
        (forward-line 1))
      (beginning-of-buffer)
      (while (not (eobp))
        (if (find-assignment)
            (indent-to-column (1+ (- indent  (- (mark) (point))))))
        (forward-line 1)))
    (deactivate-mark)
    (widen))
  )

;; undosfiy
(defun cut-ctrlM ()
   "Cut all visible ^M."
   (interactive)
   (beginning-of-buffer)
   (while (search-forward "\r" nil t)
    (replace-match "" nil t))
   (not-modified)
   (beginning-of-buffer))


;; =========================================================================
;; desktop save mode
(desktop-save-mode 1)

