
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


