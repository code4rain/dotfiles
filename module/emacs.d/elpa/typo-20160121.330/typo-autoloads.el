;;; typo-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "typo" "../../../../../.emacs.d/elpa/typo-20160121.330/typo.el"
;;;;;;  "0c49b8dc2cd2f28462107299e205b169")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/typo-20160121.330/typo.el

(autoload 'typo-mode "typo" "\
Minor mode for typographic editing.

This mode changes some default keybindings to enter typographic
glyphs. In particular, this changes how quotation marks, the
dash, the dot, and the angle brackets work.

Most keys will cycle through various options when used
repeatedly.

\\{typo-mode-map}

\(fn &optional ARG)" t nil)

(defvar typo-global-mode nil "\
Non-nil if Typo-Global mode is enabled.
See the command `typo-global-mode' for a description of this minor mode.")

(custom-autoload 'typo-global-mode "typo" nil)

(autoload 'typo-global-mode "typo" "\
Minor mode for typographic editing.

This mode provides a prefix map under C-c 8 which complements the
default C-x 8 prefix map.

\\{typo-global-mode-map}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/typo-20160121.330/typo-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/typo-20160121.330/typo.el")
;;;;;;  (22296 32252 564759 816000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; typo-autoloads.el ends here
