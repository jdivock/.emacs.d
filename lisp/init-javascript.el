(require-package 'ac-js2)
(require-package 'js-comint)
(require-package 'js2-mode)
(require-package 'json-mode)
(require-package 'jsx-mode)
(require-package 'flycheck)
;;; Set better js mode for js files
(setq-default js2-auto-indent-p t)
(setq-default js2-cleanup-whitespace t)
(setq-default js2-enter-indents-newline t)
(setq-default js2-global-externs "jQuery $")
(setq-default js2-indent-on-enter-key t)
(setq-default js2-mode-indent-ignore-first-tab t)
;; Letting flycheck parse errors since it respects jshint
(setq-default js2-show-parse-errors nil)

(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'js2-mode-hook 'color-identifiers-mode)

(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(require 'flycheck)
(add-hook 'js2-mode-hook
          (lambda () (flycheck-mode t)))


(font-lock-add-keywords
 'js2-mode `(("\\(function *\\)("
              (0 (progn (compose-region (match-beginning 1) (match-end 1) "ƒ")
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
