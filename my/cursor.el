(setq my/read-only-cursor-color "gray")
(setq my/overwrite-cursor-color "blue")
(setq my/normal-cursor-color "red")
(defun my/set-cursor-color-according-to-mode ()
  "change cursor color according to some minor modes."
  (cond
    (buffer-read-only
      (set-cursor-color my/read-only-cursor-color))
    (overwrite-mode
      (set-cursor-color my/overwrite-cursor-color))
    (t 
      (set-cursor-color my/normal-cursor-color))))
(add-hook 'post-command-hook 'my/set-cursor-color-according-to-mode)
