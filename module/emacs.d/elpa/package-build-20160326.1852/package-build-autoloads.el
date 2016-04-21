;;; package-build-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "package-build" "../../../../../.emacs.d/elpa/package-build-20160326.1852/package-build.el"
;;;;;;  "fc91a771124afa9a1c1fe4f911c88001")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/package-build-20160326.1852/package-build.el

(autoload 'package-build-archive "package-build" "\
Build a package archive for package NAME.

\(fn NAME)" t nil)

(autoload 'package-build-package "package-build" "\
Create PACKAGE-NAME with VERSION.

The information in FILE-SPECS is used to gather files from
SOURCE-DIR.

The resulting package will be stored as a .el or .tar file in
TARGET-DIR, depending on whether there are multiple files.

Argument FILE-SPECS is a list of specs for source files, which
should be relative to SOURCE-DIR.  The specs can be wildcards,
and optionally specify different target paths.  They extended
syntax is currently only documented in the MELPA README.  You can
simply pass `package-build-default-files-spec' in most cases.

Returns the archive entry for the package.

\(fn PACKAGE-NAME VERSION FILE-SPECS SOURCE-DIR TARGET-DIR)" nil nil)

(autoload 'package-build-create-recipe "package-build" "\
Create a new recipe for package NAME using FETCHER.

\(fn NAME FETCHER)" t nil)

(autoload 'package-build-current-recipe "package-build" "\
Build archive for the recipe defined in the current buffer.

\(fn)" t nil)

(autoload 'package-build-all "package-build" "\
Build all packages in the `package-build-recipe-alist'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/package-build-20160326.1852/package-build-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/package-build-20160326.1852/package-build.el")
;;;;;;  (22296 31902 631007 369000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; package-build-autoloads.el ends here
