(require 'evil)
(evil-mode t)

(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-replace-state-map "jk" 'evil-normal-state)
(key-chord-define evil-visual-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)

(setq evil-auto-indent t)
(setq evil-shift-width 8)
(setq evil-search-wrap nil)

(require 'evil-jumper)
(evil-jumper-mode t)

(defun evil-add-word-constituents (char-string)
  "Add characters in CHAR-STRING as word constituents in the current buffer,
by modifying its syntax table."
  (dolist (char (string-to-list char-string))
    (modify-syntax-entry char "w")))

(defun c-mode-hook ()
  (evil-add-word-constituents "_"))
(add-hook 'c-mode-hook #'c-mode-hook)

(require 'evil-visualstar)
(global-evil-visualstar-mode t)
;; Define keyss
(define-key evil-normal-state-map " " 'helm-mini)
(define-key evil-normal-state-map "-" 'helm-gtags-find-tag)
(define-key evil-normal-state-map (kbd "M-o") 'helm-gtags-select-path)
(define-key evil-normal-state-map (kbd "C-/") 'helm-gtags-find-rtag)
(define-key evil-normal-state-map (kbd "<f12>") 'helm-gtags-dwim)
(define-key evil-normal-state-map (kbd "C-]") 'helm-gtags-find-tag-from-here)
(define-key evil-normal-state-map (kbd "<f7>") 'helm-gtags-select)

(define-key evil-insert-state-map (kbd "M-o") 'helm-gtags-select-path)
(define-key evil-insert-state-map (kbd "C-/") 'helm-gtags-find-rtag)
(define-key evil-insert-state-map (kbd "<f12>") 'helm-gtags-dwim)
(define-key evil-insert-state-map (kbd "C-]") 'helm-gtags-find-tag-from-here)
(define-key evil-insert-state-map (kbd "<f7>") 'helm-gtags-select)

 (substitute-key-definition 'kill-buffer
                              'kill-buffer-and-its-windows
                              global-map)
(define-key evil-normal-state-map (kbd "C-q") 'kill-this-buffer)
(define-key evil-insert-state-map (kbd "C-q") 'kill-this-buffer)
(define-key evil-replace-state-map (kbd "C-q") 'kill-this-buffer)

(define-key evil-insert-state-map (kbd "C-a") 'beginning-of-line-text)
(define-key evil-normal-state-map (kbd "C-a") 'beginning-of-line-text)
(define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
(define-key evil-normal-state-map (kbd "C-e") 'end-of-line)

(define-key evil-visual-state-map (kbd "C-a") 'mark-whole-buffer)
(define-key evil-visual-state-map (kbd "C-v") 'evil-paste-after)
(define-key evil-visual-state-map (kbd "C-c") 'evil-yank)
(define-key evil-visual-state-map (kbd "C-;") 'comment-region)
(define-key evil-visual-state-map (kbd "C-S-;") 'uncomment-region)

(define-key evil-normal-state-map "<C-down-mouse-1>" 'helm-gtags-find-tag-from-here)
