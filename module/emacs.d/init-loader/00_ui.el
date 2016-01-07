;; highlighted
(global-hl-line-mode 1)
;; 화면 왼쪽에 라인넘버 표시
(global-linum-mode t)
(setq-default linum-format "%4d  ")

;; 선택 영역 표시
(transient-mark-mode t)

;; 대응하는 괄호 표시
(show-paren-mode t)
(require 'smartparens-config)
(show-smartparens-global-mode t)
(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)

;;Color!!
;;(require 'color-identifiers-mode)
;;(add-hook 'after-init-hook 'global-color-identifiers-mode)

;; Set default line spcaing 
(setq-default line-spacing 3)

;;(setq-default indicate-empty-lines t)
;;(when (not indicate-empty-lines)
;;  (toggle-indicate-empty-lines))

;; Powerline status bar사용
(require 'powerline)
(powerline-center-evil-theme)
