;; ORG MODE
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/home.org"
                             "~/org/moving.org"))
(setq org-log-done t)

(provide 'init-org-mode)
