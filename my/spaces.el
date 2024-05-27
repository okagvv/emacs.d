(defun my/untabify-buffer ()
  "Untabify the entire buffer. Point and mark remain unchanged."
  (interactive "*")
  (untabify (point-min) (point-max)))

(defun my/tabify-buffer ()
  "Tabify the entire buffer. Point and mark remain unchanged."
  (interactive "*")
  (tabify (point-min) (point-max)))

(defun my/whitespace-cleanup ()
  "Clean-up white spaces (remove trailing whiet spaces and expand tabs) in current buffer."
  (interactive)
  (whitespace-cleanup)
  (my/untabify-buffer)
  (if (buffer-modified-p)
      (save-buffer)))
