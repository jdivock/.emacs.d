(require-package 'ac-js2)
(require-package 'js-comint)
(require-package 'js2-mode)
(require-package 'json-mode)
(require-package 'jsx-mode)
(require-package 'nodejs-repl)

;;; Set better js mode for js files
;;(add-hook 'js-mode-hook 'js2-minor-mode)
;;(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'ac-js2-mode)

(provide 'init-javascript)
