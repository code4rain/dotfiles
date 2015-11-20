(require 'helm)
(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-gtags)
(setq helm-quick-update t)
(setq helm-bookmark-show-location t)
;(setq helm-buffers-fuzzy-matching t)

;(after 'projectile
;  (package 'helm-projectile))
(global-set-key (kbd "M-x") 'helm-M-x)

(require 'helm-projectile)
(helm-projectile-on)

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     nil ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)
(helm-mode 1)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-fuzzy-match t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
)

;; Enable helm-gtags-mode
;(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

;(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;(define-key helm-gtags-mode-map (kbd "<f12>") 'helm-gtags-dwim)
;(define-key evil-normal-state-map (kbd "C-/") 'helm-gtags-find-rtag)
;(define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
;(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-next-history)
;(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-previous-history)
;(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

;; go to previous/next source
(define-key helm-map (kbd "C-h") 'helm-next-source)
;(define-key helm-map (kbd "C-S-H") 'helm-previous-source)
(define-key helm-map (kbd "C-q") 'helm-keyboard-quit)
