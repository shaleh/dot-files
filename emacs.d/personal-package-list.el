(require 'my-functions)

(let ((my-package-list '(erlang
                         haskell-mode
                         idris-mode
                         rust-mode
                         thrift))
      )
  (mapc #'my/require-package my-package-list)
 )
