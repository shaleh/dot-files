(require 'my-functions)

(let ((my-package-list '(achievements
                         erlang
                         haskell-mode
                         flycheck-haskell
                         idris-mode
                         rust-mode
                         thrift))
      )
  (mapc #'my/require-package my-package-list)
 )
