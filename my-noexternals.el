;; ~/.emacs.d/my-noexternals.el

;; ERC
(load "~/.emacs.d/erc.el")

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

;; KEY REMAPPINGS - test
; remap cmd to meta
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;; quick pane switching
(define-key global-map (kbd "M-[") 'previous-multiframe-window)
(define-key global-map (kbd "M-]") 'other-window)

;; Quick kill buffer
(global-set-key "\M-w" 'kill-this-buffer)
;; Quick switch buffers
(global-set-key "\M-t" 'ido-switch-buffer)
;; Page up/down
(global-set-key "\M-K" 'evil-scroll-page-up)
(global-set-key "\M-J" 'evil-scroll-page-down)
;; Fixing paste
(global-set-key "\M-v" 'evil-paste-after)

;; after
(global-set-key "\M-s" 'save-buffer)

;; Find Find
(global-set-key "\M-f" 'ido-find-file)

;; Find File in project
(global-set-key "\M-p" 'projectile-find-file)

;; fonts
(set-face-attribute 'default nil
                    :family "Source Code Pro Medium" :height 135 :weight 'normal)

