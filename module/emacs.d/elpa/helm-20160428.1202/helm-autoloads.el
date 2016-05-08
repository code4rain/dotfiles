;;; helm-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "helm-adaptive" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-adaptive.el"
;;;;;;  "c28ae029de9ed1c33aa747fef7efd11a")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-adaptive.el

(defvar helm-adaptive-mode nil "\
Non-nil if Helm-Adaptive mode is enabled.
See the command `helm-adaptive-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-adaptive-mode'.")

(custom-autoload 'helm-adaptive-mode "helm-adaptive" nil)

(autoload 'helm-adaptive-mode "helm-adaptive" "\
Toggle adaptive sorting in all sources.

\(fn &optional ARG)" t nil)

(autoload 'helm-reset-adaptive-history "helm-adaptive" "\
Delete all `helm-adaptive-history' and his file.
Useful when you have a old or corrupted `helm-adaptive-history-file'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-apt" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-apt.el"
;;;;;;  "2ef814bb5e4dd01f5cdf4ed543beae1a")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-apt.el

(autoload 'helm-apt "helm-apt" "\
Preconfigured `helm' : frontend of APT package manager.
With a prefix arg reload cache.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-bookmark" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-bookmark.el"
;;;;;;  "a4d0ec242040c91b342a4974df3dccd6")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-bookmark.el

(autoload 'helm-bookmarks "helm-bookmark" "\
Preconfigured `helm' for bookmarks.

\(fn)" t nil)

(autoload 'helm-filtered-bookmarks "helm-bookmark" "\
Preconfigured helm for bookmarks (filtered by category).
Optional source `helm-source-bookmark-addressbook' is loaded
only if external library addressbook-bookmark.el is available.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-buffers" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-buffers.el"
;;;;;;  "f5fd51e381587afad0f4727b0f11caa2")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-buffers.el

(autoload 'helm-buffers-list "helm-buffers" "\
Preconfigured `helm' to list buffers.

\(fn)" t nil)

(autoload 'helm-mini "helm-buffers" "\
Preconfigured `helm' lightweight version (buffer -> recentf).

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-color" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-color.el"
;;;;;;  "e13cedea73698afd3b8ffff8e42cbc20")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-color.el

(autoload 'helm-colors "helm-color" "\
Preconfigured `helm' for color.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-command" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-command.el"
;;;;;;  "d59bba8f7cd033fa5f554fe3f8dd5a1f")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-command.el

(autoload 'helm-M-x "helm-command" "\
Preconfigured `helm' for Emacs commands.
It is `helm' replacement of regular `M-x' `execute-extended-command'.

Unlike regular `M-x' emacs vanilla `execute-extended-command' command,
the prefix args if needed, are passed AFTER starting `helm-M-x'.

You can get help on each command by persistent action.

\(fn ARG &optional COMMAND-NAME)" t nil)

;;;***

;;;### (autoloads nil "helm-config" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-config.el"
;;;;;;  "ab4879f7e129f6ba95e0d8c1877b5cc0")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-config.el

(autoload 'helm-configuration "helm-config" "\
Customize `helm'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-dabbrev" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-dabbrev.el"
;;;;;;  "9fdf1f96e0c14943abe84e171e3a96f8")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-dabbrev.el

(autoload 'helm-dabbrev "helm-dabbrev" "\
Preconfigured helm for dynamic abbreviations.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-elisp" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-elisp.el"
;;;;;;  "0954bb1f4759ed3eac37021bd02eb87d")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-elisp.el

(autoload 'helm-lisp-completion-at-point "helm-elisp" "\
Preconfigured helm for lisp symbol completion at point.

\(fn)" t nil)

(autoload 'helm-complete-file-name-at-point "helm-elisp" "\
Preconfigured helm to complete file name at point.

\(fn &optional FORCE)" t nil)

(autoload 'helm-lisp-indent "helm-elisp" "\


\(fn)" t nil)

(autoload 'helm-lisp-completion-or-file-name-at-point "helm-elisp" "\
Preconfigured helm to complete lisp symbol or filename at point.
Filename completion happen if string start after or between a double quote.

\(fn)" t nil)

(autoload 'helm-apropos "helm-elisp" "\
Preconfigured helm to describe commands, functions, variables and faces.
In non interactives calls DEFAULT argument should be provided as a string,
i.e the `symbol-name' of any existing symbol.

\(fn DEFAULT)" t nil)

(autoload 'helm-manage-advice "helm-elisp" "\
Preconfigured `helm' to disable/enable function advices.

\(fn)" t nil)

(autoload 'helm-locate-library "helm-elisp" "\
Preconfigured helm to locate elisp libraries.

\(fn)" t nil)

(autoload 'helm-timers "helm-elisp" "\
Preconfigured `helm' for timers.

\(fn)" t nil)

(autoload 'helm-complex-command-history "helm-elisp" "\
Preconfigured helm for complex command history.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-elisp-package" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-elisp-package.el"
;;;;;;  "7e339ecbf7a8f6f929cbcddcd108aceb")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-elisp-package.el

(autoload 'helm-list-elisp-packages "helm-elisp-package" "\
Preconfigured helm for listing and handling emacs packages.

\(fn ARG)" t nil)

(autoload 'helm-list-elisp-packages-no-fetch "helm-elisp-package" "\
Preconfigured helm for emacs packages.
Same as `helm-list-elisp-packages' but don't fetch packages on remote.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-elscreen" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-elscreen.el"
;;;;;;  "4830916b7c7f685fe4b6d38b1e9c18af")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-elscreen.el

(autoload 'helm-elscreen "helm-elscreen" "\
Preconfigured helm to list elscreen.

\(fn)" t nil)

(autoload 'helm-elscreen-history "helm-elscreen" "\
Preconfigured helm to list elscreen in history order.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-eshell" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-eshell.el"
;;;;;;  "0a8240b093a06193ebb4fe6321d56cc3")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-eshell.el

(autoload 'helm-esh-pcomplete "helm-eshell" "\
Preconfigured helm to provide helm completion in eshell.

\(fn)" t nil)

(autoload 'helm-eshell-history "helm-eshell" "\
Preconfigured helm for eshell history.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-eval" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-eval.el"
;;;;;;  "22c099dd0e67933d9c42b1c0d7c85fab")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-eval.el

(autoload 'helm-eval-expression "helm-eval" "\
Preconfigured helm for `helm-source-evaluation-result'.

\(fn ARG)" t nil)

(autoload 'helm-eval-expression-with-eldoc "helm-eval" "\
Preconfigured helm for `helm-source-evaluation-result' with `eldoc' support. 

\(fn)" t nil)

(autoload 'helm-calcul-expression "helm-eval" "\
Preconfigured helm for `helm-source-calculation-result'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-external" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-external.el"
;;;;;;  "eca08ee0da291bb844a30b586f4f304b")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-external.el

(autoload 'helm-run-external-command "helm-external" "\
Preconfigured `helm' to run External PROGRAM asyncronously from Emacs.
If program is already running exit with error.
You can set your own list of commands with
`helm-external-commands-list'.

\(fn PROGRAM)" t nil)

;;;***

;;;### (autoloads nil "helm-files" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-files.el"
;;;;;;  "669dbf2e38ce99408b8ba824da827a3e")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-files.el

(autoload 'helm-browse-project "helm-files" "\
Preconfigured helm to browse projects.
Browse files and see status of project with its vcs.
Only HG and GIT are supported for now.
Fall back to `helm-browse-project-find-files'
if current directory is not under control of one of those vcs.
With a prefix ARG browse files recursively, with two prefix ARG
rebuild the cache.
If the current directory is found in the cache, start
`helm-browse-project-find-files' even with no prefix ARG.
NOTE: The prefix ARG have no effect on the VCS controlled directories.

Needed dependencies for VCS:
<https://github.com/emacs-helm/helm-ls-git>
and
<https://github.com/emacs-helm/helm-ls-hg>
and
<http://melpa.org/#/helm-ls-svn>.

\(fn ARG)" t nil)

(autoload 'helm-find "helm-files" "\
Preconfigured `helm' for the find shell command.

\(fn ARG)" t nil)

(autoload 'helm-find-files "helm-files" "\
Preconfigured `helm' for helm implementation of `find-file'.
Called with a prefix arg show history if some.
Don't call it from programs, use `helm-find-files-1' instead.
This is the starting point for nearly all actions you can do on files.

\(fn ARG)" t nil)

(autoload 'helm-for-files "helm-files" "\
Preconfigured `helm' for opening files.
Run all sources defined in `helm-for-files-preferred-list'.

\(fn)" t nil)

(autoload 'helm-multi-files "helm-files" "\
Preconfigured helm similar to `helm-for-files' but that don't run locate.
Allow toggling from locate to others sources.
This allow seeing first if what you search is in other sources before launching
locate.

\(fn)" t nil)

(autoload 'helm-recentf "helm-files" "\
Preconfigured `helm' for `recentf'.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-font" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-font.el"
;;;;;;  "536e16431188f80eeb261006813338de")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-font.el

(autoload 'helm-select-xfont "helm-font" "\
Preconfigured `helm' to select Xfont.

\(fn)" t nil)

(autoload 'helm-ucs "helm-font" "\
Preconfigured helm for `ucs-names' math symbols.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-grep" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-grep.el"
;;;;;;  "6821dc15abf4f02b69f4cbbd5c031c36")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-grep.el

(autoload 'helm-goto-precedent-file "helm-grep" "\
Go to precedent file in helm grep/etags buffers.

\(fn)" t nil)

(autoload 'helm-goto-next-file "helm-grep" "\
Go to precedent file in helm grep/etags buffers.

\(fn)" t nil)

(autoload 'helm-do-grep-ag "helm-grep" "\
Preconfigured helm for grepping with AG in `default-directory'.
With prefix-arg prompt for type if available with your AG version.

\(fn ARG)" t nil)

(autoload 'helm-grep-do-git-grep "helm-grep" "\
Preconfigured helm for git-grepping `default-directory'.
With a prefix arg ARG git-grep the whole repository.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-help" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-help.el"
;;;;;;  "98a80a3a9f19396a575a622d09c3871c")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-help.el

(autoload 'helm-documentation "helm-help" "\
Preconfigured helm for helm documentation.
With a prefix arg refresh the documentation.

Find here the documentation of all sources actually documented.

\(fn ARG)" t nil)

(defvar helm-comp-read-mode-line "\\<helm-comp-read-map>C/\\[helm-cr-empty-string]:Empty \\<helm-map>\\[helm-help]:Help \\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend")

(defvar helm-read-file-name-mode-line-string "\\<helm-read-file-map>\\[helm-help]:Help C/\\[helm-cr-empty-string]:Empty \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend" "\
String displayed in mode-line in `helm-source-find-files'.")

(defvar helm-top-mode-line "\\<helm-top-map>\\[helm-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-maybe-exit-minibuffer]/f1/f2/f-n:NthAct \\[helm-toggle-suspend-update]:Tog.suspend")

(autoload 'helm-describe-helm-attribute "helm-help" "\
Display the full documentation of HELM-ATTRIBUTE.
HELM-ATTRIBUTE should be a symbol.

\(fn HELM-ATTRIBUTE)" t nil)

;;;***

;;;### (autoloads nil "helm-id-utils" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-id-utils.el"
;;;;;;  "41b705c5f04021afe24191f1581b2076")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-id-utils.el

(autoload 'helm-gid "helm-id-utils" "\
Preconfigured helm for `gid' command line of `ID-Utils'.
Need A database created with the command `mkid'
above `default-directory'.
Need id-utils as dependency which provide `mkid', `gid' etc...
See <https://www.gnu.org/software/idutils/>.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-imenu" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-imenu.el"
;;;;;;  "e0c2217b97dfff49998c18a70925154d")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-imenu.el

(autoload 'helm-imenu "helm-imenu" "\
Preconfigured `helm' for `imenu'.

\(fn)" t nil)

(autoload 'helm-imenu-in-all-buffers "helm-imenu" "\
Preconfigured helm for fetching imenu entries of all buffers.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-info" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-info.el"
;;;;;;  "86690ceefc08197f24ad82573d5e255b")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-info.el

(autoload 'helm-info "helm-info" "\
Preconfigured `helm' for searching Info files' indices.

\(fn)" t nil)

(autoload 'helm-info-at-point "helm-info" "\
Preconfigured `helm' for searching info at point.
With a prefix-arg insert symbol at point.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-locate" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-locate.el"
;;;;;;  "5f1654c9bafcf5514736c5dbec37d2b7")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-locate.el

(autoload 'helm-projects-find-files "helm-locate" "\
Find files with locate in `helm-locate-project-list'.
With a prefix arg refresh the database in each project.

\(fn UPDATE)" t nil)

(autoload 'helm-locate "helm-locate" "\
Preconfigured `helm' for Locate.
Note: you can add locate options after entering pattern.
See 'man locate' for valid options and also `helm-locate-command'.

You can specify a local database with prefix argument ARG.
With two prefix arg, refresh the current local db or create it
if it doesn't exists.

To create a user specific db, use
\"updatedb -l 0 -o db_path -U directory\".
Where db_path is a filename matched by
`helm-locate-db-file-regexp'.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-man" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-man.el"
;;;;;;  "f7300b8dd7f7d6bb51deffcd64d5e78f")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-man.el

(autoload 'helm-man-woman "helm-man" "\
Preconfigured `helm' for Man and Woman pages.
With a prefix arg reinitialize the cache.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-misc" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-misc.el"
;;;;;;  "d32a3feb1b1c603cfd85e4ee46576d23")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-misc.el

(autoload 'helm-browse-menubar "helm-misc" "\
Preconfigured helm to the menubar using lacarte.el.

\(fn)" t nil)

(autoload 'helm-world-time "helm-misc" "\
Preconfigured `helm' to show world time.
Default action change TZ environment variable locally to emacs.

\(fn)" t nil)

(autoload 'helm-insert-latex-math "helm-misc" "\
Preconfigured helm for latex math symbols completion.

\(fn)" t nil)

(autoload 'helm-ratpoison-commands "helm-misc" "\
Preconfigured `helm' to execute ratpoison commands.

\(fn)" t nil)

(autoload 'helm-stumpwm-commands "helm-misc" "\
Preconfigured helm for stumpwm commands.

\(fn)" t nil)

(autoload 'helm-minibuffer-history "helm-misc" "\
Preconfigured `helm' for `minibuffer-history'.

\(fn)" t nil)

(autoload 'helm-comint-input-ring "helm-misc" "\
Preconfigured `helm' that provide completion of `comint' history.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-mode" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-mode.el"
;;;;;;  "79ad86449ad18ae221a2db2252b6eb50")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-mode.el

(autoload 'helm-comp-read "helm-mode" "\
Read a string in the minibuffer, with helm completion.

It is helm `completing-read' equivalent.

- PROMPT is the prompt name to use.

- COLLECTION can be a list, vector, obarray or hash-table.
  It can be also a function that receives three arguments:
  the values string, predicate and t. See `all-completions' for more details.

Keys description:

- TEST: A predicate called with one arg i.e candidate.

- INITIAL-INPUT: Same as input arg in `helm'.

- PRESELECT: See preselect arg of `helm'.

- DEFAULT: This option is used only for compatibility with regular
  Emacs `completing-read' (Same as DEFAULT arg of `completing-read').

- BUFFER: Name of helm-buffer.

- MUST-MATCH: Candidate selected must be one of COLLECTION.

- FUZZY: Enable fuzzy matching.

- REVERSE-HISTORY: When non--nil display history source after current
  source completion.

- REQUIRES-PATTERN: Same as helm attribute, default is 0.

- HISTORY: A list containing specific history, default is nil.
  When it is non--nil, all elements of HISTORY are displayed in
  a special source before COLLECTION.

- INPUT-HISTORY: A symbol. the minibuffer input history will be
  stored there, if nil or not provided, `minibuffer-history'
  will be used instead.

- CASE-FOLD: Same as `helm-case-fold-search'.

- DEL-INPUT: Boolean, when non--nil (default) remove the partial
  minibuffer input from HISTORY is present.

- PERSISTENT-ACTION: A function called with one arg i.e candidate.

- PERSISTENT-HELP: A string to document PERSISTENT-ACTION.

- MODE-LINE: A string or list to display in mode line.
  Default is `helm-comp-read-mode-line'.

- KEYMAP: A keymap to use in this `helm-comp-read'.
  (the keymap will be shared with history source)

- NAME: The name related to this local source.

- EXEC-WHEN-ONLY-ONE: Bound `helm-execute-action-at-once-if-one'
  to non--nil. (possibles values are t or nil).

- VOLATILE: Use volatile attribute.

- SORT: A predicate to give to `sort' e.g `string-lessp'
  Use this only on small data as it is ineficient.
  If you want to sort faster add a sort function to
  FC-TRANSFORMER.
  Note that FUZZY when enabled is already providing a sort function.

- FC-TRANSFORMER: A `filtered-candidate-transformer' function
  or a list of functions.

- HIST-FC-TRANSFORMER: A `filtered-candidate-transformer'
  function for the history source.

- MARKED-CANDIDATES: If non--nil return candidate or marked candidates as a list.

- NOMARK: When non--nil don't allow marking candidates.

- ALISTP: (default is non--nil) See `helm-comp-read-get-candidates'.

- CANDIDATES-IN-BUFFER: when non--nil use a source build with
  `helm-source-in-buffer' which is much faster.
  Argument VOLATILE have no effect when CANDIDATES-IN-BUFFER is non--nil.

Any prefix args passed during `helm-comp-read' invocation will be recorded
in `helm-current-prefix-arg', otherwise if prefix args were given before
`helm-comp-read' invocation, the value of `current-prefix-arg' will be used.
That's mean you can pass prefix args before or after calling a command
that use `helm-comp-read' See `helm-M-x' for example.

\(fn PROMPT COLLECTION &key TEST INITIAL-INPUT DEFAULT PRESELECT (BUFFER \"*Helm Completions*\") MUST-MATCH FUZZY REVERSE-HISTORY (REQUIRES-PATTERN 0) HISTORY INPUT-HISTORY (CASE-FOLD helm-comp-read-case-fold-search) (DEL-INPUT t) (PERSISTENT-ACTION nil) (PERSISTENT-HELP \"DoNothing\") (MODE-LINE helm-comp-read-mode-line) HELP-MESSAGE (KEYMAP helm-comp-read-map) (NAME \"Helm Completions\") CANDIDATES-IN-BUFFER EXEC-WHEN-ONLY-ONE QUIT-WHEN-NO-CAND (VOLATILE t) SORT (FC-TRANSFORMER \\='helm-cr-default-transformer) HIST-FC-TRANSFORMER MARKED-CANDIDATES NOMARK (ALISTP t) (CANDIDATE-NUMBER-LIMIT helm-candidate-number-limit))" nil nil)

(autoload 'helm-read-file-name "helm-mode" "\
Read a file name with helm completion.
It is helm `read-file-name' emulation.

Argument PROMPT is the default prompt to use.

Keys description:

- NAME: Source name, default to \"Read File Name\".

- INITIAL-INPUT: Where to start read file name, default to `default-directory'.

- BUFFER: `helm-buffer' name default to \"*Helm Completions*\".

- TEST: A predicate called with one arg 'candidate'.

- CASE-FOLD: Same as `helm-case-fold-search'.

- PRESELECT: helm preselection.

- HISTORY: Display HISTORY in a special source.

- MUST-MATCH: Can be 'confirm, nil, or t.

- MARKED-CANDIDATES: When non--nil return a list of marked candidates.

- NOMARK: When non--nil don't allow marking candidates.

- ALISTP: Don't use `all-completions' in history (take effect only on history).

- PERSISTENT-ACTION: a persistent action function.

- PERSISTENT-HELP: persistent help message.

- MODE-LINE: A mode line message, default is `helm-read-file-name-mode-line-string'.

\(fn PROMPT &key (NAME \"Read File Name\") (INITIAL-INPUT default-directory) (BUFFER \"*Helm file completions*\") TEST (CASE-FOLD helm-file-name-case-fold-search) PRESELECT HISTORY MUST-MATCH DEFAULT MARKED-CANDIDATES (CANDIDATE-NUMBER-LIMIT helm-ff-candidate-number-limit) NOMARK (ALISTP t) (PERSISTENT-ACTION \\='helm-find-files-persistent-action) (PERSISTENT-HELP \"Hit1 Expand Candidate, Hit2 or (C-u) Find file\") (MODE-LINE helm-read-file-name-mode-line-string))" nil nil)

(defvar helm-mode nil "\
Non-nil if Helm mode is enabled.
See the command `helm-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-mode'.")

(custom-autoload 'helm-mode "helm-mode" nil)

(autoload 'helm-mode "helm-mode" "\
Toggle generic helm completion.

All functions in Emacs that use `completing-read'
or `read-file-name' and friends will use helm interface
when this mode is turned on.
However you can modify this behavior for functions of your choice
with `helm-completing-read-handlers-alist'.

Called with a positive arg, turn on unconditionally, with a
negative arg turn off.
You can turn it on with `helm-mode'.

Some crap emacs functions may not be supported,
e.g `ffap-alternate-file' and maybe others
You can add such functions to `helm-completing-read-handlers-alist'
with a nil value.

Note: This mode is incompatible with Emacs23.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-net" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-net.el"
;;;;;;  "be6b3a846359a8498553d172763fb082")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-net.el

(autoload 'helm-surfraw "helm-net" "\
Preconfigured `helm' to search PATTERN with search ENGINE.

\(fn PATTERN ENGINE)" t nil)

(autoload 'helm-google-suggest "helm-net" "\
Preconfigured `helm' for google search with google suggest.

\(fn)" t nil)

(autoload 'helm-wikipedia-suggest "helm-net" "\
Preconfigured `helm' for Wikipedia lookup with Wikipedia suggest.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-org" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-org.el"
;;;;;;  "7a46879251e0601b9e2ae6bf2b62830e")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-org.el

(autoload 'helm-org-agenda-files-headings "helm-org" "\
Preconfigured helm for org files headings.

\(fn)" t nil)

(autoload 'helm-org-in-buffer-headings "helm-org" "\
Preconfigured helm for org buffer headings.

\(fn)" t nil)

(autoload 'helm-org-parent-headings "helm-org" "\
Preconfigured helm for org headings that are parents of the
current heading.

\(fn)" t nil)

(autoload 'helm-org-capture-templates "helm-org" "\
Preconfigured helm for org templates.

\(fn)" t nil)

(autoload 'helm-org-completing-read-tags "helm-org" "\


\(fn PROMPT COLLECTION PRED REQ INITIAL HIST DEF INHERIT-INPUT-METHOD NAME BUFFER)" nil nil)

;;;***

;;;### (autoloads nil "helm-regexp" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-regexp.el"
;;;;;;  "145d56705e4b066fb3bcd017cd17d81e")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-regexp.el

(autoload 'helm-moccur-mode "helm-regexp" "\
Major mode to provide actions in helm moccur saved buffer.

Special commands:
\\{helm-moccur-mode-map}

\(fn)" t nil)

(autoload 'helm-regexp "helm-regexp" "\
Preconfigured helm to build regexps.
`query-replace-regexp' can be run from there against found regexp.

\(fn)" t nil)

(autoload 'helm-occur "helm-regexp" "\
Preconfigured helm for Occur.

\(fn)" t nil)

(autoload 'helm-occur-from-isearch "helm-regexp" "\
Invoke `helm-occur' from isearch.

\(fn)" t nil)

(autoload 'helm-multi-occur-from-isearch "helm-regexp" "\
Invoke `helm-multi-occur' from isearch.

With a prefix arg, reverse the behavior of
`helm-moccur-always-search-in-current'.
The prefix arg can be set before calling
`helm-multi-occur-from-isearch' or during the buffer selection.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-ring" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-ring.el"
;;;;;;  "fce34930d4b68446aded6f4052b5c276")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-ring.el

(defvar helm-push-mark-mode nil "\
Non-nil if Helm-Push-Mark mode is enabled.
See the command `helm-push-mark-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-push-mark-mode'.")

(custom-autoload 'helm-push-mark-mode "helm-ring" nil)

(autoload 'helm-push-mark-mode "helm-ring" "\
Provide an improved version of `push-mark'.
Modify the behavior of `push-mark' to update
the `global-mark-ring' after each new visit.

\(fn &optional ARG)" t nil)

(autoload 'helm-mark-ring "helm-ring" "\
Preconfigured `helm' for `helm-source-mark-ring'.

\(fn)" t nil)

(autoload 'helm-global-mark-ring "helm-ring" "\
Preconfigured `helm' for `helm-source-global-mark-ring'.

\(fn)" t nil)

(autoload 'helm-all-mark-rings "helm-ring" "\
Preconfigured `helm' for `helm-source-global-mark-ring' and `helm-source-mark-ring'.

\(fn)" t nil)

(autoload 'helm-register "helm-ring" "\
Preconfigured `helm' for Emacs registers.

\(fn)" t nil)

(autoload 'helm-show-kill-ring "helm-ring" "\
Preconfigured `helm' for `kill-ring'.
It is drop-in replacement of `yank-pop'.

First call open the kill-ring browser, next calls move to next line.

\(fn)" t nil)

(autoload 'helm-execute-kmacro "helm-ring" "\
Preconfigured helm for keyboard macros.
Define your macros with `f3' and `f4'.
See (info \"(emacs) Keyboard Macros\") for detailed infos.
This command is useful when used with persistent action.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-semantic" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-semantic.el"
;;;;;;  "76c52764785da2aa7aae739421da19e4")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-semantic.el

(autoload 'helm-semantic "helm-semantic" "\
Preconfigured `helm' for `semantic'.
If ARG is supplied, pre-select symbol at point instead of current

\(fn ARG)" t nil)

(autoload 'helm-semantic-or-imenu "helm-semantic" "\
Preconfigured helm for `semantic' or `imenu'.
If ARG is supplied, pre-select symbol at point instead of current
semantic tag in scope.

If `semantic-mode' is active in the current buffer, then use
semantic for generating tags, otherwise fall back to `imenu'.
Fill in the symbol at point by default.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads nil "helm-sys" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-sys.el"
;;;;;;  "66227dcf779b46417649baa665a8ab1c")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-sys.el

(autoload 'helm-top "helm-sys" "\
Preconfigured `helm' for top command.

\(fn)" t nil)

(autoload 'helm-list-emacs-process "helm-sys" "\
Preconfigured `helm' for emacs process.

\(fn)" t nil)

(autoload 'helm-xrandr-set "helm-sys" "\
Preconfigured helm for xrandr.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "helm-tags" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-tags.el"
;;;;;;  "0c27a7492e5d0bf84b1a82443f447cce")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-tags.el

(autoload 'helm-etags-select "helm-tags" "\
Preconfigured helm for etags.
If called with a prefix argument REINIT
or if any of the tag files have been modified, reinitialize cache.

This function aggregates three sources of tag files:

  1) An automatically located file in the parent directories,
     by `helm-etags-get-tag-file'.
  2) `tags-file-name', which is commonly set by `find-tag' command.
  3) `tags-table-list' which is commonly set by `visit-tags-table' command.

\(fn REINIT)" t nil)

;;;***

;;;### (autoloads nil "helm-utils" "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-utils.el"
;;;;;;  "d67a2fd54670136f7bd6a29267d95667")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/helm-20160428.1202/helm-utils.el

(defvar helm-popup-tip-mode nil "\
Non-nil if Helm-Popup-Tip mode is enabled.
See the command `helm-popup-tip-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-popup-tip-mode'.")

(custom-autoload 'helm-popup-tip-mode "helm-utils" nil)

(autoload 'helm-popup-tip-mode "helm-utils" "\
Show help-echo informations in a popup tip at end of line.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/helm-20160428.1202/helm-adaptive.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-apt.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-bookmark.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-buffers.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-color.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-command.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-config.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-dabbrev.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-easymenu.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-elisp-package.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-elisp.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-elscreen.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-eshell.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-eval.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-external.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-files.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-font.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-grep.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-help.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-id-utils.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-imenu.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-info.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-locate.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-man.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-misc.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-mode.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-multi-match.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-net.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-org.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-plugin.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-regexp.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-ring.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-semantic.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-sys.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-tags.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-types.el"
;;;;;;  "../../../../../.emacs.d/elpa/helm-20160428.1202/helm-utils.el")
;;;;;;  (22318 50366 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; helm-autoloads.el ends here
