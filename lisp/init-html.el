(require-package 'ac-html)
;;(require-package 'web-mode)
(require-package 'impatient-mode)

;;(require 'web-mode)
;;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(add-to-list 'auto-mode-alist '("\\.tmpl$" . html-mode))
(add-hook 'html-mode-hook 'ac-html-enable)
;; (add-to-list 'web-mode-ac-sources-alist
;;              '("html" . (ac-source-html-attribute-value
;;                          ac-source-html-tag
;;                          ac-source-html-attribute)))

(provide 'init-html)
