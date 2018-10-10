;;; shebang.el --- Emacs package which helps insert shebang

;; Copyright (C) 2014 Andrey Tykhonov <atykhonov@gmail.com>

;; Author: Andrey Tykhonov <atykhonov@gmail.com>
;; URL: https://github.com/atykhonov/emacs-shebang
;; Version: 0.2.0
;; Keywords: convenience

;; This file is NOT part of GNU Emacs.

;; This is free software; you can redistribute it and/or modify it
;; under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Installation:

;; Assuming that the file `shebang.el' is somewhere on the load path,
;; add the following lines to your `.emacs' file:
;;
;; (require 'shebang)
;; (global-set-key "\C-c b i" 'shebang-insert)
;; (global-set-key "\C-c b I" 'shebang-insert-at-point)
;;
;;  Change the key bindings to your liking.
;;

;;; Commentary:

;;
;; `shebang-insert' queries for a command and inserts shebang line for
;; it. Shebang inserts at the beginning of buffer.
;;
;; For example an execution of such command:
;;
;; M-x shebang-insert RET python RET
;;
;; will insert at the beginning of buffer shebang line like:
;;
;; #!/usr/bin/python
;;
;; With a `C-u' frefix `shebang-insert' queries for a command and
;; insert shebang line for `env' and a command. `env' is a programm
;; from GNU Coreutils (sample location: /usr/bin/env).
;;
;; As example an execution of such command:
;;
;; C-u M-x shebang-insert RET perl RET
;;
;; will insert at the beginning of buffer shebang line like:
;; 
;; #!/usr/bin/env perl
;;

;;; Code:

;; shebang for command

(defun shebang-for-command--insert (command)
  "Insert at point shebang line for COMMAND."
  (insert (shebang--for-command command)))

(defun shebang-for-command-insert-at-point (command)
  "Insert at point shebang line for COMMAND."
  (interactive "sCommand: ")
  (shebang-for-command--insert command))

(defun shebang-for-command-insert (command)
  "Insert at the beginning of buffer shebang line for COMMAND."
  (interactive "sCommand: ")
  (shebang--goto-beginning-of-buffer)
  (shebang-for-command--insert command))

;; shebang for env with command

(defun shebang-for-env-with-command--insert (command)
  "Insert at point shebang line for `env' with parameter COMMAND."
  (insert (shebang--for-command "env" command)))t

(defun shebang-for-env-with-command-insert-at-point (command)
  "Insert at point shebang line for `env' with parameter COMMAND."
  (interactive "sCommand: ")
  (shebang-for-env-with-command--insert command))

(defun shebang-for-env-with-command-insert (command)
  "Insert at the beginning of buffer shebang line for `env' with
parameter COMMAND."
  (interactive "sCommand: ")
  (shebang--goto-beginning-of-buffer)
  (shebang-for-env-with-command--insert command))

;; common functions

(defun trim-string (string)
  "Remove white spaces in beginning and ending of STRING.
  White space here is any of: space, tab, emacs newline (line
  feed, ASCII 10)."
  (replace-regexp-in-string "\\`[ \t\n\r]*" ""
                            (replace-regexp-in-string "[ \t\n\r]*\\'"
                                                      ""
                                                      string)))

(defun shebang--which (command)
  "Return the full path of COMMAND."
  (let ((buffer-name " *Shebang Output*") (exit-status) (output))
    (with-current-buffer (get-buffer-create buffer-name)
      (erase-buffer)
      (setq exit-status
            (call-process "which" nil buffer-name nil command))
        (setq output (trim-string (buffer-string)))
        (kill-buffer))
    (if (equal exit-status 0)
        output
      (error "Shebang error: %s" output))))

(defun shebang--for-command (command &optional parameters)
  "Return shebang line with COMMAND with its PARAMETERS."
  (let ((command-path (shebang--which command)))
    (shebang--format command-path parameters)))

(defun shebang--format (command &optional parameters)
  "Format shebang line with COMMAND and its PARAMETERS."
  (format "#!%s%s"
          command
          (if parameters
              (format " %s" parameters)
            "")))

(defun shebang--goto-beginning-of-buffer ()
  (goto-char (point-min)))

;; auto loads

;;;###autoload
(defun shebang-insert-at-point (override-p)
  "Insert at point shebang line for command about which you'll be queried.

With a `C-u' prefix argument, insert at point shebang line for
`env' with parameter COMMAND."
  (interactive "P")
  (if override-p
      (call-interactively 'shebang-for-env-with-command-insert)
    (call-interactively 'shebang-for-command-insert)))

;;;###autoload
(defun shebang-insert (override-p)
  "Insert at the beginning of buffer shebang line for command about which you'll be queried.

With a `C-u' prefix argument, insert shebang line for `env' with
parameter COMMAND."
  (interactive "P")
  (shebang--goto-beginning-of-buffer)
  (call-interactively shebang-insert-at-point))

;;

(provide 'shebang)

;;; shebang.el ends here
