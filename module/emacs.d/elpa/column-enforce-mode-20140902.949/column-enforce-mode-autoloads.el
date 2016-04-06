;;; column-enforce-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "column-enforce-mode" "../../../../../.emacs.d/elpa/column-enforce-mode-20140902.949/column-enforce-mode.el"
;;;;;;  "04708cb44b78f1d4cf80156c6de7d997")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/column-enforce-mode-20140902.949/column-enforce-mode.el

(autoload 'column-enforce-n "column-enforce-mode" "\
Turn on `column-enforce-mode' with warnings at column N.
N can be given as a prefix argument.

Ex:
  C-u 70 M-x column-enforce-n <enter>
  sets up `column-enforce-mode' to mark text that extends beyond 70 columns.

\(fn N)" t nil)

(autoload 'make-column-rule "column-enforce-mode" "\
Create an interactive function to enforce an N-column-rule.

\(fn N)" nil t)

(autoload 'column-enforce-mode "column-enforce-mode" "\
Minor mode for highlighting text that extends beyond a certain column.

Variable `column-enforce-column' decides which column to start warning at.
 Default is 80
Variable `column-enforce-face' decides how to display the warnings

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/column-enforce-mode-20140902.949/column-enforce-mode-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/column-enforce-mode-20140902.949/column-enforce-mode.el")
;;;;;;  (22276 52533 851387 100000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; column-enforce-mode-autoloads.el ends here
