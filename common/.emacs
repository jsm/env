(add-to-list 'load-path "~/.emacs.d/")
;; load some files
(require 'rspec-mode)

(load "ws-trim")

;; ws-trim settings
(global-ws-trim-mode t)
(set-default 'ws-trim-level 1)
(add-hook 'ws-trim-method-hook 'no-tabs-hook)
(defun no-tabs-hook ()
      (interactive)
        (if (string/= major-mode "html-mode")
                  (ws-trim-tabs)))

(put 'upcase-region 'disabled nil)

;; turn off tabs
(setq-default indent-tabs-mode nil)

;; move directory where backups are saved
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

;; ruby mode settings
(add-hook 'ruby-mode-hook
          (lambda ()
            (setq show-trailing-whitespace t)
            (local-set-key "\r" 'reindent-then-newline-and-indent)
            (setq indent-tabs-mode nil)
            (setq ruby-indent-tabs-mode f)))
;;            (add-hook 'before-save-hook
;;                      (lambda () (if (not indent-tabs-mode)
;;                                     (untabify (point-min) (point-max)))))))
(setq ruby-indent-level 4)

;; c mode settings
(add-hook 'c-mode-hook
          (lambda ()
            (setq c-basic-offset 4)))

;; html-mode settings
(add-hook 'html-mode-hook
          (lambda () (setq indent-tabs-mode t)))

;; whitespace settings
(autoload 'whitespace-mode           "whitespace" "Toggle whitespace visualization."        t)
(autoload 'whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)

(global-set-key (kbd "C-x w") 'delete-trailing-whitespace)
(global-set-key (kbd "C-n") 'newline)

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

(global-set-key (kbd "ESC <up>") 'move-line-up)
(global-set-key (kbd "ESC <down>") 'move-line-down)

(define-key global-map (kbd "RET") 'newline-and-indent)

;; aquamacs set opacity
(add-to-list 'default-frame-alist '(alpha . (80 70)))
;; aquamacs switch to white on black
(require 'color-theme)
(color-theme-tty-dark)

(defface extra-whitespace-face
  '((t (:background "pale green")))
  "Used for tabs and such.")
(defvar my-extra-keywords
  '(("\t" . 'extra-whitespace-face)))
(add-hook 'emacs-lisp-mode-hook
          (lambda () (font-lock-add-keywords nil my-extra-keywords)))
(add-hook 'text-mode-hook
          (lambda () (font-lock-add-keywords nil my-extra-keywords)))
(add-hook 'c-mode-common-hook
          (lambda () (font-lock-add-keywords nil my-extra-keywords)))

;; force tab
(global-set-key (kbd "C-<tab>") 'tab-to-tab-stop)

