(use-package helm
  :bind (:map helm-find-files-map
	      ("<tab>"         . helm-execute-persistent-action)
	      ("C-<backspace>" . helm-find-files-up-one-level))
  :bind (:map helm-buffer-map
	      ("<tab>"         . helm-execute-persistent-action)
	      ("C-d"         . helm-buffer-run-kill-persistent)
	      )
  )
