;;; auto-yasnippet-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "auto-yasnippet" "../../../../../.emacs.d/elpa/auto-yasnippet-20160223.308/auto-yasnippet.el"
;;;;;;  "5daf8841004e86ef1cf96e1d5f0f3bc1")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/auto-yasnippet-20160223.308/auto-yasnippet.el

(autoload 'aya-create-one-line "auto-yasnippet" "\
A simplistic `aya-create' to create only one mirror.
You can still have as many instances of this mirror as you want.
It's less flexible than `aya-create', but faster.
It uses a different marker, which is `aya-marker-one-line'.
You can use it to quickly generate one-liners such as
menu.add_item(spamspamspam, \"spamspamspam\")

\(fn)" t nil)

(autoload 'aya-create "auto-yasnippet" "\
Works on either the current line, or, if `mark-active', the current region.
Removes `aya-marker' prefixes,
writes the corresponding snippet to `aya-current',
with words prefixed by `aya-marker' as fields, and mirrors properly set up.

\(fn)" t nil)

(autoload 'aya-expand "auto-yasnippet" "\
Insert the last yasnippet created by `aya-create'.

\(fn)" t nil)

(autoload 'aya-open-line "auto-yasnippet" "\
Call `open-line', unless there are abbrevs or snippets at point.
In that case expand them.  If there's a snippet expansion in progress,
move to the next field.  Call `open-line' if nothing else applies.

\(fn)" t nil)

(autoload 'aya-yank-snippet "auto-yasnippet" "\
Insert current snippet at point.
To save a snippet permanently, create an empty file and call this.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/auto-yasnippet-20160223.308/auto-yasnippet-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/auto-yasnippet-20160223.308/auto-yasnippet.el")
;;;;;;  (22264 47875 320947 602000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; auto-yasnippet-autoloads.el ends here
