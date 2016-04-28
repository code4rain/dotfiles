;;; biblio-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "biblio-arxiv" "../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-arxiv.el"
;;;;;;  "7dbd4e0fbeeebc5e723e220b8d3b8da7")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-arxiv.el

(add-hook 'biblio-init-hook #'biblio-arxiv-backend)

(autoload 'biblio-arxiv-lookup "biblio-arxiv" "\
Start an arXiv search for QUERY, prompting if needed.

\(fn &optional QUERY)" t nil)

(defalias 'arxiv-lookup 'biblio-arxiv-lookup)

;;;***

;;;### (autoloads nil "biblio-crossref" "../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-crossref.el"
;;;;;;  "1ac3354f10702ee42697331b8c1f0cde")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-crossref.el

(add-hook 'biblio-init-hook #'biblio-crossref-backend)

(autoload 'biblio-crossref-lookup "biblio-crossref" "\
Start a CrossRef search for QUERY, prompting if needed.

\(fn &optional QUERY)" t nil)

(defalias 'crossref-lookup 'biblio-crossref-lookup)

;;;***

;;;### (autoloads nil "biblio-dblp" "../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-dblp.el"
;;;;;;  "2e82a5f0faee362da42d5c6aeb31e2b4")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-dblp.el

(add-hook 'biblio-init-hook #'biblio-dblp-backend)

(autoload 'biblio-dblp-lookup "biblio-dblp" "\
Start a DBLP search for QUERY, prompting if needed.

\(fn &optional QUERY)" t nil)

(defalias 'dblp-lookup 'biblio-dblp-lookup)

;;;***

;;;### (autoloads nil "biblio-dissemin" "../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-dissemin.el"
;;;;;;  "1bf36df664d74198ca9e1d38880bed8d")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-dissemin.el

(autoload 'biblio-dissemin-lookup "biblio-dissemin" "\
Retrieve a record by DOI from Dissemin, and display it.
Interactively, or if CLEANUP is non-nil, pass DOI through
`biblio-cleanup-doi'.

\(fn DOI &optional CLEANUP)" t nil)

(defalias 'dissemin-lookup 'biblio-dissemin-lookup)

(autoload 'biblio-dissemin--register-action "biblio-dissemin" "\
Add Dissemin to list of `biblio-selection-mode' actions.

\(fn)" nil nil)

(add-hook 'biblio-selection-mode-hook #'biblio-dissemin--register-action)

;;;***

;;;### (autoloads nil "biblio-doi" "../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-doi.el"
;;;;;;  "4e294aa692d32e806ae258598f0e4432")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-doi.el

(autoload 'doi-insert-bibtex "biblio-doi" "\
Insert BibTeX entry matching DOI.

\(fn DOI)" t nil)

;;;***

;;;### (autoloads nil "biblio-hal" "../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-hal.el"
;;;;;;  "61b7755deaad56498c3205d34d9a3002")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-hal.el

(add-hook 'biblio-init-hook #'biblio-hal-backend)

(autoload 'biblio-hal-lookup "biblio-hal" "\
Start a HAL search for QUERY, prompting if needed.

\(fn &optional QUERY)" t nil)

(defalias 'hal-lookup 'biblio-hal-lookup)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-arxiv.el"
;;;;;;  "../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-crossref.el"
;;;;;;  "../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-dblp.el"
;;;;;;  "../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-dissemin.el"
;;;;;;  "../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-doi.el"
;;;;;;  "../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-hal.el"
;;;;;;  "../../../../../.emacs.d/elpa/biblio-20160407.227/biblio-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/biblio-20160407.227/biblio.el")
;;;;;;  (22303 23045 932480 700000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; biblio-autoloads.el ends here
