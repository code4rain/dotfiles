;;; uuidgen-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "uuidgen" "../../../../../.emacs.d/elpa/uuidgen-20140918.1601/uuidgen.el"
;;;;;;  "e2d726f205e00649325c10a0fb4339b0")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/uuidgen-20140918.1601/uuidgen.el

(autoload 'insert-uuid-cid "uuidgen" "\
Insert UUID string in CID format that is suitable for COM definition.
If UUID is nil will generate UUIDGEN-4 automatically.
You customize `uuidgen-cid-format-string' to change the default format.

\(fn UUID)" t nil)

(autoload 'uuidgen "uuidgen" "\
Insert UUIDv4 at point. If TIME-BASED is non-nil, insert UUIDv1 instead.

\(fn TIME-BASED)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/uuidgen-20140918.1601/uuidgen-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/uuidgen-20140918.1601/uuidgen.el")
;;;;;;  (22296 32254 933351 459000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; uuidgen-autoloads.el ends here
