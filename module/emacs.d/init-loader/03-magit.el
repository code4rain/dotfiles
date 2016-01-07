(require 'magit)
(global-set-key [F4] 'magit-status)

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows)
  )

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))


;; Customize the order of the sections which are shown in the status view. You can find the full list in
;; the magit source code.
(setq magit-status-sections-hook
      '(magit-insert-status-headers
        magit-insert-merge-log
        magit-insert-rebase-sequence
        magit-insert-am-sequence
        magit-insert-sequencer-sequence
        magit-insert-bisect-output
        magit-insert-bisect-rest
        magit-insert-bisect-log
        magit-insert-staged-changes
        magit-insert-unstaged-changes
        magit-insert-untracked-files
        magit-insert-stashes
        magit-insert-unpulled-commits
        magit-insert-unpushed-commits))


;; (defun magit-toggle-whitespace ()
;;   (interactive)
;;   (if (member "-w" magit-diff-options)
;;       (magit-dont-ignore-whitespace)
;;     (magit-ignore-whitespace)))

;; (defun magit-ignore-whitespace ()
;;   (interactive)
;;   (add-to-list 'magit-diff-options "-w")
;;   (magit-refresh))

;; (defun magit-dont-ignore-whitespace ()
;;   (interactive)
;;   (setq magit-diff-options (remove "-w" magit-diff-options))
;;   (magit-refresh))

;;;;;;;;;;;;;;;;;;;
;; evil key bindings
;;;;;;;;;;;;;;;;;;;


(define-key evil-normal-state-map (kbd "<f4>") 'magit-status)
(define-key evil-insert-state-map (kbd "<f4>") 'magit-status)
(define-key evil-motion-state-map (kbd "<f4>") 'magit-status)
(evil-set-initial-state 'magit-log-edit-mode 'insert)
(evil-set-initial-state 'git-commit-mode 'insert)
(evil-set-initial-state 'magit-commit-mode 'motion)
(evil-set-initial-state 'magit-status-mode 'motion)
(evil-set-initial-state 'magit-log-mode 'motion)
(evil-set-initial-state 'magit-wassup-mode 'motion)
(evil-set-initial-state 'magit-mode 'motion)
(evil-set-initial-state 'magit-diff-mode 'motion)
(evil-set-initial-state 'git-rebase-mode 'motion)

(evil-define-key 'motion git-rebase-mode-map
  "c" 'git-rebase-pick
  "r" 'git-rebase-reword
  "s" 'git-rebase-squash
  "e" 'git-rebase-edit
  "f" 'git-rebase-fixup
  "j" 'evil-next-line
  "k" 'evil-previous-line
  "y" 'git-rebase-insert
  "d" 'git-rebase-kill-line
  "u" 'git-rebase-undo
  "x" 'git-rebase-exec
  (kbd "<return>") 'git-rebase-show-commit
  "\M-n" 'git-rebase-move-line-down
  "\M-p" 'git-rebase-move-line-up)

(evil-define-key 'motion magit-commit-mode-map
  "j" 'evil-next-line
  "k" 'evil-previous-line
  "\C-c\C-b" 'magit-show-commit-backward
  "\C-c\C-f" 'magit-show-commit-forward)

(evil-define-key 'motion magit-status-mode-map
  "\C-f" 'evil-scroll-page-down
  "\C-b" 'evil-scroll-page-up
  "." 'magit-mark-item
  "=" 'magit-diff-with-mark
  "C" 'magit-add-log
  "I" 'magit-ignore-item-locally
  "S" 'magit-stage-all
  "U" 'magit-unstage-all
  "W" 'magit-toggle-whitespace
  "X" 'magit-reset-working-tree
  "d" 'magit-discard-item
  "i" 'magit-ignore-item
  "j" 'evil-next-line
  "k" 'evil-previous-line
  "s" 'magit-stage-item
  "u" 'magit-unstage-item
  "z" 'magit-stash-poup
  (kbd "TAB") 'magit-section-toggle)

(evil-define-key 'motion magit-log-mode-map
  "." 'magit-mark-item
  "=" 'magit-diff-with-mark
  "e" 'magit-log-show-more-entries
  "j" 'evil-next-line
  "k" 'evil-previous-line
  (kbd "<return>")   'magit-show-commit
  )

(evil-define-key 'motion magit-wazzup-mode-map
  "." 'magit-mark-item
  "=" 'magit-diff-with-mark
  "i" 'magit-ignore-item)

(evil-set-initial-state 'magit-branch-manager-mode 'motion)
(evil-define-key 'motion magit-branch-manager-mode-map
  "a" 'magit-add-remote
  "c" 'magit-rename-item
  "d" 'magit-discard-item
  "o" 'magit-create-branch
  "j" 'evil-next-line
  "k" 'evil-previous-line
  "v" 'magit-show-branches
  "T" 'magit-change-what-branch-tracks)

(evil-define-key 'motion magit-mode-map
  "\M-H" 'magit-show-only-files-all
  "\M-S" 'magit-show-level-4-all
  "\M-h" 'magit-show-only-files
  "\M-s" 'magit-show-level-4
  "!" 'magit-run-popup
  "$" 'magit-process
  "+" 'magit-diff-larger-hunks
  "-" 'magit-diff-smaller-hunks
  "=" 'magit-diff-default-hunks
  "/" 'evil-search-forward
  ":" 'evil-ex
  ";" 'magit-git-command
  "?" 'evil-search-backward
  "<" 'magit-stash-popup
  "A" 'magit-cherry-pick-item
  "B" 'magit-bisect-popup
  "D" 'magit-revert-item
  "E" 'magit-ediff
  "F" 'magit-pull-popup
  "G" 'evil-goto-line
  "H" 'magit-rebase-step
  "J" 'magit-am-popup
  "K" 'magit-reset
  "L" 'magit-add-change-log-entry
  "M" 'magit-remote-popup
  "N" 'evil-search-previous
  "P" 'magit-push-popup
  "Q" 'magit-quit-session
  "R" 'magit-refresh-all
  "S" 'magit-stage-all
  "U" 'magit-unstage-all
  "W" 'magit-diff-working-tree
  "X" 'magit-reset-working-tree
  "Y" 'magit-interactive-rebase
  "Z" 'magit-stash-popup
  "a" 'magit-apply-item
  "b" 'magit-branch-popup
  "c" 'magit-commit-popup
  "e" 'magit-diff-visit-file
  "f" 'magit-fetch-popup
  "g?" 'magit-describe-item
  "g$" 'evil-end-of-visual-line
  "g0" 'evil-beginning-of-visual-line
  "gE" 'evil-backward-WORD-end
  "g^" 'evil-first-non-blank-of-visual-line
  "g_" 'evil-last-non-blank
  "gd" 'evil-goto-definition
  "ge" 'evil-backward-word-end
  "gg" 'evil-goto-first-line
  "gj" 'evil-next-visual-line
  "gk" 'evil-previous-visual-line
  "gm" 'evil-middle-of-visual-line
  "h" 'magit-rewriting-popup
  "j" 'evil-next-line
  "k" 'evil-previous-line
  "l" 'magit-log-popup
  "m" 'magit-merge-popup
  "n" 'evil-search-next
  "o" 'magit-submodule-popup
  "p" 'magit-cherry
  "q" 'magit-mode-bury-buffer
  "r" 'magit-refresh
  "t" 'magit-tag-popup
  "v" 'magit-revert-item
  "w" 'magit-wazzup
  "x" 'magit-reset-head
  "y" 'magit-copy-item-as-kill
  ;z  position current line
  " " 'magit-show-item-or-scroll-up
  "\d" 'magit-show-item-or-scroll-down
  "\t" 'magit-visit-item
  (kbd "<return>")   'magit-diff
  (kbd "C-<return>") 'magit-dired-jump
  (kbd "<backtab>")  'magit-expand-collapse-section
  (kbd "C-x 4 a")    'magit-add-change-log-entry-other-window
  (kbd "\M-d") 'magit-copy-item-as-kill
  (kbd "TAB") 'magit-section-toggle)


(require 'magit)
;; Do the right things with evil
(setq-default evil-overriding-maps
              '(
                (magit-mode-map . nil)
                (magit-status-mode-map . nil)
                (magit-svn-status-mode-map . nil)
                (magit-svn-mode-map . nil)
                (magit-reflog-mode-map . nil)
                (magit-log-select-mode-map . nil)
                ; some other magit mode
                ))
(setq-default evil-motion-state-modes
              '(
                magit-mode
                magit-diff-mode
                magit-status-mode
                magit-log-mode
                magit-reflog-mode
                magit-process-mode))
(setq-default evil-insert-state-modes
              '(
                magit-log-select-mode
                diff-mode
                git-rebase-mode
                magit-popup-mode
                magit-popup-sequence-mode))

(with-eval-after-load 'magit
;  (define-key magit-mode-map "\s" nil) ;space I use space as my evil-leader key
;  (define-key magit-diff-mode-map "\s" nil) ;space
  (define-key magit-diff-mode-map "j" nil)
  (define-key magit-diff-mode-map "k" nil)

  (define-key magit-status-mode-map "j" 'next-line) ;may be should evil-next-line
  (define-key magit-mode-map "j" 'next-line)
  (define-key magit-mode-map "k" 'previous-line)
  (define-key magit-file-section-map "K" 'magit-discard)
  (define-key magit-file-section-map "k" nil)
  (define-key magit-hunk-section-map "K" 'magit-discard)
  (define-key magit-hunk-section-map "k" nil)
  (define-key magit-unstaged-section-map "k" nil)
  (define-key magit-unstaged-section-map "K" 'magit-discard)
  (define-key magit-staged-section-map "K" 'magit-discard)
  (define-key magit-staged-section-map "k" nil)
  (define-key magit-stash-section-map "K" 'magit-stash-drop)
  (define-key magit-stash-section-map "k" nil)
  (define-key magit-stashes-section-map "K" 'magit-stash-clear)
  (define-key magit-stashes-section-map "k" nil)

  (define-key magit-untracked-section-map "K" 'magit-discard)
  (define-key magit-untracked-section-map "k" nil)

  (define-key magit-branch-section-map "K" 'magit-branch-delete)
  (define-key magit-branch-section-map "k" nil)

  (define-key magit-remote-section-map "K" 'magit-remote-remove)
  (define-key magit-remote-section-map "k" nil)

  (define-key magit-tag-section-map "k" nil)
  (define-key magit-tag-section-map "K" 'magit-tag-delete))
