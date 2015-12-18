(require 'sr-speedbar)

;; speedbar를 창 왼쪽에 띄운다.
(setq sr-speedbar-right-side nil)
;; 파일목록 자동 갱신
(setq sr-speedbar-auto-refresh t)

;; speedbar 토글. speedbar가 뜨면 포커스를 speedbar로 이동.
(defun my-speedbar ()
  "Toggle sr-speedbar and select"
  (interactive)
  (progn
    (sr-speedbar-toggle)
    (if (sr-speedbar-exist-p)
        (sr-speedbar-select-window))))

;; 단축키 M-l
(global-set-key (kbd "M-l") 'my-speedbar)
