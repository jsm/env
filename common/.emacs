(add-to-list 'load-path "~/.emacs.d/")
(load "ws-trim")

(global-ws-trim-mode t)
(set-default 'ws-trim-level 1)

(put 'upcase-region 'disabled nil)

(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
	(,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))
(add-hook 'ruby-mode-hook
	  (lambda ()
	    (setq show-trailing-whitespace t)
	    (local-set-key "\r" 'reindent-then-newline-and-indent)
	    (setq ruby-indent-tabs-mode f)))
(setq ruby-indent-level 4)
(autoload 'whitespace-mode           "whitespace" "Toggle whitespace visualization."        t)
(autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)

(global-set-key (kbd "C-x w") 'delete-trailing-whitespace)

(defun move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (setq col (current-column))
  (beginning-of-line) (setq start (point))
  (end-of-line) (forward-char) (setq end (point))
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (insert line-text)
    ;; restore point to original column in moved line
    (forward-line -1)
    (forward-char col)))

(defun move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (move-line (if (null n) -1 (- n))))

(defun move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (move-line (if (null n) 1 n)))

(global-set-key (kbd "C-<escape>-<up>") 'move-line-u)
(global-set-key (kbd "C-<escape>-<down>") 'move-line-down)

(define-key global-map (kbd "RET") 'newline-and-indent)

(add-to-list 'default-frame-alist '(alpha . (80 70)))
