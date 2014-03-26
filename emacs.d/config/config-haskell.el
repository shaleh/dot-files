(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list
             (concat my-site-lisp (convert-standard-filename "haskell-mode/"))
 )

(add-hook 'haskell-mode-hook 'my/haskell-hook)

(defun my/haskell-hook ()
    (turn-on-haskell-simple-indent)

    ;; Indent the below lines on columns after the current column.
    (define-key haskell-mode-map (kbd "C-<right>")
       (lambda ()
         (interactive)
         (haskell-move-nested 1)
        )
     )

    ;; Same as above but backwards.
    (define-key haskell-mode-map (kbd "C-<left>")
       (lambda ()
         (interactive)
         (haskell-move-nested -1)
        )
     )

    (my/common-programming-hook)
 )
