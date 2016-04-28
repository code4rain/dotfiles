;;; clang-format-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "clang-format" "../../../../../.emacs.d/elpa/clang-format-20151116.438/clang-format.el"
;;;;;;  "532ddceb65909489a80afa4c78337a0d")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/clang-format-20151116.438/clang-format.el

(autoload 'clang-format-region "clang-format" "\
Use clang-format to format the code between START and END according to STYLE.
If called interactively uses the region or the current statement if there
is no active region.  If no style is given uses `clang-format-style'.

\(fn CHAR-START CHAR-END &optional STYLE)" t nil)

(autoload 'clang-format-buffer "clang-format" "\
Use clang-format to format the current buffer according to STYLE.

\(fn &optional STYLE)" t nil)

(defalias 'clang-format 'clang-format-region)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/clang-format-20151116.438/clang-format-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/clang-format-20151116.438/clang-format.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; clang-format-autoloads.el ends here
