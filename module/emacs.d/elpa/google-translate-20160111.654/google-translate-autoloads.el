;;; google-translate-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "google-translate-default-ui" "../../../../../.emacs.d/elpa/google-translate-20160111.654/google-translate-default-ui.el"
;;;;;;  "6207811d2f01780f8812f6ed4f5f1ac2")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/google-translate-20160111.654/google-translate-default-ui.el

(autoload 'google-translate-query-translate "google-translate-default-ui" "\
Interactively translate text with Google Translate.

Query a text (a word or a phrase), and pop up a buffer named *Google
Translate* displaying available translations of the text.

If no defaults for the source and target languages are specified (by
setting the variables `google-translate-default-source-language' and
`google-translate-default-target-language'), interactively query the
missing parts.  For example, a reasonable option may be to specify a
default for the target language and always be queried for the source
language.

With a `C-u' prefix argument, query the source and target languages,
even if any defaults are specified.  For example, you may frequently
need to translate from English to Russian, and you may choose to set
the default source and target languages to \"en\" and  \"ru\", resp.
However, occasionally you may also need to translate from Russian to
English.  With a `C-u' prefix argument you can override the defaults
and specify the source and target languages explicitly.

The languages are queried with completion, and the null input at the
source language prompt is considered as an instruction for Google
Translate to detect the source language.

\(fn &optional OVERRIDE-P)" t nil)

(autoload 'google-translate-query-translate-reverse "google-translate-default-ui" "\
Like `google-translate-query-translate', but performs translation
in the reverse direction.

The value of the variable `google-translate-default-source-language'
\(if set) becomes the target language, and the value of the variable
`google-translate-default-target-language' (if also set) becomes the
source language.

In particular, when both variables are set, translation is performed
in the reverse direction.

\(fn &optional OVERRIDE-P)" t nil)

(autoload 'google-translate-at-point "google-translate-default-ui" "\
Translate the word at point or the words in the active region.

For the meaning of OVERRIDE-P, see `google-translate-query-translate'.

\(fn &optional OVERRIDE-P)" t nil)

(autoload 'google-translate-at-point-reverse "google-translate-default-ui" "\
Like `google-translate-at-point', but performs translation in the
reverse direction.

\(fn &optional OVERRIDE-P)" t nil)

;;;***

;;;### (autoloads nil "google-translate-smooth-ui" "../../../../../.emacs.d/elpa/google-translate-20160111.654/google-translate-smooth-ui.el"
;;;;;;  "44a288bfcbffe8b916214e8eb57bf7c1")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/google-translate-20160111.654/google-translate-smooth-ui.el

(autoload 'google-translate-smooth-translate "google-translate-smooth-ui" "\
Translate a text using translation directions.

Make a prompt in minibuffer for a text to translate. Default text
is word at point.

In case of `google-translate-translation-directions-alist' is
empty list then after inputed translating text prompts for source
language and then for target languages.

In case of `google-translate-translation-directions-alist' is not
empty list takes current translation direction and makes
appropriate translation. Current translation direction indicates
in the minibuffers' prompt.

A current translation direction could be changed directly in the
minibuffer by means of key bindings such as C-n and C-p for
changing to the next translation direction and to the previous
one respectively.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/google-translate-20160111.654/google-translate-autoloads.el"
;;;;;;  "../../../../../.emacs.d/elpa/google-translate-20160111.654/google-translate-core-ui.el"
;;;;;;  "../../../../../.emacs.d/elpa/google-translate-20160111.654/google-translate-core.el"
;;;;;;  "../../../../../.emacs.d/elpa/google-translate-20160111.654/google-translate-default-ui.el"
;;;;;;  "../../../../../.emacs.d/elpa/google-translate-20160111.654/google-translate-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/google-translate-20160111.654/google-translate-smooth-ui.el"
;;;;;;  "../../../../../.emacs.d/elpa/google-translate-20160111.654/google-translate-tk.el"
;;;;;;  "../../../../../.emacs.d/elpa/google-translate-20160111.654/google-translate.el")
;;;;;;  (22276 52724 684302 100000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; google-translate-autoloads.el ends here
