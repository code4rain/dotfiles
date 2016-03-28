;;; orgit-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "orgit" "../../../../../.emacs.d/elpa/orgit-20160119.1424/orgit.el"
;;;;;;  "5229d1ae1d7e558e7bbe93cff65ccbe5")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/orgit-20160119.1424/orgit.el

(eval-after-load "org" '(progn (org-add-link-type "orgit" 'orgit-status-open 'orgit-status-export) (add-hook 'org-store-link-functions 'orgit-status-store)))

(autoload 'orgit-status-store "orgit" "\


\(fn)" nil nil)

(autoload 'orgit-status-open "orgit" "\


\(fn PATH)" nil nil)

(autoload 'orgit-status-export "orgit" "\


\(fn PATH DESC FORMAT)" nil nil)

(eval-after-load "org" '(progn (org-add-link-type "orgit-log" 'orgit-log-open 'orgit-log-export) (add-hook 'org-store-link-functions 'orgit-log-store)))

(autoload 'orgit-log-store "orgit" "\


\(fn)" nil nil)

(autoload 'orgit-log-open "orgit" "\


\(fn PATH)" nil nil)

(autoload 'orgit-log-export "orgit" "\


\(fn PATH DESC FORMAT)" nil nil)

(eval-after-load "org" '(progn (org-add-link-type "orgit-rev" 'orgit-rev-open 'orgit-rev-export) (add-hook 'org-store-link-functions 'orgit-rev-store)))

(autoload 'orgit-rev-store "orgit" "\


\(fn)" nil nil)

(autoload 'orgit-rev-open "orgit" "\


\(fn PATH)" nil nil)

(autoload 'orgit-rev-export "orgit" "\


\(fn PATH DESC FORMAT)" nil nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/orgit-20160119.1424/orgit-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/orgit-20160119.1424/orgit.el")
;;;;;;  (22264 48111 329312 558000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; orgit-autoloads.el ends here
