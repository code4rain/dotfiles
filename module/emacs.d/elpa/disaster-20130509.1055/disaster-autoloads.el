;;; disaster-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "disaster" "../../../../../.emacs.d/elpa/disaster-20130509.1055/disaster.el"
;;;;;;  "e3f19d30fc6708e345c5a5c0cc922318")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/disaster-20130509.1055/disaster.el

(autoload 'disaster "disaster" "\
Shows assembly code for current line of C/C++ file.

Here's the logic path it follows:

- Is there a Makefile in this directory? Run `make bufname.o`.
- Or is there a Makefile in a parent directory? Run `make -C .. bufname.o`.
- Or is this a C file? Run `cc -g -O3 -c -o bufname.o bufname.c`
- Or is this a C++ file? Run `c++ -g -O3 -c -o bufname.o bufname.c`
- If build failed, display errors in compile-mode.
- Run objdump inside a new window while maintaining focus.
- Jump to line matching current line.

If FILE and LINE are not specified, the current editing location
is used.

\(fn &optional FILE LINE)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/disaster-20130509.1055/disaster-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/disaster-20130509.1055/disaster.el")
;;;;;;  (22296 32011 823604 505000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; disaster-autoloads.el ends here
