;;--
;; Org mode
;;--
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org")
;; Set to the name of the file where new notes will be stored
;; (setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
;; no longer using modbile org
;;(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; from http://www.brool.com/index.php/using-org-mode-with-gtd
(setq org-agenda-custom-commands 
    '(("w" todo "WAITING" nil) 
    ("n" todo "NEXT" nil)
    ("d" "Agenda + Next Actions" ((agenda) (todo "NEXT")))
    ("p" tags "+PROJECT"))
)

;; Hi Jason,
;; thanks for starting this discussion.
;;
;; It seems to me that you are mainly concerned about dynamically 
;; producing a list of projects.  Have you thought about using a special 
;; tag for the top line of all project, something like :PROJECT:?
;; You can then get a list of all projects by making a tags search on
;; :PROJECT:, for example through a custom search like
;;
;; (setq org-agenda-custom-commands
;;        '(("p" tags "+PROJECT")))
;;
;; This will get you the list with `C-c a p'.
;;
;; You may run into problems with this approach if you have set 
;; org-tags-match-list-sublevels to a non-nil value, because then, due to 
;; tag inheritance, every headline *inside* each project will also show up 
;; in the resulting list.  To work around this, you may define your own 
;; special command like this:
;;
;; (defun my-org-project-list ()
;;    "Get me a list of projects."
;;    (interactive)
;;    (let ((org-tags-match-list-sublevels nil))
;;      (org-tags-view nil "+PROJECT")))
;;
;; Hope this helps.
;; - Carsten

