(require 'my-functions)

(let ((my-package-list '(achievements
                         erlang
                         haskell-mode
                         idris-mode
                         rust-mode
                         thrift))
      )
  (mapc #'my/require-package my-package-list)
 )
