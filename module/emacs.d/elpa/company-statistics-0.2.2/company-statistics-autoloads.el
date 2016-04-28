;;; company-statistics-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "company-statistics" "../../../../../.emacs.d/elpa/company-statistics-0.2.2/company-statistics.el"
;;;;;;  "d3b3cbf0c3bbd101de753baa4233d717")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/company-statistics-0.2.2/company-statistics.el

(defvar company-statistics-mode nil "\
Non-nil if Company-Statistics mode is enabled.
See the command `company-statistics-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `company-statistics-mode'.")

(custom-autoload 'company-statistics-mode "company-statistics" nil)

(autoload 'company-statistics-mode "company-statistics" "\
Statistical sorting for company-mode.  Ranks completion candidates by
the frequency with which they have been chosen in recent (as given by
`company-statistics-size') history.

Turning this mode on and off preserves the statistics.  They are also
preserved automatically between Emacs sessions in the default
configuration.  You can customize this behavior with
`company-statistics-auto-save', `company-statistics-auto-restore' and
`company-statistics-file'.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/company-statistics-0.2.2/company-statistics-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-statistics-0.2.2/company-statistics-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-statistics-0.2.2/company-statistics-tests.el"
;;;;;;  "../../../../../.emacs.d/elpa/company-statistics-0.2.2/company-statistics.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; company-statistics-autoloads.el ends here
