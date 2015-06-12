(require-package 'nvm)
(setq eshell-highlight-prompt t)

;; Paths
(defun eshell-mode-hook-func ()
  (setq eshell-path-env (concat "$HOME/bin:$HOME/.rvm/scripts/rvm:$HOME/.nvm/:" eshell-path-env))
  (setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
  (define-key eshell-mode-map (kbd "M-s") 'other-window-or-split))

(add-hook 'eshell-mode-hook 'eshell-mode-hook-func)

;; Replace weird colors
(defun color-escape-replace (string)
  (replace-regexp-in-string "\^\[\\\[2K\^\[\\\[0G" "" string))

(add-hook 'eshell-preoutput-filter-functions
          'color-escape-replace)

(provide 'init-eshell)
