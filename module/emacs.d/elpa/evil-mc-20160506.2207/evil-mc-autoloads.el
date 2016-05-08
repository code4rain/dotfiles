;;; evil-mc-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "evil-mc" "../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc.el"
;;;;;;  "c8ba899d0d2aae49c26530756cb8a9ee")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc.el

(autoload 'evil-mc-mode "evil-mc" "\
Toggle evil multiple cursors in a single buffer.

\(fn &optional ARG)" t nil)

(defvar global-evil-mc-mode nil "\
Non-nil if Global Evil-Mc mode is enabled.
See the command `global-evil-mc-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-evil-mc-mode'.")

(custom-autoload 'global-evil-mc-mode "evil-mc" nil)

(autoload 'global-evil-mc-mode "evil-mc" "\
Toggle Evil-Mc mode in all buffers.
With prefix ARG, enable Global Evil-Mc mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Evil-Mc mode is enabled in all buffers where
`evil-mc-initialize' would do it.
See `evil-mc-mode' for more information on Evil-Mc mode.

\(fn &optional ARG)" t nil)

(autoload 'evil-mc-initialize "evil-mc" "\
Enable `evil-mc-mode' in the current buffer.

\(fn)" nil nil)

(autoload 'turn-on-evil-mc-mode "evil-mc" "\
Turn on evil-mc mode in the current buffer.

\(fn)" t nil)

(autoload 'turn-off-evil-mc-mode "evil-mc" "\
Turn off evil-mc mode in the current buffer.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc-command-execute.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc-command-record.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc-common.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc-cursor-make.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc-cursor-state.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc-known-commands.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc-region.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc-scratch.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc-setup.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc-undo.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc-vars.el"
;;;;;;  "../../../../../.emacs.d/elpa/evil-mc-20160506.2207/evil-mc.el")
;;;;;;  (22318 50421 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; evil-mc-autoloads.el ends here
