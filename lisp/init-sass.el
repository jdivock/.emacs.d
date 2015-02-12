(require-package 'flymake-sass)
(require-package 'sass-mode)
(require-package 'scss-mode)

(require 'flymake-sass)
(add-hook 'sass-mode-hook 'flymake-sass-load)
(add-hook 'scss-mode-hook 'flymake-sass-load)

(require 'sass-mode)

(require 'scss-mode)
(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))

(provide 'init-sass)

