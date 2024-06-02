(setq my/search-last-command 'search-forward)
(setq my/search-command 'nil)
(setq my/search-last-string 'nil)
(setq my/search-string 'nil)
(setq my/search-mark 'nil)

(defun my/search-forward (arg string)
   "Nonincremental search forward. Use regexp version if ARG is non-nil."
   (interactive (if current-prefix-arg
                    (list nil (read-string "Search: " nil))
                  (list t (read-string "regexp/" nil))))
   (setq my/search-mark 'nil)
   (setq my/search-last-command (if arg 're-search-forward 'search-forward))
   (if (> (length string) 0) (setq my/search-last-string string))
   (funcall my/search-last-command my/search-last-string nil nil 1))

(defun my/search-backward (arg string)
   "Nonincremental search backward.  Use regexp version if ARG is non-nil."
   (interactive (if current-prefix-arg
                    (list nil (read-string "Backward search: " nil))
                  (list t (read-string "regexp?" nil))))
   (setq my/search-mark 'nil)
   (setq my/search-last-command (if arg 're-search-backward 'search-backward))
   (if (> (length string) 0) (setq my/search-last-string string))
   (funcall my/search-last-command my/search-last-string nil nil 1))

(defun my/repeat-last-search (arg &optional search-command search-string)
   "Repeat last search command.  If optional search-command/string are given,
    use those instead of the ones saved. In case a region is active then their
    contents is used as search string!"
   (interactive "p")
   (if mark-active
       (progn
         (setq my/search-last-string
               (buffer-substring (region-beginning) (region-end)))
         (setq my/search-last-command 'search-forward)
         (setq my/search-mark t)
         (setq mark-active 'nil)))
   (if (null my/search-string) (setq my/search-string my/search-last-string))
   (if (null my/search-command) (setq my/search-command my/search-last-command))
   (if (null my/search-command)
       (message "No last search command to repeat." (ding))
     (funcall my/search-command my/search-string nil nil arg))
   (if my/search-mark
       (progn
         (setq posit (point))
         (backward-char (length my/search-string))
         (set-mark (point))
         (goto-char posit))))

(defun my/reverse-last-search (arg &optional search-command search-string)
  "Redo last search command in reverse direction. If the optional search args
   are given, use those instead of the ones saved."
  (interactive "p")
  (if (null my/search-command) (setq my/search-command my/search-last-command))
  (if (null my/search-string) (setq my/search-string my/search-last-string))
  (if (null my/search-command)
      (message "No last search command to repeat." (ding))
    (funcall (cond ((eq my/search-command 're-search-forward) 're-search-backward)
                   ((eq my/search-command 're-search-backward) 're-search-forward)
                   ((eq my/search-command 'search-forward) 'search-backward)
                   ((eq my/search-command 'search-backward) 'search-forward))
             my/search-string nil nil arg)))

