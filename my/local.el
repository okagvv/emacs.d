(message "Load and configure packages from local library.")

(load-library "markdown-mode")
(load-library "symbol-overlay")
(load-library "xterm-color")
(load-library "magit-delta")

(add-hook 'magit-mode-hook (lambda () (magit-delta-mode +1)))
