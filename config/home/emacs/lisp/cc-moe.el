(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

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
