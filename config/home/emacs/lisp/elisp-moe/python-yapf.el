;;; python-yapf.el --- Format Python code using the yapf formatter
;;
;; Copyright (c) 2015 Moogen Tian
;;
;; Author: Moogen Tian <ibluefocus@NOSPAM.gmail.com>
;; Homepage: http://blog.galeo.me
;; url: https://github.com/galeo/python-yapf.el
;; Version: 0.0.2
;; Created: May 6 2015
;; Keywords: tools, python, yapf, pep8, formatter
;;
;;; This file is NOT part of GNU Emacs
;;
;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;; Installation:
;;
;; First, install Python Yapf package with pip:
;;
;;     pip install -U yapf
;;
;; Then, copy python-yapf.el to your load-path and add to your ~/.emacs
;;
;;     (require 'python-yapf)
;;
;; Three commands are supplied to reformat python code:
;;
;;     `python-yapf-region'
;;     `python-yapf-file'
;;     `python-yapf-directory'
;;
;; Run them interactively:
;;
;;     M-x python-yapf-* RET
;;
;; Or set any key bindings you like.
;;

;;; Code:


(defun python-yapf-revert-buffer-keep-undo (&rest -)
  "Revert buffer but keep undo history."
  (interactive)
  (let ((inhibit-read-only t))
    (clear-visited-file-modtime)
    (erase-buffer)
    (insert-file-contents (buffer-file-name))
    (set-visited-file-modtime)
    (set-buffer-modified-p nil)))

(defun python-yapf-revert-python-buffers ()
  "Refresh all opened buffers of python files."
  (interactive)
  (dolist (buf (buffer-list))
    (with-current-buffer buf
      (when (and (buffer-file-name)
                 (string-match-p "\\.pyw?$"
                                 (file-name-nondirectory (buffer-file-name)))
                 (not (buffer-modified-p)))
        (python-yapf-revert-buffer-keep-undo t t t))))
  (message "Refreshed opened python files."))


(defcustom python-yapf-command "yapf"
  "Command used to format a python file.

For further information, just check its usage help."
  :type 'string
  :group 'python)

(defcustom python-yapf-style "pep8"
  "Formatting style: either a style name (for example 'pep8' or 'google'),
or the name of a file with style settings. 'pep8' is the default."
  :type 'string
  :group 'python)

(defvar python-yapf
  (concat python-yapf-command
          " --style " python-yapf-style)
  "Python yapf command with formatting style.")


;;;###autoload
(defun python-yapf-directory (dir &optional recurse-p)
  "Search and format .py files in a directory.

All .py files within the directory will be examined, and, if RECURSE-P
is set to non-nil, subdirectories will be recursively searched.

Check `python-yapf-command' for what the format action will do."
  (interactive
   (let ((directory-name
          (ido-read-directory-name "Format directory: "))
         (recurse (y-or-n-p "Search recursively for all .py files?")))
     (list directory-name recurse)))
  (save-some-buffers (not compilation-ask-about-save) nil)
  (shell-command (concat python-yapf " --in-place "
                         (if recurse-p
                             "--recursive ")
                         dir))
  (python-yapf-revert-python-buffers)
  (message "Format files done!"))


;;;###autoload
(defun python-yapf-file (file)
  "Format a file(by default the one opened in current buffer).

Check `python-yapf-command' for what the format action will do."
  (interactive
   (let ((file-to-format
          (ido-read-file-name
           "Format file: " nil
           (if (buffer-file-name)
               (file-name-nondirectory (buffer-file-name))))))
     (list file-to-format)))
  (let* ((file-name (file-name-nondirectory file))
         (file-buffer (get-buffer file-name)))
    (save-some-buffers (not compilation-ask-about-save) nil)
    (shell-command (concat python-yapf " --in-place " file))
    (when file-buffer
      (with-current-buffer file-buffer
        (if (buffer-modified-p file-buffer)
            (python-yapf-revert-buffer-keep-undo t t t)))))
  (message "Format files done!"))


;;;###autoload
(defun python-yapf-region (beg end)
  "Format the code of the region or the buffer if no region selected."
  (interactive
   (if (or (null transient-mark-mode)
           mark-active)
       (list (region-beginning) (region-end))
     (list (point-min) (point-max))))
  (let (output
        (output-buffer "*python-yapf output*"))
    (shell-command-on-region
     beg end
     python-yapf
     output-buffer nil)
    (setq output (with-current-buffer output-buffer
                   (buffer-string)))
    (if (and output
             (not (string-match "^Traceback\\|^\\w+Error:" output)))
        (progn
          ;; no error
          (goto-char beg)
          (kill-region beg end)
          (insert output)
          (let ((window (get-buffer-window output-buffer 'visible)))
            (if window
                (delete-window window)))
          (kill-buffer output-buffer)
          (message "Code has been formatted!"))
      (message "Error occurred, please check!"))))


(provide 'python-yapf)

;;; python-yapf.el ends here
