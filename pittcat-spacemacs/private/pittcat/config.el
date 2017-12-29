  ;; auto-save
  (defun leave-insert-save ()
    (if (buffer-file-name)
        (progn
          (save-buffer)
          )
      (Message "no file is associated to this buffer: do nothing")
      )
    )
  (add-hook 'evil-insert-state-exit-hook 'leave-insert-save)

  ;; org-mode
  ;; delele comfirm
  (setq org-confirm-babel-evaluate nil)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     ; (shell . t)
     (emacs-lisp . t)
     (calc . t)
     ))



