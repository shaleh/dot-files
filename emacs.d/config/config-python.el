(setq pycodechecker "/usr/local/bin/epylint")
(require 'flymake)

(defun flymake-pycodecheck-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
                     'flymake-create-temp-inplace))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))
          )
         )
    (list pycodechecker (list local-file))
   )
 )

(add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pycodecheck-init)
 )

(add-hook 'python-mode-hook 'my/common-programming-hook)
