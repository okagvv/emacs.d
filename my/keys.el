(global-set-key [C-tab] 'hippie-expand)
(global-set-key [backtab] 'comint-dynamic-complete-filename)

(defvar MyMap1 nil "function keys with prefix [menu]")
(setq   MyMap1 (make-keymap))
(defvar MyMap2 nil "function keys with prefix double [menu]")
(setq   MyMap2 (make-keymap))
(defvar MyMap3 nil "function keys with prefix triple [menu]")
(setq   MyMap3 (make-keymap))

(define-key global-map [menu] MyMap1)
(define-key MyMap1  [menu] MyMap2)
(define-key MyMap2  [menu] MyMap3)

(define-key MyMap1 " " 'my/whitespace-cleanup)
(define-key MyMap2 " " 'fixup-whitespace)
(define-key MyMap3 " " 'delete-blank-lines)

(define-key MyMap1 "g" 'goto-line)
(define-key MyMap1 "l" 'linum-mode)
(define-key MyMap1 "m" 'magit-status)
(define-key MyMap1 "x" 'switch-to-next-buffer)

(define-key MyMap1 "t" 'transpose-windows)
(define-key MyMap2 "t" 'transpose-words)
(define-key MyMap3 "t" 'transpose-lines)

;;(define-key MyMap1 "h" 'highlight-regexp-current-word)
;;(define-key MyMap2 "h" 'highlight-regexp-clear)

(global-set-key       [f1] 'undo)
(global-set-key       [f2] 'fill-region-as-paragraph)

(global-set-key    [f3] 'bookmark-jump)
(define-key MyMap1 [f3] 'bookmark-set)
(define-key MyMap2 [f3] 'list-bookmarks)

(global-set-key    [f5] 'my/repeat-last-search)
(define-key MyMap1 [f5] 'my/search-forward)
(define-key MyMap2 [f5] 'my/search-backward)

(global-set-key    [f6] 'query-replace)
(define-key MyMap1 [f6] 'query-replace-regexp)
(define-key MyMap2 [f6] 'isearch-forward)
(define-key MyMap3 [f6] 'isearch-backward)

(global-set-key    [f9] 'find-file)

(global-set-key    [f10] 'bs-show)

;; F11 bindings create conflicts in Citrix sessions using HTML5 client!

(global-set-key    [f12] 'save-buffer)

(define-key MyMap1 [insert] 'yank)
;;(define-key MyMap2 [insert] 'copy-current-line)

(global-set-key    [kp-delete]     'kill-word)
(define-key MyMap1 [kp-delete]     'kill-whole-line)
;;(define-key MyMap1 [kp-subtract]   'match-paren)
;;(global-set-key       [kp-enter]      'framepop-toggle-frame)
(define-key MyMap1 [kp-enter]      'newline-and-indent)
;;(define-key MyMap2 [kp-enter]      'message-elide-region)
;;(define-key MyMap3 [kp-enter]      'insert-cut-here)
;;(define-key MyMap1 [kp-add]        'ipause)

(global-set-key       [C-kp-left]     'indent-rigidly-left)
(global-set-key       [C-kp-right]    'indent-rigidly-right)
(global-set-key       [C-kp-4]        'indent-rigidly-left)
(global-set-key       [C-kp-6]        'indent-rigidly-right)

;;(global-set-key       [C-kp-0]        'goto-last-change)
;;(global-set-key       [C-kp-subtract] 'fold-dwim-hide-all)
;;(global-set-key       [C-kp-add]      'fold-dwim-show-all)
;;(global-set-key       [C-kp-enter]    'fold-dwim-toggle)

(global-set-key       [M-kp-left]  'backward-list)
(global-set-key       [M-kp-right] 'forward-list)
(global-set-key       [M-kp-4]     'backward-list)
(global-set-key       [M-kp-6]     'forward-list)

(global-set-key       [C-M-kp-enter]  'bury-buffer)

(setq mouse-yank-at-point nil)

(global-set-key [S-down-mouse-1] 'imenu)
(global-set-key [S-down-mouse-2] 'yank-menu)
(global-set-key [S-down-mouse-3] 'ffap-at-mouse)
(global-set-key [M-S-mouse-2]    'imenu-go-find-at-position)
(global-set-key [M-S-C-mouse-2]  'imenu-go-back)

;; enable context menu without enabling context-menu-mode (highjacks [menu] required for MyMaps)
;; "<down-mouse-3> <mouse3>" must keep its default (mouse-save-then-kill)
;; <ctrl-down-mouse-3> does not work, <shift-mouse-3> is already allocated,
;; <alt-mouse-3> is not availbale in Citrix session
(global-set-key [C-S-down-mouse-3] context-menu-entry)

(global-set-key    [M-kp-2] 'symbol-overlay-put)
(global-set-key    [M-kp-3] 'symbol-overlay-jump-next)
(global-set-key    [M-kp-1] 'symbol-overlay-jump-prev)
(define-key MyMap1 "o" 'symbol-overlay-mode)
(define-key MyMap2 "o" 'symbol-overlay-remove-all)

(define-key MyMap1 "m" 'multi-occur-in-this-mode)
