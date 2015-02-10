; ~/.emacs.d/my-packages.el
(require 'cl)

(require 'package)
(add-to-list 'package-archives
	                  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
	                  '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defvar required-packages
  '(
    ac-html
    ac-js2
    auto-complete
    evil
    flymake-sass
    js-comint
    color-theme-sanityinc-tomorrow
    js2-mode
    json-mode
    jsx-mode
    less-css-mode
    multi-term
    nodejs-repl
    powerline
    projectile
    sass-mode
    scss-mode
    starter-kit
    wc-mode
    yasnippet
    web-mode) "a list of packages to load at launch.")
;

; method to check if all packages are installed
(defun packages-installed-p ()
    (loop for p in required-packages
	          when (not (package-installed-p p)) do  (return nil)
		          finally (return t)))

; if not all packages are installed, check one by one and install the missing ones.
(unless (packages-installed-p)
    ; check for new packages (package versions)
      (message "%s" "Emacs is now refreshing its package database...")
        (package-refresh-contents)
	  (message "%s" " done.")
	    ; install the missing packages
	      (dolist (p required-packages)
		    (when (not (package-installed-p p))
		            (package-install p))))
