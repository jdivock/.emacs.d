(require-package 'helm)
(require-package 'helm-projectile)
;; helm settings (TAB in helm window for actions over selected items,
;; C-SPC to select items)
(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-locate)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
(setq helm-buffers-fuzzy-matching t)

(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(global-set-key (kbd "M-x") 'helm-M-x)

;; (defun helm-my-buffers ()
;;   (interactive)
;;   (let ((helm-ff-transformer-show-only-basename nil))
;;   (helm-other-buffer '(helm-c-source-buffers-list
;;                        helm-c-source-elscreen
;;                        helm-c-source-projectile-files-list
;;                        helm-c-source-ctags
;;                        helm-c-source-recentf
;;                        helm-c-source-locate)
;;                      "*helm-my-buffers*")))


(provide 'init-helm)
