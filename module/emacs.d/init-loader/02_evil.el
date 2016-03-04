(evil-mode t)

(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-replace-state-map "jk" 'evil-normal-state)
(key-chord-define evil-visual-state-map "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map "ㅓㅏ" 'evil-normal-state)
(key-chord-define evil-replace-state-map "ㅓㅏ" 'evil-normal-state)
(key-chord-define evil-visual-state-map  "ㅓㅏ" 'evil-normal-state)
(key-chord-mode 1)

(setq evil-auto-indent t)
(setq evil-shift-width 8)
(setq evil-search-wrap nil)

(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

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

;; evil related ui
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
;; Search * with full word
(setq-default evil-symbol-word-search t)

(defun close-all-other-buffers-and-frames ()
  "Close all buffers and quit"
  :repeat nil
  (interactive )
  (mapc 'kill-buffer (buffer-list))
  (condition-case nil
      (delete-window)
    (error
     (if (and (boundp 'server-buffer-clientks)
	      (fboundp 'server-edit)
	      (fboundp 'server-buffer-done)
	      server-buffer-clients)
	 (if force
	     (server-buffer-done (current-buffer))
	   (server-edit))
       (condition-case nil
	   (delete-frame)
	 (error
	  (if force
	      (kill-emacs)
	    (save-buffers-kill-emacs))))))))

(defun close-all (orig-fun &rest args)
  "Close all buffers and quit"
  :repeat nil
  (interactive)
  (mapc 'kill-buffer (buffer-list))
  (condition-case nil
      (delete-window)
    (error
     (if (and (boundp 'server-buffer-clientks)
	      (fboundp 'server-edit)
	      (fboundp 'server-buffer-done)
	      server-buffer-clients)
	 (if force
	     (server-buffer-done (current-buffer))
	   (server-edit))
       (condition-case nil
	   (delete-frame)
	 (error
	  (if force
	      (kill-emacs)
	    (save-buffers-kill-emacs))))))))
(evil-ex-define-cmd "Q" 'close-all-other-buffers-and-frames)
(evil-ex-define-cmd "W" "write")
(evil-ex-define-cmd "Wq" 'evil-save-and-quit)
(advice-add #'evil-quit :around #'close-all)

(require 'evil-visualstar)
(global-evil-visualstar-mode t)
;; Define keyss
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-visual-state-map (kbd ";") 'evil-ex)
(define-key evil-motion-state-map (kbd ";") 'evil-ex)

(define-key evil-normal-state-map "  " 'helm-mini)
(define-key evil-normal-state-map "  " 'helm-my-buffers)
(define-key evil-normal-state-map " b" 'helm-bookmarks)
(define-key evil-normal-state-map " r" 'helm-recentf)
(define-key evil-normal-state-map " k" 'helm-show-kill-ring)
(define-key evil-normal-state-map " o" 'helm-occur)
(define-key evil-normal-state-map "-" 'helm-gtags-find-tag-from-here)
(define-key evil-normal-state-map (kbd "M-o") 'helm-gtags-select-path)
(define-key evil-normal-state-map (kbd "M-/") 'helm-gtags-find-rtag)
(define-key evil-normal-state-map (kbd "M-S-/") 'helm-projectile-grep)
(define-key evil-normal-state-map (kbd "<f12>") 'helm-gtags-dwim)
(define-key evil-normal-state-map (kbd "C-]") 'helm-gtags-find-tag)
(define-key evil-normal-state-map (kbd "<f7>") 'helm-gtags-select)
(define-key evil-normal-state-map (kbd "M-0") 'helm-find-files)
(define-key evil-normal-state-map (kbd "M-l") 'helm-semantic-or-imenu)

(define-key evil-insert-state-map (kbd "M-o") 'helm-gtags-select-path)
(define-key evil-insert-state-map (kbd "M-/") 'helm-gtags-find-rtag)
(define-key evil-insert-state-map (kbd "M-S-/") 'helm-projectile-grep)
(define-key evil-insert-state-map (kbd "<f12>") 'helm-gtags-dwim)
(define-key evil-insert-state-map (kbd "C-]") 'helm-gtags-find-tag)
(define-key evil-insert-state-map (kbd "<f7>") 'helm-gtags-select)
(define-key evil-normal-state-map (kbd "M-0") 'helm-find-files)
(define-key evil-normal-state-map (kbd "M-l") 'helm-semantic-or-imenu)

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

;; j/k will move over the wrapped lines
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;; keep the highlight on
(setq evil-search-module 'evil-search)

(define-key evil-normal-state-map "<C-down-mouse-1>" 'helm-gtags-find-tag)
