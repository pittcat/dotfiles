;;turn down voice
(setq visible-bell t)

(defun full-auto-save ()
  (interactive)
  (save-excursion
    (dolist (buf (buffer-list))
      (set-buffer buf)
      (if (and (buffer-file-name) (buffer-modified-p))
          (basic-save-buffer)))))
(add-hook 'auto-save-hook 'full-auto-save)

(global-set-key (kbd "C-q") (lambda () (interactive) (save-some-buffers t) (kill-emacs)))
(defun full-save-quit () (interactive) (save-some-buffers t))

(require 'real-auto-save)
(add-hook 'prog-mode-hook 'real-auto-save-mode)
(setq real-auto-save-interval 20)
;;restart
(setq restart-emacs-restore-frames t)


;; which-key
(which-key-mode)
(which-key-setup-side-window-bottom)
(setq which-key-popup-type 'minibuffer)

;; auto-pair
(autopair-global-mode) ;; enable autopair in all buffers
;; remember cursor position, for emacs 25.1 or later
(save-place-mode 1)

;; bakcup
(setq backup-directory-alist
      `((".*" . ,"~/.emacs.d/.backup")))

(setq auto-save-file-name-transforms
	`((".*" ,"~/.emacs.d/.backup" t)))

;; self-function
(defun delete-file-and-buffer ()
  "Kill the current buffer and deletes the file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
      (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))

;; hungry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)
;; highlight-indentation
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
;; neotree
(require 'neotree)
(global-set-key [f4] 'neotree-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)


;; soft-link
(setq vc-follow-symlinks t)

;; rainbow-delimiters-mode
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

;; startup folder
(setq default-directory "~/" )

;; undo-tree

(global-undo-tree-mode)
(defun undo-tree-split-side-by-side (original-function &rest args)
  "Split undo-tree side-by-side"
  (let ((split-height-threshold nil)
        (split-width-threshold 0))
    (apply original-function args)))

(advice-add 'undo-tree-visualize :around #'undo-tree-split-side-by-side)
(define-key key-translation-map (kbd "<f2>") (kbd "C-x u"))


(evil-leader/set-key
  "ft" 'neotree-toggle
  )

; projectile
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)



(provide 'better-default-moe)


