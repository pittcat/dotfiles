(require 'helpful)

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

;; fcitx
(fcitx-aggressive-setup)
(setq fcitx-use-dbus t)
