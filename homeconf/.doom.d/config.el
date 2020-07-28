;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "pittcat"
      user-mail-address "pittcat_wenchao@163.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 20))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-zenburn)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.


;;; Code:

; 中文输入法
(setq rime-user-data-dir "~/.config/fcitx/rime")

(setq rime-posframe-properties
      (list :background-color "#333333"
            :foreground-color "#dcdccc"
            :font "WenQuanYi Micro Hei Mono-14"
            :internal-border-width 10))

(setq default-input-method "rime"
      rime-show-candidate 'posframe)


;; 英文自动补全和翻译，激活命令 toggle-company-english-helper
(use-package! company-english-helper
  :defer t
  :commands (toggle-company-english-helper)
  :init
  (map! :leader
        :prefix ("y" . "Translate")
        "M" #'toggle-company-english-helper))


(auto-save-visited-mode +1)

(use-package! auto-save-async
  :init
  (setq auto-save-async-mode 1)
  (setq auto-save-async-interval 3)
  )

;;;pangu-spacing
(use-package! pangu-spacing
  :init (setq pangu-spacing-real-insert-separtor t)
  )
;;; org-babel-python
(setq python-shell-completion-native-enable nil)


;;;eaf
(use-package eaf
  :load-path "~/.emacs.d/.local/straight/repos/emacs-application-framework"
  :custom
  (eaf-find-alternate-file-in-dired t)
  (eaf-grip-token "35925dae83c2e21b5f721a8ccbb578e5b25afc14")
  :config
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding))


(defun qiang-font-existsp (font)
  (if (null (x-list-fonts font))
      nil t))

(defun qiang-make-font-string (font-name font-size)
  (if (and (stringp font-size)
           (equal ":" (string (elt font-size 0))))
      (format "%s%s" font-name font-size)
    (format "%s-%s" font-name font-size)))

(defvar bhj-english-font-size nil)
(defun qiang-set-font (english-fonts
                       english-font-size
                       chinese-fonts
                       &optional chinese-fonts-scale
                       )
  (setq chinese-fonts-scale (or chinese-fonts-scale 1.2))
  (save-excursion
    (with-current-buffer (find-file-noselect "~/.config/system-config/emacs-font-size")
      (delete-region (point-min) (point-max))
      (insert (format "%s" english-font-size))
      (let ((before-save-hook nil)
            (after-save-hook nil))
        (save-buffer))
      (kill-buffer)))
  (setq face-font-rescale-alist `(("Microsoft Yahei" . ,chinese-fonts-scale)
                                  ("Microsoft_Yahei" . ,chinese-fonts-scale)
                                  ("微软雅黑" . ,chinese-fonts-scale)
                                  ("WenQuanYi Zen Hei" . ,chinese-fonts-scale)))
  "english-font-size could be set to \":pixelsize=18\" or a integer.
If set/leave chinese-font-size to nil, it will follow english-font-size"
  (require 'cl)                         ; for find if
  (setq bhj-english-font-size english-font-size)
  (let ((en-font (qiang-make-font-string
                  (find-if #'qiang-font-existsp english-fonts)
                  english-font-size))
        (zh-font (font-spec :family (find-if #'qiang-font-existsp chinese-fonts))))

    ;; Set the default English font
    ;;
    ;; The following 2 method cannot make the font settig work in new frames.
    ;; (set-default-font "Consolas:pixelsize=18")
    ;; (add-to-list 'default-frame-alist '(font . "Consolas:pixelsize=18"))
    ;; We have to use set-face-attribute
    (set-face-attribute
     'default nil :font en-font)
    (condition-case font-error
        (progn
          (set-face-font 'italic (font-spec :family "JetBrains Mono" :slant 'italic :weight 'normal :size (+ 0.0 english-font-size)))
          (set-face-font 'bold-italic (font-spec :family "JetBrains Mono" :slant 'italic :weight 'bold :size (+ 0.0 english-font-size)))

          (set-fontset-font t 'symbol (font-spec :family "JetBrains Mono")))
      (error nil))
    (set-fontset-font t 'symbol (font-spec :family "Unifont") nil 'append)
    (set-fontset-font t nil (font-spec :family "DejaVu Sans"))

    ;; Set Chinese font
    ;; Do not use 'unicode charset, it will cause the english font setting invalid
    (dolist (charset '(kana han cjk-misc bopomofo))
      (set-fontset-font t charset zh-font)))
  (when (and (boundp 'global-emojify-mode)
             global-emojify-mode)
    (global-emojify-mode 1))
  (shell-command-to-string "setsid sawfish-client -e '(maximize-window (input-focus))'"))


(defvar bhj-english-fonts '("JetBrains Mono" "Monaco" "Consolas" "DejaVu Sans Mono" "Monospace" "Courier New"))
(defvar bhj-chinese-fonts '("Microsoft Yahei" "Microsoft_Yahei" "微软雅黑" "文泉驿等宽微米黑" "黑体" "新宋体" "宋体"))

(qiang-set-font
 bhj-english-fonts
 (if (file-exists-p "~/.config/system-config/emacs-font-size")
     (save-excursion
       (find-file "~/.config/system-config/emacs-font-size")
       (goto-char (point-min))
       (let ((monaco-font-size (read (current-buffer))))
         (kill-buffer (current-buffer))
         (if (numberp monaco-font-size)
             monaco-font-size
           12.5)))
   12.5)
 bhj-chinese-fonts)

(defvar chinese-font-size-scale-alist nil)

;; On different platforms, I need to set different scaling rate for
;; differnt font size.
(cond
 ((and (boundp '*is-a-mac*) *is-a-mac*)
  (setq chinese-font-size-scale-alist '((10.5 . 1.3) (11.5 . 1.3) (16 . 1.3) (18 . 1.25))))
 ((and (boundp '*is-a-win*) *is-a-win*)
  (setq chinese-font-size-scale-alist '((11.5 . 1.25) (16 . 1.25))))
 (t ;; is a linux:-)
  (setq chinese-font-size-scale-alist '((12 . 1.25) (12.5 . 1.25) (14 . 1.20) (16 . 1.25) (20 . 1.20)))))

(defvar bhj-english-font-size-steps '(9 10.5 11.5 12 12.5 13 14 16 18 20 22 40))
(defun bhj-step-frame-font-size (step)
  (let ((steps bhj-english-font-size-steps)
        next-size)
    (when (< step 0)
        (setq steps (reverse bhj-english-font-size-steps)))
    (setq next-size
          (cadr (member bhj-english-font-size steps)))
    (when next-size
        (qiang-set-font bhj-english-fonts next-size bhj-chinese-fonts (cdr (assoc next-size chinese-font-size-scale-alist)))
        (message "Your font size is set to %.1f" next-size))))

(global-set-key [(control x) (meta -)] (lambda () (interactive) (bhj-step-frame-font-size -1)))
(global-set-key [(control x) (meta +)] (lambda () (interactive) (bhj-step-frame-font-size 1)))

(set-face-attribute 'default nil :font (font-spec))

;; {%org-mode%}
;; here are 20 hanzi and 40 english chars, see if they are the same width
;; 你你你你你你你你你你你你你你你你你你你你
;; aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
;; /aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/
;; {%/org-mode%}
