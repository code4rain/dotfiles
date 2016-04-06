;;; gitconfig-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "gitconfig-mode" "../../../../../.emacs.d/elpa/gitconfig-mode-20160319.302/gitconfig-mode.el"
;;;;;;  "7ab7df1233beffe982c9f6f66fd2ff98")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/gitconfig-mode-20160319.302/gitconfig-mode.el

(autoload 'gitconfig-mode "gitconfig-mode" "\
A major mode for editing .gitconfig files.

\(fn)" t nil)

(dolist (pattern '("/\\.gitconfig\\'" "/\\.git/config\\'" "/modules/.*/config\\'" "/git/config\\'" "/\\.gitmodules\\'" "/etc/gitconfig\\'")) (add-to-list 'auto-mode-alist (cons pattern 'gitconfig-mode)))

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/gitconfig-mode-20160319.302/gitconfig-mode-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/gitconfig-mode-20160319.302/gitconfig-mode.el")
;;;;;;  (22276 52715 931801 500000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; gitconfig-mode-autoloads.el ends here
