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
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     better-defaults
     emacs-lisp
     git
     gtags
     markdown
     org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     c-c++
     ranger
     org
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(doom-themes esh-autosuggest all-the-icons default-text-scale centered-window)
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
  ;; local
  (setq configuration-layer--elpa-archives
      `(("melpa" . ,(concat user-home-directory "/.elpa-mirror/melpa/"))
        ("org"   . ,(concat user-home-directory "/.elpa-mirror/org/"))
        ("gnu"   . ,(concat user-home-directory "/.elpa-mirror/gnu/"))
        ("melpa" . "https://raw.githubusercontent.com/syl20bnr/elpa-mirror/master/melpa/")
        ("org"   . "https://raw.githubusercontent.com/syl20bnr/elpa-mirror/master/org/")
        ("gnu"   . "https://raw.githubusercontent.com/syl20bnr/elpa-mirror/master/gnu/")
        ("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/")
        ("org"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/org/")
        ("gnu"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/gnu/")))
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 1
   ;; If non nil then spacemacs will check for updates at startup
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
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
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
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16
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
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
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
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
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
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
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
   dotspacemacs-line-numbers '(:relative nil
                                 :disabled-for-modes dired-mode
                                 ranger-mode
                                 org-mode
                                 pdf-view-mode
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
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
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
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq use-package-always-ensure t)
  (use-package auto-compile
    :config (auto-compile-on-load-mode))

  (global-prettify-symbols-mode t)

  (setq scroll-conservatively 100)

  (use-package diff-hl
    :config
    (add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
    (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode))

  (add-hook 'sh-mode-hook
            (lambda ()
              (setq sh-basic-offset 2
                    sh-indentation 2)))
  (setq org-ellipsis "⤵")
  ;; General
  (set-language-environment "Korean")
  (prefer-coding-system 'utf-8) ; utf-8 환경 설정
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)

  (setq echo-keystrokes 0.001) ;; 키입력시 에코창에 표시되는 딜레이 타임, 거이 없게 설정

  ;; 백업 끄기
  (setq backup-inhibited t)
  (setq make-backup-files nil)
  (setq auto-save-default nil)

  ;; follow link? 물음 무시
  (setq vc-follow-symlinks t)

  ;; coding
  ;; tab width set
  (defun c-lineup-arglist-tabs-only (ignored)
    "Line up argument lists by tabs, not spaces"
    (let* ((anchor (c-langelem-pos c-syntactic-element))
           (column (c-langelem-2nd-pos c-syntactic-element))
           (offset (- (1+ column) anchor))
           (steps (floor offset c-basic-offset)))
      (* (max steps 1)
         c-basic-offset)))
  (c-add-style "linux-kernel"
               '("linux" (c-offsets-alist
                          (arglist-cont-nonempty
                           c-lineup-gcc-asm-reg
                           c-lineup-arglist-tabs-only))))
  (add-hook 'c-mode-hook
    '(lambda()
      (setq c-basic-offset 8)
      (setq tab-width 8)
      (setq indent-tabs-mode t)
      (setq show-trailing-whitespace t)
      (c-set-style "linux-kernel")
      (message "Setting up indentation for the linux kernel")))

  (add-hook 'makefile-mode-hook
            '(lambda()
               (setq tab-width 8)
               (setq indent-tabs-mode t)
               (setq show-trailing-whitespace t)))

  (add-hook 'makefile-gmake-mode
            '(lambda()
               (setq tab-width 8)
               (setq indent-tabs-mode t)
               (setq show-trailing-whitespace t)))

  (defun font-lock-comment-annotations ()
    "Highlight a bunch of well known comment annotations.
This functions should be added to the hooks of major modes for programming."
    (font-lock-add-keywords
     nil
     '(("\\<\\(FIX\\(ME\\)?\\|BUG\\|HACK\\):" 1 font-lock-warning-face t)
       ("\\<\\(NOTE\\):" 1 'org-level-2 t)
       ("\\<\\(TODO\\):" 1 'org-todo t)
       ("\\<\\(DONE\\):" 1 'org-done t))
     ))

  (add-hook 'prog-mode-hook 'font-lock-comment-annotations)

  (use-package cwarn
    :config
    (add-hook 'c-mode-common-hook '(lambda () (cwarn-mode 1))))

  (add-hook 'c-mode-common-hook '(lambda () (hide-ifdef-mode 1)))

  (dolist (m '(c-mode c++-mode))
    (font-lock-add-keywords
     m
     '(("\\<\\(int8_t\\|int16_t\\|int32_t\\|int64_t\\|uint8_t\\|uint16_t\\|uint32_t\\|uint64_t\\)\\>" . font-lock-keyword-face))))


  (use-package org
    :config
    (setq org-bullets-bullet-list '("⊙" "■" "◉" "⊚" "◆" "▼" "●" "✲" "✱" "✻" "✾" "✿" "❀"
                                    "✡" "◎" "○" "◦" "⊛" "❁" "❂" "❃" "❄" "❅" "❆" "❇"))
    )

  ;; eshell
  (use-package esh-autosuggest
    :hook (eshell-mode . esh-autosuggest-mode)
    ;; If you have use-package-hook-name-suffix set to nil, uncomment and use the
    ;; line below instead:
    ;; :hook (eshell-mode-hook . esh-autosuggest-mode)
    :bind (:map shell-mode-map ("C-SPC" . helm-esh-pcomplete))
    )

  ;; Persistent undos - undos are saved even beyond closing down emacs, and can be revisited with undo-tree-load-history
  (use-package undo-tree
    :config
      (setq undo-tree-auto-save-history t
            undo-tree-history-directory-alist
            `(("." . ,"~/.emacs.d/private/undo-tree-history/")))
      (unless (file-exists-p "~/.emacs.d/private/undo-tree-history/")
        (make-directory "~/.emacs.d/private/undo-tree-history/"))
      (global-undo-tree-mode t)
      )

  ;; Term
  (setq multi-term-program "/usr/bin/zsh")

  ;; eshell
  (setq eshell-cmpl-ignore-case t)

  ;; scroll
  (setq scroll-margin 5
        scroll-conservatively 9999
        scroll-step 1)

  ;; UI
  (setq powerline-default-separator 'slant)

  ;; Font
  ;; Hangul(한글)
  (defconst local-hangul-el-path "~/.spacemacs.hangul.el")
  (when (file-exists-p local-hangul-el-path)
    (load-file local-hangul-el-path))

  ;; EVIL
  (defconst local-evil-el-path "~/.spacemacs.evil.el")
  (when (file-exists-p local-evil-el-path)
    (load-file local-evil-el-path))

  ;; Helm
  (defconst local-helm-el-path "~/.spacemacs.helm.el")
  (when (file-exists-p local-helm-el-path)
    (load-file local-helm-el-path))

  (use-package helm-gtags
    :config
    (add-hook 'c-mode-hook 'helm-gtags-mode)
    (add-hook 'c++-mode-hook 'helm-gtags-mode)
    (add-hook 'asm-mode-hook 'helm-gtags-mode)
    (add-hook 'makefile-mode-hook 'helm-gtags-mode)

    (global-set-key [C-down-mouse-1] nil)
    (global-set-key [C-mouse-1] 'helm-gtags-dwim)
    ); Allow very large database files
  (setq ggtags-oversize-limit 104857600)
  (setq ggtags-sort-by-nearness t)


  ;;;; mouse ;;;;
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
  ;; 마우스 선택시 text를 clipboard로 복사
  (setq mouse-drag-copy-region t)

  ;; default-text-scale
  (use-package default-text-scale
    :config
    (setq default-text-scale-mode t))

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
  ;; Ranger
  (use-package ranger
    :init
    (setq ranger-cleanup-eagerly t)
    (setq ranger-cleanup-on-disable t)
    (setq ranger-show-hidden nil)
    (setq ranger-max-preview-size 10)
    (setq ranger-dont-show-binary t)
    (setq ranger-parent-depth 3)
    (setq ranger-width-parents 0.12)
    (setq ranger-max-parent-width 0.12)
    :config (ranger-override-dired-mode t)
    )

  (use-package all-the-icons
    :init
    (setq neo-theme 'icons)
    )
  ;; custom-set-variable에 추가되는 것을 막아보자
  (setq custom-file (make-temp-file "emacs-custom"))
  (setq frame-resize-pixelwise t)

  (setq backward-delete-char-untabify-method nil)
  (setq pixel-scroll-mode t)

  (use-package whitespace
    :config
    (set-face-attribute 'whitespace-space nil :background nil :foreground "gray25")
    (set-face-attribute 'whitespace-tab nil :background nil :foreground "gray25")
    (set-face-attribute 'whitespace-trailing nil :background nil :foreground "gray25")
    (set-face-attribute 'whitespace-newline nil :background nil :foreground "gray35")
    (setq whitespace-line-column 120)
    (global-whitespace-mode 1)
    )
      (defun copy-to-clipboard ()
      "Copies selection to x-clipboard."
      (interactive)
      (if (display-graphic-p)
          (progn
            (message "Yanked region to x-clipboard!")
            (call-interactively 'clipboard-kill-ring-save)
            )
        (if (region-active-p)
            (progn
              (shell-command-on-region (region-beginning) (region-end) "xsel -i -b")
              (message "Yanked region to clipboard!")
              (deactivate-mark))
          (message "No region active; can't yank to clipboard!")))
      )

    (defun paste-from-clipboard ()
      "Pastes from x-clipboard."
      (interactive)
      (if (display-graphic-p)
          (progn
            (clipboard-yank)
            (message "graphics active")
            )
        (insert (shell-command-to-string "xsel -o -b"))
        )
      )
  (evil-leader/set-key "o y" 'copy-to-clipboard)
  (evil-leader/set-key "o p" 'paste-from-clipboard)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lv org-projectile org-plus-contrib writeroom-mode visual-fill-column esh-autosuggest doom-themes default-text-scale all-the-icons memoize unfill smeargle ranger orgit org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup htmlize helm-gtags helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md ggtags fuzzy flycheck-pos-tip pos-tip flycheck evil-magit magit transient git-commit with-editor disaster diff-hl company-statistics company-c-headers company cmake-mode clang-format auto-yasnippet yasnippet ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
