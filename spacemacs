;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'nil
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation nil
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     gnus
     vimscript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; (ranger :variables ranger-show-preview t)
     ranger
     (shell :variables shell-default-height 30 shell-default-position 'bottom)
     (typography :variables typography-enable-typographic-editing t)
     auto-completion
     better-defaults
     c-c++
     emacs-lisp
     git
     gtags
     helm
     html
     markdown
     org
     python
     spell-checking
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(py-autopep8 dts-mode)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
			 spacemacs-light
			 spacemacs-dark
			 )
   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("FantasqueSansMono Nerd Font"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key "C-h"
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-h"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text t
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non-nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts t
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 10
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non-nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'right-bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative t
					 :disabled-for-modes dired-mode
					 doc-view-mode
					 markdown-mode
					 org-mode
					 pdf-view-mode
					 text-mode
					 :size-limit-kb 1000)
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq evil-want-C-i-jump t)
  (setq helm-gtags-maximum-candidates 50000)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (set-language-environment "Korean")
  (prefer-coding-system 'utf-8) ; utf-8 환경 설정

  ;; quit insert mode by pressing jk
  (setq-default evil-escape-key-sequence (kbd "jk"))
  ;; Kill current buffer
  (define-key evil-normal-state-map (kbd "C-q") 'kill-this-buffer)
  (define-key evil-insert-state-map (kbd "C-q") 'kill-this-buffer)
  (define-key evil-hybrid-state-map (kbd "C-q") 'kill-this-buffer)
  (define-key evil-visual-state-map (kbd "C-q") 'kill-this-buffer)
  ;; Make evil-mode up/down operate in screen lines instead of logical lines
  (define-key evil-motion-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "k") 'evil-previous-visual-line)
  ;; (define-key evil-motion-state-map (kbd "j") (lambda () (interactive) (call-interactively 'evil-next-visual-line) (evil-scroll-line-to-center (line-number-at-pos))))
  ;; (define-key evil-motion-state-map (kbd "k") (lambda () (interactive) (call-interactively 'evil-previous-visual-line) (evil-scroll-line-to-center (line-number-at-pos))))
  ;; (define-key evil-motion-state-map (kbd "j") (kbd "gjzz"))
  ;; (define-key evil-motion-state-map (kbd "k") (kbd "gkzz"))

  ;; Also in visual mode
  (define-key evil-visual-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-visual-state-map (kbd "k") 'evil-previous-visual-line)
  ;; (define-key evil-visual-state-map (kbd "j") (kbd "gjzz"))
  ;; (define-key evil-visual-state-map (kbd "k") (kbd "gkzz"))
  (define-key evil-visual-state-map (kbd "q") 'evil-normal-state)

  ;; move quick
  (define-key evil-normal-state-map (kbd "\C-e") 'evil-end-of-line)
  (define-key evil-insert-state-map (kbd "\C-e") 'end-of-line)
  (define-key evil-visual-state-map (kbd "\C-e") 'evil-end-of-line)
  (define-key evil-hybrid-state-map (kbd "\C-e") 'evil-end-of-line)
  (define-key evil-motion-state-map (kbd "\C-e") 'evil-end-of-line)
  ;; exit with <C-g>
  (global-set-key (kbd "C-g") 'evil-escape)

  (define-key evil-visual-state-map (kbd "v") 'er/expand-region)

  ;; tab width set
  (setq-default tab-width 8)
  (setq-default c-basic-offset 8)
  (setq-default indent-tabs-mode t)
  (setq-default c-default-style "linux")

  ;; Evil keymap
  (define-key evil-motion-state-map (kbd "C-]") 'helm-gtags-find-tag)
  (define-key evil-motion-state-map (kbd "<f7>") 'helm-gtags-select)
  (define-key evil-motion-state-map (kbd "M-o") 'helm-projectile-find-file)
  (define-key evil-motion-state-map (kbd "C-l") 'helm-mini)
  (define-key evil-motion-state-map (kbd "C-b") 'bookmark-set)
  (define-key evil-motion-state-map (kbd "C-S-b") 'bookmark-delete)
  (define-key evil-motion-state-map (kbd "M-l") 'helm-gtags-parse-file)
  (define-key evil-motion-state-map (kbd "SPC") 'evil-avy-goto-word-or-subword-1)

  (define-key evil-visual-state-map (kbd "C-]") 'helm-gtags-find-tag)
  (define-key evil-visual-state-map (kbd "<f7>") 'helm-gtags-select)
  (define-key evil-visual-state-map (kbd "M-o") 'helm-projectile-find-file)
  (define-key evil-visual-state-map (kbd "M-l") 'helm-gtags-parse-file)
  (define-key evil-visual-state-map (kbd "SPC") 'evil-avy-goto-word-or-subword-1)

  (define-key evil-insert-state-map (kbd "C-]") 'helm-gtags-find-tag)
  (define-key evil-insert-state-map (kbd "<f7>") 'helm-gtags-select)
  (define-key evil-insert-state-map (kbd "M-o") 'helm-projectile-find-file)
  (define-key evil-insert-state-map (kbd "C-v") 'spacemacs/paste-transient-state/evil-paste-after)
  (define-key evil-insert-state-map (kbd "C-l") 'helm-mini)
  (define-key evil-insert-state-map (kbd "M-l") 'helm-gtags-parse-file)

  (define-key evil-hybrid-state-map (kbd "C-]") 'helm-gtags-find-tag)
  (define-key evil-hybrid-state-map (kbd "<f7>") 'helm-gtags-select)
  (define-key evil-hybrid-state-map (kbd "M-o") 'helm-projectile-find-file)
  (define-key evil-hybrid-state-map (kbd "C-v") 'spacemacs/paste-transient-state/evil-paste-after)
  (define-key evil-hybrid-state-map (kbd "C-l") 'helm-mini)
  (define-key evil-hybrid-state-map (kbd "M-l") 'helm-gtags-parse-file)

  (evil-ex-define-cmd "Q[uit]" 'evil-quit-all)
  (evil-ex-define-cmd "W[rite]" 'evil-write)
  (evil-ex-define-cmd "Wq" 'evil-save-and-quit)

  (defun forward-evil-word (&optional count)
    ""
    (let ((init-point (point)))
      (forward-symbol (or count 1))

      (if (= (point) init-point)
	  count 0)))

  (setq-default evil-symbol-word-search t)

  ;; centered-cursor-mode set
  (global-centered-cursor-mode +1)

  (setq-default line-spacing 2)
  (defun alex/line-spacing-increase()
    (interactive)
    (setq line-spacing (min 40
			    (+ line-spacing 1))))
  (defun alex/line-spacing-decrease()
    (interactive)
    (setq line-spacing (max 0
			    (- line-spacing 1))))


  (setq mouse-click-focus-ignore-position t)
  ;; scroll one line at a time (less "jumpy" than defaults)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
  (setq scroll-step 1) ;; keyboard scroll one line at a time
  (setq select-enable-primary t)
  (setq mouse-drag-copy-region t)

  (if (eq system-type 'windows-nt)
      (progn
	(global-unset-key (kbd "<C-wheel-down>"))
	(global-unset-key (kbd "<C-wheel-up>"))
	(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
	(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
	(define-key evil-motion-state-map (kbd "<C-wheel-down>") 'text-scale-decrease)
	(define-key evil-motion-state-map (kbd "<C-wheel-up>") 'text-scale-increase)
	(global-unset-key (kbd "<C-S-wheel-down>"))
	(global-unset-key (kbd "<C-S-wheel-up>"))
	(global-set-key (kbd "<C-S-wheel-down>") 'alex/line-spacing-decrease)
	(global-set-key (kbd "<C-S-wheel-up>") 'alex/line-spacing-increase)
	)
    (progn
      (global-unset-key (kbd "<C-mouse-5>"))
      (global-unset-key (kbd "<C-mouse-4>"))
      (global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
      (global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
      (define-key evil-motion-state-map (kbd "<C-mouse-5>") 'text-scale-decrease)
      (define-key evil-motion-state-map (kbd "<C-mouse-4>") 'text-scale-increase)
      (global-unset-key (kbd "<C-S-mouse-5>"))
      (global-unset-key (kbd "<C-S-mouse-4>"))
      (global-set-key (kbd "<C-S-mouse-5>") 'alex/line-spacing-decrease)
      (global-set-key (kbd "<C-S-mouse-4>") 'alex/line-spacing-increase)
      )
    )

  ;; add <<, >> to cycle angle
  (define-typo-cycle typo-cycle-left-angle-brackets
    "Cycle through the less-than sign and guillemet quotation marks.
     If used with a numeric prefix argument N, N less-than signs will be inserted."
    ("<" "<<" "«" "‹"))

  (define-typo-cycle typo-cycle-right-angle-brackets
    "Cycle through the greater-than sign and guillemet quotation marks.
     If used with a numeric prefix argument N, N greater-than signs will be inserted."
    (">" ">>" "»" "›" ))

  ;; quit ediff mode without y-or-n
  (defun disable-y-or-n-p (orig-fun &rest args)
    (cl-letf (((symbol-function 'y-or-n-p) (lambda (prompt) t)))
      (apply orig-fun args)))

  (advice-add 'ediff-quit :around #'disable-y-or-n-p)
  ;; ------------ ORG MODE +
  ;; enable org-indent-mode with org-mode
  (add-hook 'org-mode-hook 'my-org-mode-hook)
  (defun my-org-mode-hook ()
    ;;(require 'org-ref) ;; If you want this, use M-x.
    (org-indent-mode 1)
    ;;(focus-mode 1)
    (visual-line-mode))
  (font-lock-add-keywords 'org-mode
			  '(("^ +\\([-*]\\) "
			     (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
  (setq org-bullets-bullet-list '( "■" "◆" "▼" "●" "✲" "✱" "✻" "✼" "✽" "✾" "✿" "❀" "✡" "✽" "◉" "◎" "○" "◦" "⊙" "⊚" "⊛" "❁" "❂" "❃" "❄" "❅" "❆" "❇"))
  (setq org-default-notes-file "~/Dropbox/org/notes.org")
  (global-set-key (kbd "C-0") 'org-capture)
  (setq org-capture-templates
	'(("t" "Todo" entry (file+headline "~/Dropbox/org/gtd.org" "Tasks")
	   "* TODO %?\n  %i  %a")
	  ("j" "Journal" entry (file+datetree "~/Dropbox/org/journal.org")
	   "* %?\nEntered on %U\n  %i  %a")))
  (setq reftex-default-bibliography '("~/Dropbox/bibliography/references.bib"))

  ;; see org-ref for use of these variables
  (setq org-ref-bibliography-notes "~/Dropbox/bibliography/notes.org"
	org-ref-default-bibliography '("~/Dropbox/bibliography/references.bib")
	org-ref-pdf-directory "~/Dropbox/bibliography/bibtex-pdfs/")
  (setq helm-bibtex-bibliography "~/Dropbox/bibliography/references.bib")
  (setq helm-bibtex-library-path "~/Dropbox/bibliography/bibtex-pdfs")
  (global-set-key (kbd "<f12>")
		  (lambda () (interactive) (find-file "~/Dropbox/org/gtd.org")))
  (define-key evil-motion-state-map (kbd "<backspace>") 'widen)
  (define-key evil-normal-state-map (kbd "<backspace>") 'widen)

  ;; ------------ ORG MODE -

  ;; olivetti
  (defun alex/toggle-write-mode ()
    "Toggle a distraction-free environment for writing."
    (interactive)
    (cond ((bound-and-true-p olivetti-mode)
	   (olivetti-mode -1)
	   (olivetti-toggle-hide-mode-line)
	   (toggle-frame-fullscreen)
	   (focus-mode -1)
	   (spacemacs/toggle-line-numbers-on))
	  (t
	   (olivetti-mode 1)
	   (olivetti-toggle-hide-mode-line)
	   (toggle-frame-fullscreen)
	   (focus-mode 1)
	   (spacemacs/toggle-line-numbers-off))))
  ;; windows spell checker
  (if (eq system-type 'windows-nt)
    (setq ispell-program-name "C:\\Program Files (x86)\\Aspell\\bin\\aspell.exe")
    (setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))
  )

  ;; tumblr
  (setq tumblesocks-blog "code2write.tumblr.com")
  ;; helm
  (setq helm-mini-default-sources '(helm-source-buffers-list
				    helm-source-recentf
				    helm-source-bookmarks
				    helm-source-buffer-not-found))

  ;; Hangul(한글)
  (set-fontset-font t 'hangul (font-spec :name "Binggrae"))

  (if (daemonp)
      (progn
  	(add-hook 'after-make-frame-functions
  		  (lambda (frame)
  				   (with-selected-frame frame
  				     (set-fontset-font "fontset-default" '(#x1100 . #xffdc)
  						       '("Binggrae". "iso10646-1"))
  				     (set-fontset-font "fontset-default" '(#xe0bc . #xf66e)
  						       '("Binggrae". "iso10646-1"))
  				     )))
  	)
      (set-fontset-font "fontset-default" '(#x1100 . #xffdc)
  			'("Binggrae". "iso10646-1"))
      (set-fontset-font "fontset-default" '(#xe0bc . #xf66e)
  			'("Binggrae". "iso10646-1"))
    )

  ;; C mode hack
  ;; (defun my-c-mode-font-lock-if0 (limit)
  ;;   (save-restriction
  ;;     (widen)
  ;;     (save-excursion
  ;; 	(goto-char (point-min))
  ;; 	(let ((depth 0) str start start-depth)
  ;; 	  (while (re-search-forward "^\\s-*#\\s-*\\(if\\|else\\|endif\\)" limit 'move)
  ;; 	    (setq str (match-string 1))
  ;; 	    (if (string= str "if")
  ;; 		(progn
  ;; 		  (setq depth (1+ depth))
  ;; 		  (when (and (null start) (looking-at "\\s-+0"))
  ;; 		    (setq start (match-end 0)
  ;; 			  start-depth depth)))
  ;; 	      (when (and start (= depth start-depth))
  ;; 		(c-put-font-lock-face start (match-beginning 0) 'font-lock-comment-face)
  ;; 		(setq start nil))
  ;; 	      (when (string= str "endif")
  ;; 		(setq depth (1- depth)))))
  ;; 	  (when (and start (> depth 0))
  ;; 	    (c-put-font-lock-face start (point) 'font-lock-comment-face)))))
  ;;   nil)

  ;; (defun my-c-mode-common-hook ()
  ;;   (font-lock-add-keywords
  ;;    nil
  ;;    '((my-c-mode-font-lock-if0 (0 font-lock-comment-face prepend))) 'add-to-end))

  ;; (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
  ;; ;;
  ;; (add-hook 'c-mode-common-hook
  ;; 	    (lambda ()
  ;; 	      (font-lock-add-keywords nil
  ;; 				      '(("\\<\\(FIXME\\|TODO\\|HACK\\|fixme\\|todo\\|hack\\)" 1
  ;; 					 font-lock-warning-face t)))))
  ;; (font-lock-add-keywords
  ;;  'c-mode
  ;;  '(("\\<\\(\\sw+\\) ?(" 1 'font-lock-function-name-face)))

  (global-set-key [C-down-mouse-1] nil)
  (global-set-key [C-mouse-1] 'helm-gtags-dwim)

  ;; (defun helm-select-candidate-by-mouse (prefix event)
  ;;   "Select helm candidate by using mouse(click).  With PREFIX, also execute its first action."
  ;;   (interactive "P\ne")
  ;;   (if (helm-alive-p)
  ;; 	(progn
  ;; 	  (with-helm-buffer
  ;; 	    (let* ((posn (elt event 1))
  ;; 		   (cursor (line-number-at-pos (point)))
  ;; 		   (pointer (line-number-at-pos (posn-point posn))))
  ;; 	      (helm--next-or-previous-line (if (> pointer cursor)
  ;; 					       'next
  ;; 					     'previous)
  ;; 					   (abs (- pointer cursor)))))
  ;; 	  (when prefix (helm-maybe-exit-minibuffer)))
  ;;     (mouse-drag-region event)))

  ;; (bind-key* "<down-mouse-1>" #'helm-select-candidate-by-mouse())
  ;; (bind-key* "<mouse-1>" #'ignore)
  ;; python -------------------------
  (setq py-autopep8-options '("--max-line-length=100"))

  (add-hook 'after-make-frame-functions
	    (lambda (frame)
	      (when (not (display-graphic-p frame))
		(custom-set-faces
		 '(default ((t (:background "unspecified-bg"))))
		 '(hl-line ((t (:background "black"))))
		 '(powerline-active2 ((t (:background "unspecified-bg" :weight light))))
		 '(powerline-active1 ((t (:background "#CC1133" :foreground "#EEEEEE"  :weight light))))
		 '(powerline-inactive2 ((t (:background "unspecified-bg" :foreground "yellow"  :weight light))))
		 '(powerline-inactive1 ((t (:background "unspecified-bg" :foreground "yellow"  :weight light))))
		 '(modeline-inactive ((t (:background "unspecified-bg"  :foreground "cyan"  :weight light))))
		 '(mode-line ((t (:background "#B5E61D" :foreground "#001111"  :weight light))))
		 '(linum ((t (:background "unspecified-bg"))))
		 )
		)
	      )
	    )

  ;; GNUS
  ;; Send email via Gmail:
  (setq message-send-mail-function 'smtpmail-send-it
	smtpmail-default-smtp-server "203.254.227.42")

  ;; Ranger
  (setq ranger-cleanup-eagerly t)
  (setq ranger-show-dotfiles nil)
  (setq ranger-max-preview-size 10)
  (setq ranger-dont-show-binary t)


  ;; mode-line
  ;;(setq powerline-default-separator nil)
  (setq spaceline-which-function-p nil)
  (setq spaceline-minor-modes-p nil)
  (defun spaceline--unicode-number (str)
    "Return a nice unicode representation of a single-digit number STR."
    (cond
     ((string= "1" str) "(1)")
     ((string= "2" str) "(2)")
     ((string= "3" str) "(3)")
     ((string= "4" str) "(4)")
     ((string= "5" str) "(5)")
     ((string= "6" str) "(6)")
     ((string= "7" str) "(7)")
     ((string= "8" str) "(8)")
     ((string= "9" str) "(9)")
     ((string= "10" str) "(10)")
     (t str)))
  (setq powerline-utf-8-separator-left #xe0b8)  ;; 
  (setq powerline-utf-8-separator-right #xe0be) ;; 

  ;; line number format
  (setq linum-relative-format "%4s  ")
  )



;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode packed anaconda-mode smartparens highlight flycheck alert projectile magit-popup git-commit winum web-mode use-package restart-emacs mmm-mode live-py-mode info+ indent-guide git-link expand-region evil-nerd-commenter ace-window evil yasnippet company helm helm-core magit async yapfify xterm-color ws-butler which-key volatile-highlights vimrc-mode vi-tilde-fringe uuidgen unfill undo-tree typo toc-org tagedit subatomic-theme spaceline smeargle slim-mode shell-pop scss-mode sass-mode ranger rainbow-delimiters pyvenv pytest pyenv-mode py-isort py-autopep8 pug-mode popwin pip-requirements persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-download org-bullets open-junk-file neotree mwim multi-term move-text markdown-toc magit-gitflow macrostep lorem-ipsum linum-relative link-hint less-css-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag goto-chg google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe git-gutter-fringe+ gh-md ggtags fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump dts-mode disaster diminish diff-hl define-word dactyl-mode cython-mode company-web company-statistics company-c-headers company-anaconda column-enforce-mode cmake-mode clean-aindent-mode clang-format bind-key auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-link ace-jump-helm-line ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
