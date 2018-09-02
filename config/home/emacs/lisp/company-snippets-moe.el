(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
     (define-key company-active-map (kbd "<tab>") 'company-complete-common-or-cycle)))

(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "S-TAB") 'company-select-previous)
     (define-key company-active-map (kbd "<backtab>") 'company-select-previous)))
;;company
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.5)
(setq company-minimum-prefix-length 2)
(setq company-ddabbrev-code-everywhere t)
(setq company-dabbrev-code-modes t)
(setq company-dabbrev-code-other-buffers 'all)
(setq company-dabbrev-ignore-buffers "\\`\\'")

;; yasnippet

(require 'yasnippet)
(yas-reload-all)

(add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'company-snippets-moe)
