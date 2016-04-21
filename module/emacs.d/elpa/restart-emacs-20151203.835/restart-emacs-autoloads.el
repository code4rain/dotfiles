;;; restart-emacs-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "restart-emacs" "../../../../../.emacs.d/elpa/restart-emacs-20151203.835/restart-emacs.el"
;;;;;;  "23afe3347d402a8fcfaa8174b225472a")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/restart-emacs-20151203.835/restart-emacs.el

(autoload 'restart-emacs "restart-emacs" "\
Restart Emacs.

When called interactively ARGS is interpreted as follows

- with a single `universal-argument' (`C-u') Emacs is restarted
  with `--debug-init' flag
- with two `universal-argument' (`C-u') Emacs is restarted with
  `-Q' flag
- with three `universal-argument' (`C-u') the user prompted for
  the arguments

When called non-interactively ARGS should be a list of arguments
with which Emacs should be restarted.

\(fn &optional ARGS)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/restart-emacs-20151203.835/restart-emacs-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/restart-emacs-20151203.835/restart-emacs.el")
;;;;;;  (22296 32238 634477 81000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; restart-emacs-autoloads.el ends here
