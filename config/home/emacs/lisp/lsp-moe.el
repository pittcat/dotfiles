(require 'lsp-mode)
(require 'lsp-ui)
(require 'lsp-python)
;; (require 'ccls)
(require 'lsp-clangd)
(require 'company-lsp)
(require 'lsp-ui)



(setq lsp-message-project-root-warning t)

(require 'lsp-imenu)
(add-hook 'lsp-after-open-hook 'lsp-enable-imenu)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(setq-default lsp-ui-doc-frame-parameters
            '((left . -1)
              (top . -1)
              (no-accept-focus . t)
              (min-width . 0)
              (width . 0)
              (min-height . 0)
              (height . 0)
              (internal-border-width . 5)
              (vertical-scroll-bars)
              (horizontal-scroll-bars)
              (left-fringe . 0)
              (right-fringe . 0)
              (menu-bar-lines . 0)
              (tool-bar-lines . 0)
              (line-spacing . 0.1)
              (unsplittable . t)
              (undecorated . t)
              (minibuffer . nil)
              (visibility . nil)
              (mouse-wheel-frame . nil)
              (no-other-frame . t)
              (cursor-type)
              (no-special-glyphs . t)))
(setq lsp-ui-sideline-enable nil
    lsp-enable-completion-at-point t
    lsp-ui-flycheck-enable nil
    lsp-ui-doc-position 'at-point
    lsp-ui-doc-header nil
    lsp-ui-doc-enable nil
    lsp-ui-doc-include-signature nil
    )

(define-key evil-normal-state-map (kbd "gd") 'xref-find-definitions)
(global-set-key (kbd "M-?") 'xref-find-references)


(push 'company-lsp company-backends)

;;lsp-python
(add-hook 'python-mode-hook #'lsp-python-enable)

;;ccls
;; (setq ccls-executable "/usr/bin/ccls")
;; (with-eval-after-load 'projectile
;;   (setq projectile-project-root-files-top-down-recurring
;;         (append '("compile_commands.json"
;;                   ".ccls")
;;                 projectile-project-root-files-top-down-recurring)))

;; (defun ccls//enable ()
;;   (condition-case nil
;;       (lsp-ccls-enable)
;;     (user-error nil)))

;; (add-hook 'c-mode-hook #'ccls//enable)
;; (add-hook 'c++-mode-hook #'ccls//enable)
;; (setq ccls-extra-init-params '(:completion (:detailedLabel t)))

;;lsp-clangd
(setq lsp-clangd-executable "/usr/bin/clangd")
(add-hook 'c-mode-hook #'lsp-clangd-c-enable)
(add-hook 'c++-mode-hook #'lsp-clangd-c++-enable)


(provide 'lsp-moe)
