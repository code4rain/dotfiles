;;; helm-descbinds-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "helm-descbinds" "../../../../../.emacs.d/elpa/helm-descbinds-20160108.1947/helm-descbinds.el"
;;;;;;  "b7c85326a44a7dfacdc717335265137e")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-descbinds-20160108.1947/helm-descbinds.el

(defvar helm-descbinds-mode nil "\
Non-nil if Helm-Descbinds mode is enabled.
See the command `helm-descbinds-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-descbinds-mode'.")

(custom-autoload 'helm-descbinds-mode "helm-descbinds" nil)

(autoload 'helm-descbinds-mode "helm-descbinds" "\
Use `helm' for `describe-bindings'.

\(fn &optional ARG)" t nil)

(autoload 'helm-descbinds-install "helm-descbinds" "\
Use `helm-descbinds' as a replacement of `describe-bindings'.

\(fn)" t nil)

(autoload 'helm-descbinds-uninstall "helm-descbinds" "\
Restore original `describe-bindings'.

\(fn)" t nil)

(autoload 'helm-descbinds "helm-descbinds" "\
A convenient helm version of `describe-bindings'.

Turning on `helm-descbinds-mode' is the recommended way to
install this command to replace `describe-bindings'.

You complete against a list of keys + command pairs presented in
a similar way as `describe-bindings' does, split into sections
defined by the types of the key bindings (minor and major modes,
global bindings, etc).

The default action executes a command as if the binding had been
entered, or narrows the commands according to a prefix key,
respectively.

The persistent action pops up a help buffer for the selected
command without quitting.

For key translation maps, the default actions are not very
useful, yet they are listed for completeness.

\(fn &optional PREFIX BUFFER)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/helm-descbinds-20160108.1947/helm-descbinds-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-descbinds-20160108.1947/helm-descbinds.el")
;;;;;;  (22276 52735 463918 600000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; helm-descbinds-autoloads.el ends here
