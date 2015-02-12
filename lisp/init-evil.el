(require-package 'evil)
;; VIM MODE
(require 'evil)
(evil-mode 1)

;; change mode-line color by evil state
; (lexical-let ((default-color (cons (face-background 'mode-line)
; 				   (face-foreground 'mode-line))))
; 	     (add-hook 'post-command-hook
; 		       (lambda ()
; 			 (let ((color (cond ((minibufferp) default-color)
; 					    ((evil-insert-state-p) '("#e80000" . "#ffffff"))
; 					    ((evil-emacs-state-p)  '("#444488" . "#ffffff"))
; 					    ((buffer-modified-p)   '("#006fa0" . "#ffffff"))
; 					    (t default-color))))
; 			   (set-face-background 'mode-line (car color))
; 			   (set-face-foreground 'mode-line (cdr color))))))
;

; (defface my-narrow-face
; 	 '((t (:foreground "black" :background "yellow3")))
; 	 "todo/fixme highlighting."
; 	 :group 'faces)
;
; (defface my-read-only-face
; 	 '((t (:foreground "black" :background "orange3")))
; 	 "Read-only buffer highlighting."
; 	 :group 'faces)
;
; (defface my-modified-face
; 	 '((t (:foreground "gray80" :background "red4")))
; 	 "Modified buffer highlighting."
; 	 :group 'faces)
;
; (setq-default
;   mode-line-format
;   '("  "
;     (:eval (let ((str (if buffer-read-only
; 			(if (buffer-modified-p) "%%*" "%%%%")
; 			(if (buffer-modified-p) "**" "--"))))
; 	     (if buffer-read-only
; 	       (propertize str 'face 'my-read-only-face)
; 	       (if (buffer-modified-p)
; 		 (propertize str 'face 'my-modified-face)
; 		 str)
; 	       (list 'line-number-mode "  ")
; 	       (:eval (when line-number-mode
; 			(let ((str "L%l")
; 			      (if (/= (buffer-size)  (- (point-max)  (point-min))
; 				      (propertize str 'face 'my-narrow-face)
; 				      str)
; 				"  %p"
; 				(list 'column-number-mode "  C%c")
; 				"  " mode-line-buffer-identification
; 				"  " mode-line-modes)
; 			      )))
; 		      )
;; Mapping 'jk' to insert mode
(define-key evil-insert-state-map "j" #'cofi/maybe-exit)

(evil-define-command cofi/maybe-exit ()
  :repeat change
  (interactive)
  (let ((modified (buffer-modified-p)))
    (insert "j")
    (let ((evt (read-event (format "Insert %c to exit insert state" ?j)
               nil 0.5)))
      (cond
       ((null evt) (message ""))
       ((and (integerp evt) (char-equal evt ?k))
    (delete-char -1)
    (set-buffer-modified-p modified)
    (push 'escape unread-command-events))
       (t (setq unread-command-events (append unread-command-events
                          (list evt))))))))

(provide 'init-evil)
