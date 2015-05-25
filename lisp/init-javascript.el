(require-package 'ac-js2)
(require-package 'js-comint)
(require-package 'js2-mode)
(require-package 'json-mode)
(require-package 'jsx-mode)
(require-package 'flycheck)
;;; Set better js mode for js files

;;(setq-default js2-auto-indent-p t)
;;(setq-default js2-cleanup-whitespace t)
;;(setq-default js2-enter-indents-newline t)
;;(setq-default js2-global-externs "jQuery $")
;;(setq-default js2-indent-on-enter-key t)
;;(setq-default js2-mode-indent-ignore-first-tab t)

;; Letting flycheck parse errors since it respects jshint
(setq-default js2-show-parse-errors nil)


;; Don't auto-quote in web mode, makes jsx a PITA
(setq web-mode-enable-auto-quoting nil)

(add-hook 'js2-mode-hook 'ac-js2-mode)
;;(add-hook 'js2-mode-hook 'color-identifiers-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.ios.js$" . web-mode))

;; JSON Mode
(add-to-list 'auto-mode-alist '("\\.jshintrc$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.eslintrc$" . json-mode))

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))

(setq web-mode-ac-sources-alist
      '(("css" . (ac-source-css-property))
        ("html" . (ac-source-words-in-buffer ac-source-abbrev))))

;; Flip to JSX mode when working with .ios.js files
(setq web-mode-content-types-alist
      '(("jsx" . "**/*\\.ios.js\\'")
        ))

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))


;; JSX MODE
;; Shitty js2-mode support and won't indent, so using web-mode
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(require 'flycheck)
(add-hook 'js2-mode-hook
          (lambda () (flycheck-mode t)))

(add-hook 'web-mode-hook
          (lambda () (flycheck-mode t)))

(font-lock-add-keywords
 'js2-mode `(("\\(function *\\)("
              (0 (progn (compose-region (match-beginning 1) (match-end 1) "λ")
                        nil)))))
;; TODO: fix copypasta
(font-lock-add-keywords
 'web-mode `(("\\(function *\\)("
              (0 (progn (compose-region (match-beginning 1) (match-end 1) "λ")
                        nil)))))

;; JS NODE REPL
(autoload 'js-comint "js-comint"
  "Hooking JavaScript interpreter up to the JS Files." t nil)

(setenv "NODE_NO_READLINE" "1")   ;; Turn off fancy node prompt
;; Use node as our repl
(setq inferior-js-program-command "node")

(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list
         'comint-preoutput-filter-functions
         (lambda (output)
           (replace-regexp-in-string "\033\\[[0-9]+[GK]" "" output)
           (replace-regexp-in-string ".*1G.*3G" "&GT;" output)
           (replace-regexp-in-string "&GT;" "> " output)))))

(defun my/js-keybindings ()
  (interactive)
  (local-set-key (kbd "C-c C-c") 'js-send-buffer)
  (local-set-key (kbd "C-c C-r") 'js-send-region)
  (local-set-key (kbd "C-c C-s") 'js-send-last-sexp)
  (local-set-key (kbd "C-c C-z") 'run-js))

(add-hook 'js-mode-hook 'my/js-keybindings)
(add-hook 'js2-mode-hook 'my/js-keybindings)

(provide 'init-javascript)
