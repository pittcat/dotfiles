(require 'company-irony-c-headers)
(require 'company-irony)
(require 'irony)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))



;; irony
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;;company-irony
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; company-irony-c-headers
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

; style I want to use in c++ mode
(c-add-style "moe-style" 
	     '("stroustrup"
	       (indent-tabs-mode . nil)        ; use spaces rather than tabs
	       (c-basic-offset . 4)            ; indent by four spaces
	       (c-offsets-alist . ((inline-open . 0)  ; custom indentation rules
				   (brace-list-open . 0)
				   (statement-case-open . +)))))

(defun moe-c++-mode-hook ()
  (c-set-style "moe-style")        ; use moe-style defined above
  (auto-fill-mode)         
  (c-toggle-auto-hungry-state 1))

(add-hook 'c++-mode-hook 'moe-c++-mode-hook)



(provide 'cc-moe)
