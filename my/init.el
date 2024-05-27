;; .emacs

(electric-pair-mode t)
(show-paren-mode t)
(global-display-line-numbers-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

;; silence annoying warnings
(setq native-comp-async-report-warnings-errors 'silent)

(defun my/lib (sub-dir)
  (expand-file-name (concat "~/.emacs.d/" sub-dir)))

(defun my/load (file)
  (load (my/lib (concat "my/" file))))

(setq custom-file (my/lib "my/custom.el"))

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(load "hippie-exp")

;; CAUTION: load {custom,keys} {first,last}.
(my/load "custom")
(my/load "keywords")
(my/load "cursor")
(my/load "search")
(my/load "spaces")
(my/load "moccur")
(my/load "keys")

(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))

(server-start)
