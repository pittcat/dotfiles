;;appearance
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; set font size
(set-face-attribute 'default nil :height 135)

; theme settings
;; Global settings (defaults)
;; (load-theme 'doom-one t)
;; (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;       doom-themes-enable-italic t) ; if nil, italics is universally disabled
;; (remove-hook 'doom-init-ui-hook #'blink-cursor-mode)
;; (doom-themes-org-config)

;; ; moe
(require 'moe-theme)
;; ;; Show highlighted buffer-id as decoration. (Default: nil)
(setq moe-theme-highlight-buffer-id t)

;; ;; Resize titles (optional).
(setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))
(setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
(setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))

;; ;; Choose a color for mode-line.(Default: blue)
(moe-theme-set-color 'cyan)

(load-theme 'moe-dark t)


; dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "Happy Hacking")
(setq dashboard-startup-banner 'official)
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (registers . 5)))
(setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))

;; hlinum
(require 'hlinum)
(hlinum-activate)
(add-hook 'after-init-hook 'linum-mode)

(provide 'appearance-moe)
