(require 'cask "~/.cask/cask.el")
(cask-initialize)
(init-loader-load "~/.emacs.d/init-loader/")

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet web-mode use-package smex smartparens projectile prodigy popwin pallet nyan-mode multiple-cursors magit init-loader idle-highlight-mode htmlize helm-gtags flycheck-cask expand-region exec-path-from-shell evil drag-stuff company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
