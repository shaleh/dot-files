(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list
             (concat my-site-lisp (convert-standard-filename "haskell-mode/"))
 )

(add-hook 'haskell-mode-hook 'my/common-programming-hook)
