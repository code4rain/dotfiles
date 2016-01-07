(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; 현재 수정중인 function 이름이 보이도록 
(which-function-mode 1)

(smartparens-global-mode 1)
(show-smartparens-global-mode +1)

;; show unncessary whitespace that can mess up your diff
(add-hook 'prog-mode-hook (lambda () (interactive) (setq show-trailing-whitespace 1)))

;; use tab to indent by default
(setq-default indent-tabs-mode t)

;; set appearance of a tab that is represented by 8 spaces
(setq-default tab-width 8)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
(setq-default c-default-style
      (quote
       ((c-mode . "linux")
	(c++-mode . "linux")
	(java-mode . "java")
	(awk-mode . "awk")
	(other . "gnu"))))
(setq tab-stop-list '(8 16 24 32 40 48 56 64 72 80 88 96 104 112 120))

;; Package: clean-aindent-mode
(add-hook 'prog-mode-hook 'clean-aindent-mode)

;; Package: ws-butler
(require 'ws-butler)
(add-hook 'c-mode-common-hook 'ws-butler-mode)

;; Package: yasnippet
(require 'yasnippet)
(yas-global-mode 1)

