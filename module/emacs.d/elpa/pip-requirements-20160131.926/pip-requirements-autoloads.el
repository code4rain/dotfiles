;;; pip-requirements-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "pip-requirements" "../../../../../.emacs.d/elpa/pip-requirements-20160131.926/pip-requirements.el"
;;;;;;  "6f53fb3952f9e512e7272d5ad98b044c")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/pip-requirements-20160131.926/pip-requirements.el

(add-to-list 'auto-mode-alist `(,(rx ".pip" string-end) . pip-requirements-mode))

(add-to-list 'auto-mode-alist `(,(rx "requirements" (zero-or-more anything) ".txt" string-end) . pip-requirements-mode))

(autoload 'pip-requirements-auto-complete-setup "pip-requirements" "\
Setup Auto-Complete for Pip Requirements.

See URL `https://github.com/auto-complete/auto-complete' for
information about Auto Complete.

\(fn)" nil nil)

(autoload 'pip-requirements-mode "pip-requirements" "\
Major mode for editing pip requirements files.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/pip-requirements-20160131.926/pip-requirements-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/pip-requirements-20160131.926/pip-requirements.el")
;;;;;;  (22296 32228 919155 586000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; pip-requirements-autoloads.el ends here
