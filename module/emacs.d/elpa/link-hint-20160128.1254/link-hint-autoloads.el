;;; link-hint-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "link-hint" "../../../../../.emacs.d/elpa/link-hint-20160128.1254/link-hint.el"
;;;;;;  "40d3a48941d0c54dc5cca79f46a011d8")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/link-hint-20160128.1254/link-hint.el

(autoload 'link-hint-open-link-at-point "link-hint" "\
Open a link of any supported type at the point.

\(fn)" t nil)

(autoload 'link-hint-copy-link-at-point "link-hint" "\
Copy a link of any supported type at the point. See the default value of
`link-hint-copy-ignore-types' for the unsupported types.

\(fn)" t nil)

(autoload 'link-hint-open-link "link-hint" "\
Use avy to select and open a visible link.

\(fn)" t nil)

(autoload 'link-hint-copy-link "link-hint" "\
Copy a visible link of a supported type to the kill ring with avy.
`select-enable-clipboard' and `select-enable-primary' can be set to non-nil
values to copy the link to the clipboard and/or primary as well. See the
default value of `link-hint-copy-ignore-types' for the unsupported types.
When selecting a mu4e attachment with this, it will prompt for a location to
save (since this is the closest behaviour to copying).

\(fn)" t nil)

(autoload 'link-hint-open-multiple-links "link-hint" "\
Use avy to select and open multiple visible links at once.
The links will be opened as soon as a non-hint key (a key not appearing in an
overlay) is pressed. More than one link must be visible for this command to have
an effect.

\(fn)" t nil)

(autoload 'link-hint-copy-multiple-links "link-hint" "\
Use avy to select and copy multiple, visible links at once to the kill ring.
See `link-hint-copy-link' for more information. More than one supported link
must be visible for this command to have an effect.

\(fn)" t nil)

(autoload 'link-hint-open-all-links "link-hint" "\
Open all visible links.

\(fn)" t nil)

(autoload 'link-hint-copy-all-links "link-hint" "\
Copy all visible links of a supported type.
See `link-hint-copy-link' for more information.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/link-hint-20160128.1254/link-hint-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/link-hint-20160128.1254/link-hint.el")
;;;;;;  (22264 48021 96102 92000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; link-hint-autoloads.el ends here
