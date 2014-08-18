(add-hook 'python-mode-hook 'my/common-programming-hook)
(add-hook 'python-mode-hook '(lambda () (set (make-local-variable 'yas-indent-line) 'fixed)))
