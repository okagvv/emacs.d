(message "Set-up melpa-stable package archive.")

(require 'package)

(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(message "Configure packages installed from melpa-stable.")

(use-package magit-delta :hook (magit-mode . magit-delta-mode))
