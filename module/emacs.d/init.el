(require 'cask "~/.cask/cask.el")
(cask-initialize)
(setq init-loader-show-log-after-init nil)
(setq init-loader-byte-compile t)
(init-loader-load "~/.emacs.d/init-loader/")

(prefer-coding-system 'utf-8)

(set-face-bold-p 'bold nil)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#1d1f21"))
 '(c-default-style
   (quote
    ((c-mode . "linux")
     (c++-mode . "linux")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(cua-mode t nil (cua-base))
 '(current-language-environment "Korean")
 '(custom-safe-themes
   (quote
    ("94ba29363bfb7e06105f68d72b268f85981f7fba2ddef89331660033101eb5e5" default)))
 '(default-input-method "korean-hangul")
 '(fci-rule-color "#373b41")
 '(global-semantic-decoration-mode t)
 '(global-semanticdb-minor-mode t)
 '(package-selected-packages
   (quote
    (yasnippet web-mode use-package smex smartparens projectile prodigy popwin pallet nyan-mode multiple-cursors magit init-loader idle-highlight-mode htmlize helm-gtags flycheck-cask expand-region exec-path-from-shell evil drag-stuff company)))
 '(show-paren-mode t)
 '(tab-width 8)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight ((t (:background "DeepSkyBlue4"))))
 '(semantic-decoration-on-unknown-includes ((t (:foreground "red")))))
