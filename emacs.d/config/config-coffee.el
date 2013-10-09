(autoload 'coffee-mode "coffee-mode")
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-hook 'coffee-mode-hook 'my/common-programming-hook)
