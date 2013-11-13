(require 'flymake)

(defcustom my/flymake-shell-of-choice
  "/bin/bash"
  "Path of shell.")

(defcustom my/flymake-shell-arguments
  (list "-n")
  "Shell arguments to invoke syntax checking.")

(defcustom my/flymake-shell-err-line-pattern-re
  '(("^\\(.+\\): line \\([0-9]+\\): \\(.+\\)$" 1 2 nil 3))
  "Shell error pattern")

(defun flymake-shell-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name)))
         )
    (list my/flymake-shell-of-choice (append my/flymake-shell-arguments (list local-file)))
   )
 )

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.sh\\'" flymake-shell-init)
 )

(add-hook 'sh-mode-hook 'my/common-programming-hook)
(add-hook 'sh-mode-hook
          (lambda ()
            (setq flymake-err-line-patterns (append flymake-err-line-patterns flymake-shell-err-line-pattern-re))
           )
 )
