(require 'org-download)
;; org-mode
(global-set-key (kbd "C-x p i") 'org-cliplink)
(global-set-key (kbd "C-SPC") 'nil)

;;org-down
(setq-default org-download-image-dir "./Resources/")
(add-hook 'dired-mode-hook 'org-download-enable)

;;show-img
;; -- Display images in org mode
;; enable image mode first
(iimage-mode)
;; add the org file link format to the iimage mode regex
(add-to-list 'iimage-mode-image-regex-alist
  (cons (concat "\\[\\[file:\\(~?" iimage-mode-image-filename-regex "\\)\\]")  1))
;;  add a hook so we can display images on load
(add-hook 'org-mode-hook '(lambda () (org-turn-on-iimage-in-org)))
;; function to setup images for display on load
(defun org-turn-on-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (turn-on-iimage-mode)
  (set-face-underline-p 'org-link nil))
;; function to toggle images in a org bugger
(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
      (set-face-underline-p 'org-link t))
  (call-interactively 'iimage-mode))

(setq org-image-actual-width (/ (display-pixel-width) 3))

(provide 'pittcat-org-moe)
