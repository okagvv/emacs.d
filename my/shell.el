;; Inspired by https://stackoverflow.com/a/42666026

(require 'ansi-color)

(defun ansi-color-apply-on-buffer ()
    (ansi-color-apply-on-region (point-min) (point-max)))

(defun ansi-color-apply-on-minibuffer ()
  (let ((bufs (remove-if-not
               (lambda (x) (string-starts-with (buffer-name x) " *Echo Area"))
               (buffer-list))))
    (dolist (buf bufs)
      (with-current-buffer buf
        (ansi-color-apply-on-buffer)))))

(defun ansi-color-apply-on-minibuffer-advice (proc &rest rest)
  (ansi-color-apply-on-minibuffer))

(advice-add 'shell-command :after #'ansi-color-apply-on-minibuffer-advice)
;; (advice-remove 'shell-command #'ansi-color-apply-on-minibuffer-advice)

;; It does not rely on shell-mode or comint. I accompany it with something like
;; the following to get nice test output (a green smiley with the count of
;; successful doctests.

(defun add-test-function (cmd)
  (interactive "sCommand to run: ")
  (setq my-testall-test-function cmd)
  (defun my-testall ()
    (interactive)
    (shell-command my-testall-test-function))
  (local-set-key [f9] 'my-testall))
