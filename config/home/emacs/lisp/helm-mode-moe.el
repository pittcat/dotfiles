;; helm and async
(require 'helm)
(require 'helm-config)
(autoload 'dired-async-mode "dired-async.el" nil t)
(dired-async-mode 1)
(async-bytecomp-package-mode 1)

(setq helm-follow-mode-persistent nil)
(helm-mode 1)
(setq helm-recentf-fuzzy-match 1)
(setq helm-buffers-fuzzy-matching 1)
(setq helm-completion-in-region-fuzzy-match 1)
(setq helm-M-x-fuzzy-match 1)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(add-hook 'helm-after-initialize-hook
          (lambda()
            (define-key helm-map (kbd "ESC") 'helm-keyboard-quit)
            (define-key helm-buffer-map (kbd "ESC") 'helm-keyboard-quit)
            (define-key helm-find-files-map (kbd "ESC") 'helm-keyboard-quit)
	    ))
;; Helm-swoop
;; Change the keybinds to whatever you like :)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)
;; Disable pre-input
(setq helm-swoop-pre-input-function
      (lambda () ""))
(setq helm-swoop-use-fuzzy-match t)
(global-set-key (kbd "M-d") #'helm-describe-modes)

(provide 'helm-mode-moe)
