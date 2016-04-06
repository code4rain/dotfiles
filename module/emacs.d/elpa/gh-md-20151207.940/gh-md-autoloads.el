;;; gh-md-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "gh-md" "../../../../../.emacs.d/elpa/gh-md-20151207.940/gh-md.el"
;;;;;;  "576d598df4c69800b2ee39a77ee6643c")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/gh-md-20151207.940/gh-md.el

(defalias 'gh-md-render-region #'gh-md-convert-region)

(autoload 'gh-md-convert-region "gh-md" "\
Show a preview the markdown from a region from BEGIN to END.

EXPORT writes a file.

\(fn BEGIN END &optional EXPORT)" t nil)

(autoload 'gh-md-render-buffer "gh-md" "\
Render the markdown content from BUFFER.

\(fn)" t nil)

(autoload 'gh-md-export-region "gh-md" "\
Export to a file the markdown content from region BEGIN to END.

\(fn BEGIN END)" t nil)

(autoload 'gh-md-export-buffer "gh-md" "\
Export to a file the markdown content from BUFFER.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/gh-md-20151207.940/gh-md-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/gh-md-20151207.940/gh-md.el")
;;;;;;  (22276 52701 58950 800000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; gh-md-autoloads.el ends here
