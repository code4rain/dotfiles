;; Quit
(define-key evil-normal-state-map (kbd "C-q") 'evil-window-delete)
(define-key evil-insert-state-map (kbd "C-q") 'evil-window-delete)
(define-key evil-hybrid-state-map (kbd "C-q") 'evil-window-delete)

(define-key evil-insert-state-map (kbd "TAB") 'self-insert-command)
(define-key evil-hybrid-state-map (kbd "TAB") 'self-insert-command)

(define-key evil-normal-state-map (kbd "-") 'hide-ifdef-block)
(define-key evil-normal-state-map (kbd "=") 'show-ifdef-block)
(define-key evil-normal-state-map (kbd "_") 'hide-ifdefs)
(define-key evil-normal-state-map (kbd "+") 'show-ifdefs)


;; layout control
(define-key evil-motion-state-map (kbd "C-j j") 'spacemacs/layouts-transient-state/body)
(define-key evil-insert-state-map (kbd "C-j j") 'spacemacs/layouts-transient-state/body)
(define-key evil-hybrid-state-map (kbd "C-j j") 'spacemacs/layouts-transient-state/body)

;; windows control
(define-key evil-motion-state-map (kbd "C-j C-j") 'evil-window-prev)
(define-key evil-motion-state-map (kbd "C-j h") 'evil-window-left)
(define-key evil-motion-state-map (kbd "C-j l") 'evil-window-right)
(define-key evil-motion-state-map (kbd "C-j \\") 'evil-window-vsplit)
(define-key evil-motion-state-map (kbd "C-j |") 'evil-window-vsplit)
(define-key evil-motion-state-map (kbd "C-j -") 'evil-window-split)
(define-key evil-motion-state-map (kbd "C-j z") 'maximize-window)
(define-key evil-motion-state-map (kbd "C-j x") 'evil-window-delete)
(define-key evil-motion-state-map (kbd "-") 'hide-ifdef-block)
(define-key evil-motion-state-map (kbd "=") 'show-ifdef-block)
(define-key evil-motion-state-map (kbd "_") 'hide-ifdefs)
(define-key evil-motion-state-map (kbd "+") 'show-ifdefs)

(define-key evil-insert-state-map (kbd "C-j C-j") 'evil-window-prev)
(define-key evil-insert-state-map (kbd "C-j h") 'evil-window-left)
(define-key evil-insert-state-map (kbd "C-j l") 'evil-window-right)
(define-key evil-insert-state-map (kbd "C-j \\") 'evil-window-vsplit)
(define-key evil-insert-state-map (kbd "C-j |") 'evil-window-vsplit)
(define-key evil-insert-state-map (kbd "C-j -") 'evil-window-split)
(define-key evil-insert-state-map (kbd "C-j z") 'maximize-window)
(define-key evil-insert-state-map (kbd "C-j x") 'evil-window-delete)

(define-key evil-hybrid-state-map (kbd "C-j C-j") 'evil-window-prev)
(define-key evil-hybrid-state-map (kbd "C-j h") 'evil-window-left)
(define-key evil-hybrid-state-map (kbd "C-j l") 'evil-window-right)
(define-key evil-hybrid-state-map (kbd "C-j \\") 'evil-window-vsplit)
(define-key evil-hybrid-state-map (kbd "C-j |") 'evil-window-vsplit)
(define-key evil-hybrid-state-map (kbd "C-j -") 'evil-window-split)
(define-key evil-hybrid-state-map (kbd "C-j z") 'maximize-window)
(define-key evil-hybrid-state-map (kbd "C-j x") 'evil-window-delete)

;; Make evil-mode up/down operate in screen lines instead of logical lines
(define-key evil-motion-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "k") 'evil-previous-visual-line)
;; Also in visual mode
(define-key evil-visual-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-visual-state-map (kbd "k") 'evil-previous-visual-line)
;; exit with <C-g>
(global-set-key (kbd "C-g") 'evil-escape)
(define-key evil-visual-state-map (kbd "v") 'er/expand-region)
;; ex mode
(evil-ex-define-cmd "q" 'kill-buffer-and-window)
(evil-ex-define-cmd "Q[uit]" 'evil-quit-all)
(evil-ex-define-cmd "W[rite]" 'evil-write)
(evil-ex-define-cmd "Wq" 'evil-save-and-quit)


(define-key evil-motion-state-map (kbd "M-o") 'helm-projectile-find-file)
(define-key evil-motion-state-map (kbd "C-l") 'helm-mini)
(define-key evil-motion-state-map (kbd "C-b") 'bookmark-set)
(define-key evil-motion-state-map (kbd "C-S-b") 'bookmark-delete)
(define-key evil-motion-state-map (kbd "SPC") 'evil-avy-goto-word-or-subword-1)

(define-key evil-visual-state-map (kbd "M-o") 'helm-projectile-find-file)
(define-key evil-visual-state-map (kbd "SPC") 'evil-avy-goto-word-or-subword-1)

(define-key evil-insert-state-map (kbd "M-o") 'helm-projectile-find-file)
(define-key evil-insert-state-map (kbd "C-v") 'spacemacs/paste-transient-state/evil-paste-after)
(define-key evil-insert-state-map (kbd "C-l") 'helm-mini)

(define-key evil-hybrid-state-map (kbd "M-o") 'helm-projectile-find-file)
(define-key evil-hybrid-state-map (kbd "C-v") 'spacemacs/paste-transient-state/evil-paste-after)
(define-key evil-hybrid-state-map (kbd "C-l") 'helm-mini)

(evil-define-key 'normal helm-gtags-mode-map
  (kbd "C-]") 'helm-gtags-find-tag
  (kbd "C-o") 'helm-gtags-pop-stack
  (kbd "<f7>") 'helm-gtags-select
  (kbd "M-l") 'helm-gtags-parse-file
  )
(evil-define-key 'insert helm-gtags-mode-map
  (kbd "C-]") 'helm-gtags-find-tag
  (kbd "C-o") 'helm-gtags-pop-stack
  (kbd "<f7>") 'helm-gtags-select
  (kbd "M-l") 'helm-gtags-parse-file
  )
(evil-define-key 'visual helm-gtags-mode-map
  (kbd "C-]") 'helm-gtags-find-tag
  (kbd "C-o") 'helm-gtags-pop-stack
  (kbd "<f7>") 'helm-gtags-select
  (kbd "M-l") 'helm-gtags-parse-file
  )
(evil-define-key 'motion helm-gtags-mode-map
  (kbd "C-]") 'helm-gtags-find-tag
  (kbd "C-o") 'helm-gtags-pop-stack
  (kbd "<f7>") 'helm-gtags-select
  (kbd "M-l") 'helm-gtags-parse-file
  )
(evil-define-key 'hybrid helm-gtags-mode-map
  (kbd "C-]") 'helm-gtags-find-tag
  (kbd "C-o") 'helm-gtags-pop-stack
  (kbd "<f7>") 'helm-gtags-select
  (kbd "M-l") 'helm-gtags-parse-file
  )
