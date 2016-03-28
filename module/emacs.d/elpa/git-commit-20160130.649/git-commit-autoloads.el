;;; git-commit-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "git-commit" "../../../../../.emacs.d/elpa/git-commit-20160130.649/git-commit.el"
;;;;;;  "237e0fe00409a2a214f945c60a6a0596")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/git-commit-20160130.649/git-commit.el

(defvar global-git-commit-mode t "\
Non-nil if Global-Git-Commit mode is enabled.
See the command `global-git-commit-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-git-commit-mode'.")

(custom-autoload 'global-git-commit-mode "git-commit" nil)

(autoload 'global-git-commit-mode "git-commit" "\
Edit Git commit messages.
This global mode arranges for `git-commit-setup' to be called
when a Git commit message file is opened.  That usually happens
when Git uses the Emacsclient as $GIT_EDITOR to have the user
provide such a commit message.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/git-commit-20160130.649/git-commit-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/git-commit-20160130.649/git-commit.el")
;;;;;;  (22264 47926 821359 311000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; git-commit-autoloads.el ends here
