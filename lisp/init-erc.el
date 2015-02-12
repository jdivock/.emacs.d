(load "~/.emacs.d/private/erc.el")

(require 'erc-join)
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "#hugeinc" "#reactjs" )))

(require 'erc-match)
(setq erc-keywords '("jdivock"))
(erc-match-mode)

(require 'erc-track)
(erc-track-mode t)

(add-hook 'erc-mode-hook
          '(lambda ()
             (require 'erc-pcomplete)
             (pcomplete-erc-setup)
             (erc-completion-mode 1)))

(require 'erc-fill)
(erc-fill-mode t)

(require 'erc-ring)
(erc-ring-mode t)

(require 'erc-netsplit)
(erc-netsplit-mode t)

(erc-timestamp-mode t)
(setq erc-timestamp-format "[%R-%m/%d]")

;; logging:
(setq erc-log-insert-log-on-open nil)
(setq erc-log-channels t)
(setq erc-log-channels-directory "~/.irclogs/")
(setq erc-save-buffer-on-part t)
(setq erc-hide-timestamps nil)

(defadvice save-buffers-kill-emacs (before save-logs (arg) activate)
  (save-some-buffers t (lambda () (when (and (eq major-mode 'erc-mode)
                                        (not (null buffer-file-name)))))))

(add-hook 'erc-insert-post-hook 'erc-save-buffer-in-logs)
(add-hook 'erc-mode-hook '(lambda () (when (not (featurep 'xemacs))
                                  (set (make-variable-buffer-local
                                        'coding-system-for-write)
                                       'emacs-mule))))


;; Truncate buffers so they don't hog core.
(setq erc-max-buffer-size 20000)
(defvar erc-insert-post-hook)
(add-hook 'erc-insert-post-hook 'erc-truncate-buffer)
(setq erc-truncate-buffer-on-save t)

;;; Finally, connect to the networks.
(defun irc-maybe ()
  "Connect to IRC."
  (interactive)
  (when (y-or-n-p "IRC? ")
    (erc :server "irc.freenode.net" :port 6667
         :nick "jdivock" :full-name "Jason Divock")
    ))

(provide 'init-erc)
