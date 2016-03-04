;; loading중에 얼마나 많은 시간이 걸리는지 확인하기 위한 용도
(setq message-log-max t)
;; 튜토리얼 메시지 없애기
(setq inhibit-startup-message t)
;; 한글 환경
(set-language-environment "Korean")
(setq current-language-environment "Korean")
(setq default-input-method "korean-hangul")
;; UTF-8로 저장
(prefer-coding-system 'utf-8)

;; yes/no대신에 y/n으로
(defalias 'yes-or-no-p 'y-or-n-p)

; (save-place-mode +1)
(setq-default save-place t);)
(setq save-place-file "~/.emacs.d/saved-places")
(setq save-place-forget-unreadable-files t)

;; Backup file을 생성하지 않음
(setq make-backup-files nil)

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] (lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] (lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
)
;; Smooth Scroll
(setq scroll-margin 1
scroll-conservatively 9999
scroll-step 1)

(setq mouse-wheel-scroll-amount '(3 ((shift) . 3) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(file-name-shadow-mode t)             ;;be smart about file names in mini buffer
(global-font-lock-mode t)             ;;syntax highlighting on...
(setq font-lock-maximum-decoration t) ;;...as much as possible
(setq frame-title-format '(buffer-file-name "%f" ("%b"))) ;;titlebar=buffer unless filename

;; Diminish to clean clutter from the modeline
(require 'diminish)
(diminish 'visual-line-mode)
(after 'autopair (diminish 'autopair-mode))
(after 'undo-tree (diminish 'undo-tree-mode))
(after 'auto-complete (diminish 'auto-complete-mode))
(after 'projectile (diminish 'projectile-mode))
(after 'yasnippet (diminish 'yas-minor-mode))
(after 'guide-key (diminish 'guide-key-mode))
(after 'eldoc (diminish 'eldoc-mode))
(after 'smartparens (diminish 'smartparens-mode))
(after 'company (diminish 'company-mode))
(after 'elisp-slime-nav (diminish 'elisp-slime-nav-mode))
(after 'git-gutter+ (diminish 'git-gutter+-mode))
(after 'magit (diminish 'magit-auto-revert-mode))
(after 'hs-minor-mode (diminish 'hs-minor-mode))
(after 'color-identifiers-mode (diminish 'color-identifiers-mode))
