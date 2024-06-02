;; https://stackoverflow.com/questions/75178830/emacs-tab-line-mode-group-buffers-by-extension

(defvar my/group-by-buffer-extensions
  '("el" "yaml" "sh" "json")
  "Filename extension list used by function `my/group-by-buffer-extensions'.")

(defun my/group-by-buffer-extensions ()
  "Group buffers according to variable `my/group-by-buffer-extensions'.
Used as a value for `tab-line-tabs-function'."
  (let (bufs)
    (dolist (buf (buffer-list))
      (when-let* ((filename (buffer-file-name buf))
                  (ext (file-name-extension filename)))
        (when (member ext my/group-by-buffer-extensions)
          (push buf bufs))))
    (nreverse bufs)))

(setq tab-line-tabs-function #'my/group-by-buffer-extensions)
