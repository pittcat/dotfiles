(require 'awesome-tab)
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


(require 'super-save)
(super-save-mode +1)


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



(setq exec-path-from-shell-check-startup-files nil) ;
(setq exec-path-from-shell-arguments '("-l" )) ;remove -i read form .zshenv
(defun exec-path-from-shell-setenv (name value)
  "Set the value of environment var NAME to VALUE.
Additionally, if NAME is \"PATH\" then also set corresponding
variables such as `exec-path'."
  (setenv name value)
  (when (string-equal "PATH" name)
    (setq eshell-path-env value
          exec-path (append (parse-colon-path value) (list exec-directory)))))
;;调用exec-path-from-shell-setenv，手动传入参数，每次修改PATH都要到这里修改一下。
(exec-path-from-shell-setenv "PATH" "/home/pittcat/.rbenv/shims:/home/pittcat/.rbenv/bin:/home/pittcat/.autojump/bin:/home/pittcat/.miniconda/bin:/home/pittcat/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/pittcat/.fzf/bin:/home/pittcat/.local/bin:/home/pittcat/.npm-global/bin:/home/pittcat/.cargo/bin:/home/pittcat/.rbenv/bin:/home/pittcat/.go/bin:/home/pittcat/.cask/bin:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/lib:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/archlinux:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/git:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/autojump:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/extract:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/tmux:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/sudo:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/copydir:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/command-not-found:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/copyfile:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/python:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/pip:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/npm:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/ruby:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/rbenv:/home/pittcat/.antigen/bundles/robbyrussell/oh-my-zsh/plugins/gem:/home/pittcat/.antigen/bundles/zsh-users/zsh-autosuggestions:/home/pittcat/.antigen/bundles/zsh-users/zsh-completions:/home/pittcat/.antigen/bundles/zsh-users/zsh-syntax-highlighting:/home/pittcat/.antigen/bundles/changyuheng/zsh-interactive-cd:/home/pittcat/.antigen/bundles/hlissner/zsh-autopair:/home/pittcat/.antigen/bundles/Tarrasch/zsh-bd:/home/pittcat/.antigen/bundles/djui/alias-tips:/home/pittcat/.antigen/bundles/gangleri/pipenv:/home/pittcat/.antigen/bundles/hoffi/zsh-theme-lambda")

(exec-path-from-shell-initialize)


;;awesome-tab
(awesome-tab-mode t)

(provide 'better-default-moe)


