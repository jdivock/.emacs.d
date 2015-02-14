(defvar erc-terminal-notifier-command nil "/usr/local/bin/")
(setq erc-terminal-notifier-command (executable-find "terminal-notifier"))

(defun erc-terminal-notifier-notify (title message)
  "Show a message with `terminal-notifier-command`."
  (start-process "terminal-notifier"
                 "*terminal-notifier*"
                 erc-terminal-notifier-command
                 "-title" title
                 "-message" message
                 "-activate" "org.gnu.Emacs"
                 "-sender" "org.gnu.Emacs"))

(defun erc-terminal-notifier-text-matched (match-type nick message)
  "Show a notification, when user's nick is mentioned."
  (when (eq match-type 'current-nick)
    (unless (posix-string-match "^\\** *Users on #" message)
      (erc-terminal-notifier-notify
       (concat "ERC " (buffer-name (current-buffer)))
       (concat "\\<" (nth 0 (erc-parse-user nick)) "> " message)))))

(if (eq system-type 'darwin)
    (add-hook 'erc-text-matched-hook 'erc-terminal-notifier-text-matched))

(provide 'erc-terminal-notifier)
