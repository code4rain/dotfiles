;;; hl-todo-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "hl-todo" "../../../../../.emacs.d/elpa/hl-todo-20151025.1220/hl-todo.el"
;;;;;;  "47f74e335513bd9c719feb2cabc436c0")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/hl-todo-20151025.1220/hl-todo.el

(autoload 'hl-todo-mode "hl-todo" "\
Highlight TODO tags in comments and strings.

\(fn &optional ARG)" t nil)

(defvar global-hl-todo-mode nil "\
Non-nil if Global-Hl-Todo mode is enabled.
See the command `global-hl-todo-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-hl-todo-mode'.")

(custom-autoload 'global-hl-todo-mode "hl-todo" nil)

(autoload 'global-hl-todo-mode "hl-todo" "\
Toggle Hl-Todo mode in all buffers.
With prefix ARG, enable Global-Hl-Todo mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Hl-Todo mode is enabled in all buffers where
`turn-on-hl-todo-mode-if-desired' would do it.
See `hl-todo-mode' for more information on Hl-Todo mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/hl-todo-20151025.1220/hl-todo-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/hl-todo-20151025.1220/hl-todo.el")
;;;;;;  (22276 52765 524638 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; hl-todo-autoloads.el ends here
