(require 'evil)
(evil-mode t)

(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)

(setq evil-auto-indent t)
(setq evil-shift-width 8)
(setq evil-search-wrap nil)
