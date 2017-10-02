(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list
             (concat my-site-lisp (convert-standard-filename "haskell-mode/"))
 )

(define-key haskell-mode-map (kbd "C-c h") 'haskell-hoogle)

(add-hook 'align-load-hook
  (lambda ()
    (add-to-list 'align-rules-list
                 '(haskell-types
                   (regexp . "\\(\\s-+\\)\\(::\\|∷\\)\\s-+")
                   (modes quote (haskell-mode literate-haskell-mode)))
     )
    (add-to-list 'align-rules-list
                 '(haskell-assignment
                   (regexp . "\\(\\s-+\\)=\\s-+")
                   (modes quote (haskell-mode literate-haskell-mode)))
     )
    (add-to-list 'align-rules-list
                 '(haskell-arrows
                   (regexp . "\\(\\s-+\\)\\(->\\|→\\)\\s-+")
                   (modes quote (haskell-mode literate-haskell-mode)))
     )
    (add-to-list 'align-rules-list
                 '(haskell-left-arrows
                   (regexp . "\\(\\s-+\\)\\(<-\\|←\\)\\s-+")
                   (modes quote (haskell-mode literate-haskell-mode)))
     )
   )
 )

(add-hook 'haskell-mode-hook 'intero-mode)
(add-hook 'haskell-mode-hook 'shaleh-haskell-hook)

(defun shaleh-haskell-hook ()
    (my/common-programming-hook)

    (turn-on-haskell-indentation)

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
 )
