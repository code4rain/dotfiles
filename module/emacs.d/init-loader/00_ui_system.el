;; In every buffer, the line which contains the cursor will be fully
;; highlighted

(global-hl-line-mode 1)
;; 화면 왼쪽에 라인넘버 표시
(global-linum-mode t)

;(setq linum-format "%4d  ")
;; 선택 영역 표시
(transient-mark-mode t)

;; 튜토리얼 메시지 없애기
(setq inhibit-startup-message t)
;; 대응하는 괄호 표시
(show-paren-mode t)

;;Color!!
(require 'color-identifiers-mode)
(add-hook 'after-init-hook 'global-color-identifiers-mode)

;(custom-set-variables
; ;; custom-set-variables was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; '(current-language-environment "Korean")
; '(default-input-method "korean-hangul"))
;(custom-set-faces
; ;; custom-set-faces was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; '(default ((t (:family #("nanumgothiccoding" 0 6 (charset cp949)) :foundry "outline" :slant normal :weight normal :height 113 :width normal))))
; '(cursor ((t (:background "firebrick")))))
(setq-default line-spacing 3)
;;
(set-language-environment "Korean")

(setq-default indicate-empty-lines t)
(when (not indicate-empty-lines)
  (toggle-indicate-empty-lines))
;;
(prefer-coding-system 'utf-8)
;;
(defalias 'yes-or-no-p 'y-or-n-p)

;==============================================================================
;; 최근 열었던 파일 가져오기
;==============================================================================

(require 'saveplace)
;(if (fboundp #'save-place-mode)
;  (save-place-mode +1)
(setq-default save-place t);)
(setq save-place-file "~/.emacs.d/saved-places")
(setq save-place-forget-unreadable-files t)

;; wheel - font size
(global-set-key [C-mouse-4] '(lambda () (interactive) (text-scale-increase 1)))
(global-set-key [C-mouse-5] '(lambda () (interactive) (text-scale-decrease 1)))

;;(recentf-mode 1)
;;(setq recentf-max-saved-items 1200)
;; 제외할 파일
;;(add-to-list 'recentf-exclude "Temporary Internet Files")
;; 자동 저장기능 활성화
;;(setq recentf-auto-save-timer
;;  (run-with-idle-timer 30 t 'recentf-save-list))
;;(global-set-key [f12] 'recentf-open-files)
;; 탭키를 이용하여 최근 파일명 완성하기
;;(defun recentf-open-files-compl ()
;;  (interactive)
;;  (let* ((all-files recentf-list)
;;      (tocpl (mapcar (function
;;          (lambda (x) (cons (file-name-nondirectory x) x))) all-files))
;;      (prompt (append '("File name: ") tocpl))
;;    (fname (completing-read (car prompt) (cdr prompt) nil nil)))
;;    (find-file (cdr (assoc-string fname tocpl nil)))))
;;
;;(global-set-key "\C-c\C-r" 'recentf-open-files-compl)

(require 'powerline)
(powerline-center-evil-theme)

(which-function-mode 1)
(require 'smartparens-config)
(smartparens-global-mode 1)
(show-smartparens-global-mode +1)
(add-hook 'smartparens-enabled-hook #'evil-smartparens-mode)
 ;; Package smartparens
;; when you press RET, the curly braces automatically
;; add another newline
(sp-with-modes '(c-mode c++-mode)
  (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
  (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
                                            ("* ||\n[i]" "RET"))))

(add-hook 'c-mode-common-hook   'hs-minor-mode)

(setq mouse-wheel-scroll-amount '(3 ((shift) . 3) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)
;(global-set-key (kbd "RET") 'newline-and-indent)  ; automatically indent when press RET
;; activate whitespace-mode to view all whitespace characters
(global-set-key (kbd "C-m w") 'whitespace-mode)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use space to indent by default
(setq-default indent-tabs-mode nil)

;; set appearance of a tab that is represented by 8 spaces
(setq-default tab-width 8)
(setq tab-stop-list '(8 16 24 32 40 48 56 64 72 80 88 96 104 112 120))

;; Package: clean-aindent-mode
(require 'clean-aindent-mode)
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Package: dtrt-indent
(require 'dtrt-indent)
(dtrt-indent-mode 1)
;(setq dtrt-indent-verbosity 0)

;; Package: ws-butler
(require 'ws-butler)
(add-hook 'c-mode-common-hook 'ws-butler-mode)

;; Package: yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Smooth Scroll
(setq scroll-margin 5
scroll-conservatively 9999
scroll-step 1)

;;(defun my-c-mode-hook ()
;;  "This is setting for the C/C++ mode"
;;  (message "my-c-mode-hook executed")
;;  (setq tab-width 8)
;;  (setq indent-tabs-mode t)
;;  (c-set-style "linux")
;;)
;;(add-hook 'c-mode-hook 'my-c-mode-hook)

;; Dont make backup file
(setq make-backup-files nil)

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

(eval-after-load "dash" '(dash-enable-font-lock))

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
