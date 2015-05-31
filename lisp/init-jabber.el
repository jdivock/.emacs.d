(load "~/.emacs.d/private/jabber-private.el")

(require-package 'jabber)

(defun jabber-presence-default-message (who oldstatus newstatus statustext) nil)
(add-hook 'jabber-chat-mode-hook (lambda ()
				   (visual-line-mode t)))

;; (setq jabber-account-list '(("uname@server"
;;     (:connection-type . ssl)
;;     (:anonymous nil)
;;     (:password . "pass"))))

;; attempt to auto-reconnect
(setq jabber-auto-reconnect t)
(setq jabber-chatstates-confirm nil)


;; Don't allow anonymous authentication
(defadvice jabber-xml-get-children (after eaw-remove-anonymous)
  (setq ad-return-value (remove '(mechanism nil "ANONYMOUS") ad-return-value)))
(ad-activate 'jabber-xml-get-children)

(provide 'init-jabber)
