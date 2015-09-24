(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(require 'cc-mode)
(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  [(C-n)] 'company-complete)
(define-key c++-mode-map  [(C-n)] 'company-complete)
(defun indent-or-complete ()
    (interactive)
    (if (looking-at "\\_>")
        (company-complete-common)
      (indent-according-to-mode)))

(add-to-list 'company-backends 'company-c-headers)
 (defun check-expansion ()
    (save-excursion
      (if (looking-at "\\_>") t
        (backward-char 1)
        (if (looking-at "\\.") t
          (backward-char 1)
          (if (looking-at "->") t nil)))))

  (defun do-yas-expand ()
    (let ((yas/fallback-behavior 'return-nil))
      (yas/expand)))

  (defun tab-indent-or-complete ()
    (interactive)
    (if (minibufferp)
        (minibuffer-complete)
      (if (or (not yas/minor-mode)
              (null (do-yas-expand)))
          (if (check-expansion)
              (company-complete-common)
            (indent-for-tab-command)))))

  (global-set-key [tab] 'tab-indent-or-complete)
