(require-package 'starter-kit)
;; GENERAL BEHAVIOR
(setq-default truncate-lines t) ;; truncate lines by default
;; Change backup dir and update more frequently
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;;; fix fullscreen to not be mac naitive
(setq ns-use-native-fullscreen nil)
;; (toggle-frame-fullscreen) ;; and start in full screen while we're at it

(provide 'init-general)
