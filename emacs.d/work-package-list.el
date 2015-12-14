(require 'my-functions)

; Get list from package-activated-list.
(let ((my-work-package-list '(fill-column-indicator))
      )
  (mapc #'my/require-package my-work-package-list)
 )
