;; -----------pittcat/run-current-file-------------------
(defun pittcat/run-current-file ()
  "Execute the current file.
For example, if the current buffer is the file x.py, then it'll call「python x.py」in a shell.
The file can be Emacs Lisp, PHP, Perl, Python, Ruby, JavaScript, Bash, Ocaml, Visual Basic, TeX, Java, Clojure.
File suffix is used to determine what program to run.

If the file is modified or not saved, save it automatically before run.

URL `http://ergoemacs.org/emacs/elisp_run_current_file.html'
version 2016-01-28"
  (interactive)
  (let (
        (-suffix-map
         ;; (‹extension› . ‹shell program name›)
         `(
           ;; ("php" . "php")
           ;; ("pl" . "perl")
           ("py" . "python3")
           ;; ("rb" . "ruby")
           ;; ("go" . "go run")
           ;; ("js" . "node") ; node.js
           ;; ("sh" . "bash")
           ;; ("clj" . "java -cp /home/xah/apps/clojure-1.6.0/clojure-1.6.0.jar clojure.main")
           ;; ("rkt" . "racket")
           ;; ("ml" . "ocaml")
           ;; ("vbs" . "cscript")
           ;; ("tex" . "pdflatex")
           ;; ("latex" . "pdflatex")
           ;; ("java" . "javac")
           ;; ("cpp" . ,(or (executable-find "myclang")
           ;;               (executable-find "clang")
                         ;; "g++"))
           ;; ("pov" . "/usr/local/bin/povray +R2 +A0.1 +J1.2 +Am2 +Q9 +H480 +W640")
           ))

        -fname
        -fSuffix
        -prog-name
        -cmd-str)

    (when (null (buffer-file-name)) (save-buffer))
    (when (buffer-modified-p) (save-buffer))

    (setq -fname (buffer-file-name))
    (setq -fSuffix (file-name-extension -fname))
    (setq -prog-name (cdr (assoc -fSuffix -suffix-map)))
    (setq -cmd-str (concat -prog-name " \""   -fname "\""))

    (cond
     ((string-equal -fSuffix "el") (load -fname))
     ((string-equal -fSuffix "java")
      (pittcat//compile-and-run
       -cmd-str
       (format "java %s" (file-name-sans-extension (file-name-nondirectory -fname)))))
     ((string-equal -fSuffix "cpp")
      (pittcat//compile-and-run
       (format "%s --std=c++11" -cmd-str)
       "a"))
     (t (if -prog-name
            (progn
              (message "Running…")
              (async-shell-command -cmd-str "*pittcat/run-current-file output*" ))
          (message "No recognized program file suffix for this file."))))))

(defun pittcat//compile-and-run (cmp-cmd run-cmd)
  "Run cmp-cmd, if success, then run run-cmd and print the result.
Or just print the error message.

When it's compiling a file, this function may cause error behavior."
  (setf pittcat//compile-status (cons run-cmd compile-command))
  (compile cmp-cmd)
  )

(defvar pittcat//compile-status nil "doc")

(defun pittcat//run-after-compile (buffer string)
  (when (and
         (string-match "compilation" (buffer-name buffer))
         (string-match "finished" string)
         pittcat//compile-status)
    ;; 防止 pittcat/bury-compile-buffer-if-successful 删除 compilation buffer
    ;; 这样 async-shell-command 命令就能覆盖 compilation buffer 而不是源代码的
    ;; buffer 了。
    (with-current-buffer "*compilation*"
      (insert "warning LOL"))
    (async-shell-command (car pittcat//compile-status)
                         "*pittcat/run-current-file output*")
    (setf compile-command (cdr pittcat//compile-status)
          pittcat//compile-status nil)))
(add-hook 'compilation-finish-functions
          #'pittcat//run-after-compile)
;;; END -----------pittcat/run-current-file-------------------





;;; from http://stackoverflow.com/questions/11043004/emacs-compile-buffer-auto-close
(defun pittcat/bury-compile-buffer-if-successful (buffer string)
  "Bury a compilation buffer if succeeded without warnings "
  (if (and
       (string-match "compilation" (buffer-name buffer))
       (string-match "finished" string)
       (not
        (with-current-buffer buffer
          (goto-char (point-min))
          (search-forward "warning" nil t))))
      (run-with-timer 1 nil
                      (lambda (buf)
                        (bury-buffer buf)
                        (delete-window (get-buffer-window buf)))
                      buffer)))
(add-hook 'compilation-finish-functions
          #'pittcat/bury-compile-buffer-if-successful
          t)
;;; END -----------pittcat/run-current-file-------------------

(global-set-key (kbd "<f8>") 'pittcat/run-current-file)
