;;; evil-matchit-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "evil-matchit" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit.el"
;;;;;;  "b6ca741919bcf4a77098c0f854b2da58")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit.el

(autoload 'evilmi-select-items "evil-matchit" "\
Select items/tags and the region between them

\(fn &optional NUM)" t nil)

(autoload 'evilmi-delete-items "evil-matchit" "\
Delete items/tags and the region between them

\(fn &optional NUM)" t nil)

(autoload 'evilmi-jump-to-percentage "evil-matchit" "\
Re-implementation of evil's similar functionality

\(fn NUM)" t nil)

(autoload 'evilmi-jump-items "evil-matchit" "\
Jump between item/tag(s)

\(fn &optional NUM)" t nil)

(autoload 'evilmi-version "evil-matchit" "\


\(fn)" t nil)

(autoload 'evil-matchit-mode "evil-matchit" "\
Buffer-local minor mode to emulate matchit.vim

\(fn &optional ARG)" t nil)

(autoload 'turn-on-evil-matchit-mode "evil-matchit" "\
Enable evil-matchit-mode in the current buffer.

\(fn)" nil nil)

(autoload 'turn-off-evil-matchit-mode "evil-matchit" "\
Disable evil-matchit-mode in the current buffer.

\(fn)" nil nil)

(defvar global-evil-matchit-mode nil "\
Non-nil if Global-Evil-Matchit mode is enabled.
See the command `global-evil-matchit-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-evil-matchit-mode'.")

(custom-autoload 'global-evil-matchit-mode "evil-matchit" nil)

(autoload 'global-evil-matchit-mode "evil-matchit" "\
Toggle Evil-Matchit mode in all buffers.
With prefix ARG, enable Global-Evil-Matchit mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Evil-Matchit mode is enabled in all buffers where
`turn-on-evil-matchit-mode' would do it.
See `evil-matchit-mode' for more information on Evil-Matchit mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "evil-matchit-c" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-c.el"
;;;;;;  "376e6c82b75b0df0a8fce3320e41633c")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-c.el

(autoload 'evilmi-c-get-tag "evil-matchit-c" "\


\(fn)" nil nil)

(autoload 'evilmi-c-jump "evil-matchit-c" "\


\(fn RLT NUM)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-cmake" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-cmake.el"
;;;;;;  "b9464ceb5260769933a4e92c5508edba")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-cmake.el

(autoload 'evilmi-cmake-get-tag "evil-matchit-cmake" "\


\(fn)" nil nil)

(autoload 'evilmi-cmake-jump "evil-matchit-cmake" "\


\(fn RLT NUM)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-fortran" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-fortran.el"
;;;;;;  "98d786cdca407a5c687d92fb1e5a98e9")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-fortran.el

(autoload 'evilmi-fortran-get-tag "evil-matchit-fortran" "\


\(fn)" nil nil)

(autoload 'evilmi-fortran-jump "evil-matchit-fortran" "\


\(fn RLT NUM)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-html" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-html.el"
;;;;;;  "e5458740ac1d9fe3307437e89dba7726")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-html.el

(autoload 'evilmi-html-get-tag "evil-matchit-html" "\


\(fn)" nil nil)

(autoload 'evilmi-html-jump "evil-matchit-html" "\


\(fn RLT NUM)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-javascript" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-javascript.el"
;;;;;;  "ac41fb38066d1f17bbc7288950adb60f")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-javascript.el

(autoload 'evilmi-javascript-get-tag "evil-matchit-javascript" "\


\(fn)" nil nil)

(autoload 'evilmi-javascript-jump "evil-matchit-javascript" "\


\(fn RLT NUM)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-latex" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-latex.el"
;;;;;;  "5d10fe2a3776ac820b9261c4532a27ac")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-latex.el

(autoload 'evilmi-latex-get-tag "evil-matchit-latex" "\


\(fn)" nil nil)

(autoload 'evilmi-latex-jump "evil-matchit-latex" "\


\(fn RLT NUM)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-org" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-org.el"
;;;;;;  "a3fbe6488ac1eb96474c6ec2c5ac3b24")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-org.el

(autoload 'evilmi-org-get-tag "evil-matchit-org" "\


\(fn)" nil nil)

(autoload 'evilmi-org-jump "evil-matchit-org" "\


\(fn RLT NUM)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-python" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-python.el"
;;;;;;  "9627b5afd292ab41018f8a4053351911")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-python.el

(autoload 'evilmi-python-get-tag "evil-matchit-python" "\


\(fn)" nil nil)

(autoload 'evilmi-python-jump "evil-matchit-python" "\


\(fn RLT NUM)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-ruby" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-ruby.el"
;;;;;;  "4a70f111100d624261bc7e0d87a975fc")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-ruby.el

(autoload 'evilmi-ruby-get-tag "evil-matchit-ruby" "\


\(fn)" nil nil)

(autoload 'evilmi-ruby-jump "evil-matchit-ruby" "\


\(fn RLT NUM)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-script" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-script.el"
;;;;;;  "2206f0cf829fab0973fcb75d476a8611")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-script.el

(autoload 'evilmi-script-get-tag "evil-matchit-script" "\


\(fn)" nil nil)

(autoload 'evilmi-script-jump "evil-matchit-script" "\


\(fn RLT NUM)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-sdk" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-sdk.el"
;;;;;;  "70796f288eaf93440f284bfb99e06a82")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-sdk.el

(autoload 'evilmi-sdk-member "evil-matchit-sdk" "\
check if KEYWORD exist in LIST

\(fn KEYWORD LIST)" nil nil)

(autoload 'evilmi-sdk-get-tag-info "evil-matchit-sdk" "\
return (row column is-function-exit-point keyword),
the row and column marked position in evilmi-mylang-match-tags
is-function-exit-point could be 'FN_EXIT' or other status

\(fn KEYWORD MATCH-TAGS)" nil nil)

(autoload 'evilmi-sdk-get-tag "evil-matchit-sdk" "\
return '(start-point tag-info)

\(fn MATCH-TAGS HOWTOS)" nil nil)

(autoload 'evilmi-sdk-jump "evil-matchit-sdk" "\


\(fn RLT NUM MATCH-TAGS HOWTOS)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-sh" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-sh.el"
;;;;;;  "137bf40ae96d253b5e7e8f9076849202")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-sh.el

(autoload 'evilmi-sh-get-tag "evil-matchit-sh" "\


\(fn)" nil nil)

(autoload 'evilmi-sh-jump "evil-matchit-sh" "\


\(fn RLT NUM)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-simple" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-simple.el"
;;;;;;  "dc893baaf16fc4399a1ce8843a6b2c7a")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-simple.el

(autoload 'evilmi-simple-get-tag "evil-matchit-simple" "\


\(fn)" nil nil)

(autoload 'evilmi-simple-jump "evil-matchit-simple" "\


\(fn RLT NUM)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-sql" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-sql.el"
;;;;;;  "0b8e6023525303567e1913906982be20")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-sql.el

(autoload 'evilmi-sql-get-tag "evil-matchit-sql" "\


\(fn)" nil nil)

(autoload 'evilmi-sql-jump "evil-matchit-sql" "\


\(fn RLT NUM)" nil nil)

;;;***

;;;### (autoloads nil "evil-matchit-template" "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-template.el"
;;;;;;  "9fd537d98417f0dc0d93762a5078bc91")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-template.el

(autoload 'evilmi-template-get-tag "evil-matchit-template" "\


\(fn)" nil nil)

(autoload 'evilmi-template-jump "evil-matchit-template" "\


\(fn RLT NUM)" nil nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-c.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-cmake.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-fortran.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-html.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-javascript.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-latex.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-org.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-python.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-ruby.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-script.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-sdk.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-sh.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-simple.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-sql.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit-template.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-matchit-20160413.625/evil-matchit.el")
;;;;;;  (22296 32056 841586 126000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; evil-matchit-autoloads.el ends here
