;;
;;
;;
;;yapfify
(require 'yapfify)
(add-hook 'python-mode-hook 'yapf-mode)
(remove-hook 'before-save-hook 'yapfify-buffer nil)

(add-hook 'python-mode-hook
	    (lambda ()
		    (setq-default indent-tabs-mode t)
		    (setq-default tab-width 4)
		    (setq-default py-indent-tabs-mode t)
	    (add-to-list 'write-file-functions 'delete-trailing-whitespace)))


(provide 'python-moe)
