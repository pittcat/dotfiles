;;vim
;;evil
(require 'evil-leader)
(evil-mode 1)
(global-evil-leader-mode)
;;Evil-leader
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "ff" 'helm-find-files
  "bb" 'helm-mini
  "bk" 'kill-buffer
  "bd" 'kill-this-buffer
  "bn" 'next-buffer
  "bp" 'previous-buffer
  "qr" 'restart-emacs
  "ci" 'evilnc-comment-or-uncomment-lines
  "fs" 'full-auto-save
  "qq" 'save-buffers-kill-emacs
  "sq" '  (lambda () (interactive) (save-some-buffers t) (kill-emacs))
  "<up>" 'windmove-up
  "<down>" 'windmove-down
  "<left>" 'windmove-left
  "<right>" 'windmove-right
  "wd" 'delete-window
  "ws" 'split-window-below
  "w2" 'split-window-horizontally
  "wv" 'split-window-horizontally
  "s/" 'helm-do-ag-this-file
  "ag" 'helm-ag
  "ss" 'helm-swoop
  "or" 'helm-org-rifle
  "fei" (lambda () (interactive) (find-file "~/.emacs.d/init.el"))
  "fec" (lambda () (interactive) (find-file "~/.emacs.d/Cask"))
  "<SPC>" 'helm-M-x
  "df" 'delete-file-and-buffer
  "hi" 'helm-imenu
  "rn" 'rename-file-and-buffer
  "ap" 'pittcat-copy-file-path
  ;;lsp
  "cn" 'lsp-rename
  ;;flycheck
  "el" 'helm-flycheck
  "en" 'flycheck-next-error
  "ep" 'flycheck-previous-error
  "ed" 'flycheck-explain-error-at-point
  ;;avy
  )
;; escape
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map (kbd "ESC ESC") (kbd "C-g"))
(define-key evil-normal-state-map (kbd "ESC ESC") (kbd "C-g"))
(define-key evil-normal-state-map (kbd "Q") 'delete-window)
(define-key evil-visual-state-map (kbd "Q") 'delete-windows)
(define-key evil-insert-state-map (kbd "C-v") 'x-clipboard-yank)
;; evil-surround
(global-evil-surround-mode 1)
;; evil-visualstar
(global-evil-visualstar-mode)

;; evil-quickscope
(global-evil-quickscope-mode 1)
;; evil
(define-key evil-normal-state-map (kbd "S-<left>")
  (lambda ()
    (interactive)
    (evil-visual-char)
    (backward-char)))
(define-key evil-normal-state-map (kbd "S-<right>") 
  (lambda ()
    (interactive)
    (evil-visual-char)
    (forward-char)))
(define-key evil-visual-state-map (kbd "S-<left>")

  #'backward-char)
(define-key evil-visual-state-map (kbd "S-<right>") 
  #'forward-char)

(defun evil-unimpaired/paste-below ()
  (interactive)
  (evil-insert-newline-below)
  (evil-paste-after 1))

(defun evil-unimpaired/paste-above ()
  (interactive)
  (evil-insert-newline-above)
  (evil-paste-after 1))

(define-key evil-normal-state-map (kbd "[ p") 'evil-unimpaired/paste-above)
(define-key evil-normal-state-map (kbd "] p") 'evil-unimpaired/paste-below)

(defun evil-unimpaired/insert-space-above (count)
  (interactive "p")
  (dotimes (_ count) (save-excursion (evil-insert-newline-above))))

(defun evil-unimpaired/insert-space-below (count)
  (interactive "p")
  (dotimes (_ count) (save-excursion (evil-insert-newline-below))))

(define-key evil-normal-state-map (kbd "[ SPC")
  'evil-unimpaired/insert-space-above)
(define-key evil-normal-state-map (kbd "] SPC")
  'evil-unimpaired/insert-space-below)


(defun pittcat-copy-file-path (&optional @dir-path-only-p)
  (interactive "P")
  (let (($fpath
         (if (string-equal major-mode 'dired-mode)
             (progn
               (let (($result (mapconcat 'identity (dired-get-marked-files) "\n")))
                 (if (equal (length $result) 0)
                     (progn default-directory )
                   (progn $result))))
           (if (buffer-file-name)
               (buffer-file-name)
             (expand-file-name default-directory)))))
    (kill-new
     (if @dir-path-only-p
         (progn
           (message "Directory path copied: 「%s」" (file-name-directory $fpath))
           (file-name-directory $fpath))
       (progn
         (message "File path copied: 「%s」" $fpath)
         $fpath )))))


(provide 'evil-mode-moe)
