(require-package 'yasnippet)
;; SNIPPETS
(require 'yasnippet)
(yas-global-mode 1)

(add-auto-mode 'snippet-mode "\\.yasnippet\\'")

(setq yas-prompt-functions '(yas/ido-prompt)
      yas-use-menu 'abbreviate
      yas-verbosity 0)

(provide 'init-yasnippet)
