(require 'company-english-helper)
;;company
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0.5)
(setq company-minimum-prefix-length 2)
(setq company-ddabbrev-code-everywhere t)
(setq company-dabbrev-code-modes t)
(setq company-dabbrev-code-other-buffers 'all)
(setq company-dabbrev-ignore-buffers "\\`\\'")

;; yasnippet
(require 'company)
(require 'yasnippet)
(yas-reload-all)

(add-hook 'prog-mode-hook #'yas-minor-mode)

;;snippets-show-popup
(defun autocomplete-show-snippets ()
"Show snippets in autocomplete popup."
(let ((backend (car company-backends)))
  (unless (listp backend)
    (setcar company-backends `(,backend :with company-yasnippet company-files)))))

;; See http://www.gnu.org/software/emacs/manual/html_node/emacs/Hooks.html
;; for what this line means
(add-hook 'after-change-major-mode-hook 'autocomplete-show-snippets)


(defvar company-mode/enable-yas t
  "Enable yasnippet for all backends.")

(provide 'company-snippets-moe)
