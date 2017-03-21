;;(require-package 'starter-kit)

(require-package 'multi-term)
;; GENERAL BEHAVIOR
(setq-default truncate-lines t) ;; truncate lines by default
;; Change backup dir and update more frequently
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq fill-column 80)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(setq default-tab-width 4)
;;; fix fullscreen to not be mac naitive
(setq ns-use-native-fullscreen nil)
;; (toggle-frame-fullscreen) ;; and start in full screen while we're at it

;; Make URLs clickable from shell
(add-hook 'shell-mode-hook (lambda () (goto-address-mode )))

;; For some reason mac isn't using system path which is causing some
;; fun issues
(require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(setq explicit-bash-args '("--login" "-i"))

(add-hook
 'eshell-mode-hook
 '(lambda ()
    (eshell/export "NODE_NO_READLINE=1")))

;;(defun after-save-fn () nil)
;;(add-hook 'after-save-hook 'after-save-fn)

(setenv "NVM_DIR" "/Users/jdivock/.nvm")
;; Whitespace cleanup, make sure this happens in all buffers
(add-hook 'before-save-hook 'whitespace-cleanup)

;; uh, not sure why this isn't set by default
(custom-set-variables
 '(speedbar-show-unknown-files t)
)

(provide 'init-general)
