;; .emacs

;; silence annoying warnings
(setq native-comp-async-report-warnings-errors 'silent)

(electric-pair-mode t)
(show-paren-mode t)
(global-display-line-numbers-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

;;(add-to-list 'initial-frame-alist '(fullscreen . fullheight))

(defun my/base (path)
  (expand-file-name (concat "~/.emacs.d/" path)))
(defun my/lisp (file)
  (concat (my/base "lisp/") file))
(defun my/load (file)
  (load (my/base (concat "my/" file))))

(add-to-list 'load-path (my/base "lisp"))

;; enable german umlauts in Citrix Light sessions using alternate input method
;; toggled via F8 (s.a. "keys.el")
(set-input-method 'latin-1-postfix)
(toggle-input-method)

(load "hippie-exp")

(require 'f)
(if (f-exists-p (my/lisp "markdown-mode.el"))
    (my/load "local")
  (my/load "melpa"))

;; CAUTION: load {custom,keys} {first,last}.
(my/load "custom")
(my/load "keywords")
(my/load "cursor")
(my/load "search")
(my/load "spaces")
(my/load "markdown")
(my/load "moccur")
(my/load "keys")

(setq custqom-file (my/base "my/custom.el"))

(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(server-start)
