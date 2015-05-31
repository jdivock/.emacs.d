;; ORG MODE
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/org"))
(setq org-log-done t)

(setq org-startup-indented t)
(setq org-hide-leading-stars t)
(setq org-odd-level-only nil)
(setq org-insert-heading-respect-content nil)

(setq org-use-speed-commands t)
(setq org-startup-align-all-tables nil)
(setq org-log-into-drawer nil)
(setq org-tags-column 1)
(setq org-ellipsis " \u25bc" )
(setq org-speed-commands-user nil)
(setq org-blank-before-new-entry '((heading . nil) (plain-list-item . nil)))

(setq org-indent-mode t)
(setq org-startup-truncated nil)

;; TRELLO ORG MODE - HAHA SHIT IS STILL BROKEN
;;(require-package 'org-trello)
;;(require 'org-trello)

;;(custom-set-variables '(org-trello-files '("~/org/moving.org")))

;; MOBILE ORG STUFF
;; Set to the location of your Org files on your local system
;(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
;(setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; Set to <your Dropbox root directory>/MobileOrg.
;(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; Hide properties


;; Mobile org mode timer
;; moble sync
;; (defvar org-mobile-sync-timer nil)
;; (defvar org-mobile-sync-idle-secs (* 60 10))
;; (defun org-mobile-sync ()
;;   (interactive)
;;   (org-mobile-pull)
;;   (org-mobile-push))
;; (defun org-mobile-sync-enable ()
;;   "enable mobile org idle sync"
;;   (interactive)
;;   (setq org-mobile-sync-timer
;;         (run-with-idle-timer org-mobile-sync-idle-secs t
;;                              'org-mobile-sync)));
;; (defun org-mobile-sync-disable ()
;;   "disable mobile org idle sync"
;;   (interactive)
;;   (cancel-timer org-mobile-sync-timer))
;; Not until I can figure out hot to hide properties, shit is annoying
;; (org-mobile-sync-enable)

(provide 'init-org-mode)
