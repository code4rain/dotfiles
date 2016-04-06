;;; gitattributes-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "gitattributes-mode" "../../../../../.emacs.d/elpa/gitattributes-mode-20160319.302/gitattributes-mode.el"
;;;;;;  "1e1a5e9beab730c4a413ccb03cd1789e")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/gitattributes-mode-20160319.302/gitattributes-mode.el

(autoload 'gitattributes-mode "gitattributes-mode" "\
A major mode for editing .gitattributes files.
\\{gitattributes-mode-map}

\(fn)" t nil)

(dolist (pattern '("/\\.gitattributes\\'" "/info/attributes\\'" "/git/attributes\\'")) (add-to-list 'auto-mode-alist (cons pattern #'gitattributes-mode)))

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/gitattributes-mode-20160319.302/gitattributes-mode-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/gitattributes-mode-20160319.302/gitattributes-mode.el")
;;;;;;  (22276 52714 447716 600000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; gitattributes-mode-autoloads.el ends here
