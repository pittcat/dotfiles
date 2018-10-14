;;
;;
;;
;;yapfify
(require 'yapfify)
(require 'anaconda-mode)
(add-hook 'python-mode-hook 'yapf-mode)
(remove-hook 'before-save-hook 'yapfify-buffer nil)

;; company-anaconda
(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))

;;anaconda-mode
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(setq python-shell-interpreter "/usr/bin/python3")



(add-hook 'python-mode-hook
	    (lambda ()
		    (setq-default indent-tabs-mode t)
		    (setq-default tab-width 4)
		    (setq-default py-indent-tabs-mode t)
	    (add-to-list 'write-file-functions 'delete-trailing-whitespace)))


(provide 'python-moe)
