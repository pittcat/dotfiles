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
(setq doom-theme 'doom-solarized-dark)

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
  :config
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding))