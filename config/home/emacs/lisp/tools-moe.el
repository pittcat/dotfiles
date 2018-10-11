(require 'helpful)
(require 'multiple-cursors)

;; youdaodict
;; Enable Cache
(setq url-automatic-caching t)
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point)

(require 'google-this)
(evil-leader/set-key
  ;; emacs-google-this
  "go" 'google-this-mode-submap
  )
(provide 'tools-moe)


;;helpful
(global-set-key (kbd "C-h f") #'helpful-callable)

(global-set-key (kbd "C-h v") #'helpful-variable)
(global-set-key (kbd "C-h k") #'helpful-key)

;;avy
(global-set-key (kbd "C-=") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "C-,") 'avy-goto-word-1)

;;multiple-cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)


;; fcitx
(fcitx-aggressive-setup)
(setq fcitx-use-dbus t)
