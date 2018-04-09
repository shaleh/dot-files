(require 'python-mode)  ;; circumvent the new, included Python mode

; Uncomment the following when using the built-in python.el
;;(add-hook 'python-mode-hook '(lambda () (set (make-local-variable 'yas-indent-line) 'fixed)))
(add-hook 'python-mode-hook 'my/common-programming-hook)
(add-hook 'python-mode-hook (function cscope-minor-mode))
