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

;; For some reason mac isn't using system path which is causing some
;; fun issues
(require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq explicit-bash-args '("--login" "-i"))

(provide 'init-general)
