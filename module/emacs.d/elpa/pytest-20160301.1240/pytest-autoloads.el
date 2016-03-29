;;; pytest-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "pytest" "../../../../../.emacs.d/elpa/pytest-20160301.1240/pytest.el"
;;;;;;  "86de1c8cf41d65a2cd5b24c103323ef0")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/pytest-20160301.1240/pytest.el

(autoload 'pytest-all "pytest" "\
Run all tests.
Optional argument FLAGS py.test command line flags.

\(fn &optional FLAGS)" t nil)

(autoload 'pytest-failed "pytest" "\
Quit test suite on first failed test.

\(fn)" t nil)

(autoload 'pytest-pdb-all "pytest" "\
Start pdb on error.

\(fn)" t nil)

(autoload 'pytest-directory "pytest" "\
Run pytest on all the files in the current buffer.
Optional argument FLAGS py.test command line flags.

\(fn &optional FLAGS)" t nil)

(autoload 'pytest-pdb-directory "pytest" "\
Run pytest on all the files in the current buffer.
Optional argument FLAGS py.test command line flags.

\(fn &optional FLAGS)" t nil)

(autoload 'pytest-module "pytest" "\
Run pytest (via eggs/bin/test) on current buffer.
Optional argument FLAGS py.test command line flags.

\(fn &optional FLAGS)" t nil)

(autoload 'pytest-pdb-module "pytest" "\
Run pytest on a module, enter debugger on error.

\(fn)" t nil)

(autoload 'pytest-one "pytest" "\
Run pytest (via eggs/bin/test) on testable thing at point in current buffer.
Optional argument FLAGS py.test command line flags.

\(fn &optional FLAGS)" t nil)

(autoload 'pytest-pdb-one "pytest" "\
Run pytest on testable thing at point, enter debugger on error.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/pytest-20160301.1240/pytest-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/pytest-20160301.1240/pytest.el")
;;;;;;  (22264 48143 424422 352000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; pytest-autoloads.el ends here
