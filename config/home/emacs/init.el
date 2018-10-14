(require 'cask "~/.cask/cask.el")
(cask-initialize)

(setq default-directory "~/.emacs.d/")
(add-to-list 'load-path (expand-file-name "./lisp/" default-directory))
(add-to-list 'load-path (expand-file-name "./lisp/elisp-moe/" default-directory))

(require 'appearance-moe)
(require 'company-snippets-moe)
(require 'helm-mode-moe)
(require 'evil-mode-moe)
(require 'pittcat-org-moe)
(require 'better-default-moe)
(require 'tools-moe)
(require 'lsp-moe)
(require 'python-moe)
(require 'cc-moe)
(require 'flycheck-moe)
(require 'programming-moe)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
