(require 'airline-themes)
(load-theme 'airline-papercolor t)
(require 'color-theme-sanityinc-tomorrow)

(defun my-sanityinc-tomorrow-bright ()
  (interactive)
  (color-theme-sanityinc-tomorrow--define-theme bright)
  (set-face-attribute 'fringe nil :background "#333")
  (set-face-attribute 'linum nil :background "#333"))

(my-sanityinc-tomorrow-bright)
