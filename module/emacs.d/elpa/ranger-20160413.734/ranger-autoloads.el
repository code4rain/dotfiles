;;; ranger-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "ranger" "../../../../../.emacs.d/elpa/ranger-20160413.734/ranger.el"
;;;;;;  "91ea7fe0bb27077cc497376e86c377b9")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/ranger-20160413.734/ranger.el

(defvar ranger-key [16] "\
`dired-mode' key used to toggle `ranger-mode'")

(custom-autoload 'ranger-key "ranger" t)

(defvar ranger-override-dired nil "\
When non-nil, load `deer' whenever dired is loaded.")

(custom-autoload 'ranger-override-dired "ranger" t)

(when ranger-key (add-hook 'dired-mode-hook (defun ranger-set-dired-key nil (define-key dired-mode-map ranger-key 'deer-from-dired))))

(autoload 'deer "ranger" "\
Launch dired in a minimal ranger window.

\(fn &optional PATH)" t nil)

(autoload 'ranger "ranger" "\
Launch dired in ranger-mode.

\(fn &optional PATH)" t nil)

(when ranger-override-dired (add-hook 'dired-mode-hook 'ranger-override-dired-fn))

(autoload 'ranger-override-dired-fn "ranger" "\
Open dired as deer unless already in ranger-mode

\(fn)" nil nil)

(autoload 'ranger-mode "ranger" "\
Major mode emulating the ranger file manager in `dired'.

\\{ranger-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/ranger-20160413.734/ranger-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/ranger-20160413.734/ranger.el")
;;;;;;  (22296 32237 344906 611000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; ranger-autoloads.el ends here
