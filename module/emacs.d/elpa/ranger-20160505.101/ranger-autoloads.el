;;; ranger-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "ranger" "../../../../../.emacs.d/elpa/ranger-20160505.101/ranger.el"
;;;;;;  "26c848967e59c7a4aa78731a729ffa85")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/ranger-20160505.101/ranger.el

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

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/ranger-20160505.101/ranger-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/ranger-20160505.101/ranger.el")
;;;;;;  (22318 50521 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; ranger-autoloads.el ends here
