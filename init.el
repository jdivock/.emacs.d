;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'init-utils)
(require 'init-elpa)
(require 'init-general)

;(require 'init-erc)
;(require 'init-jabber)

(require 'init-fonts)
(require 'init-key-mappings)
(require 'init-org-mode)
(require 'init-theme)

(require 'init-eshell)
(require 'init-markdown)
(require 'init-auto-complete)
(require 'init-yaml)
;(require 'init-javascript)
(require 'init-less)
(require 'init-fsharp)
(require 'init-sass)
(require 'init-day-one)
(require 'init-editorconfig)
;(require 'init-evil)
;(require 'init-powerline)
(require 'init-projectile)
(require 'init-helm)
(require 'init-project-explorer)
(require 'init-wc-mode)
(require 'init-yasnippet)
;(require 'init-html)
(require 'init-diminish)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(package-selected-packages
   (quote
	(fsharp-mode znc yasnippet yaml-mode wc-mode tern-auto-complete scss-mode sass-mode project-explorer powerline-evil nvm multi-term markdown-mode magit less-css-mode jsx-mode json-mode js-comint jabber impatient-mode helm-projectile helm-ag fullframe flymake-sass flycheck exec-path-from-shell diminish color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized ag ac-js2 ac-html)))
 '(safe-local-variable-values
   (quote
	((yaml-indent-offset . 4)
	 (web-mode-content-types-alist quote
								   (("jsx" . "**/*\\.ios.js\\'")))
	 (engine . jsx)
	 (flycheck-disabled-checkers quote
								 (javascript-jshint))
	 (indent-tabs-mode t)
	 (js2-indent-switch-body . t)
	 (auto-fill-mode . -1)
	 (sgml-basic-offset . 4)
	 (default-tab-width . 4)
	 (js-indent-offset . 4)
	 (css-indent-offset . 4)
	 (js-indent-offset . 8)
	 (css-indent-offset . 8)
	 (whitespace-line-column . 80)
	 (lexical-binding . t))))
 '(speedbar-show-unknown-files t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
