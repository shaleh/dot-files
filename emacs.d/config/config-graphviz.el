(autoload 'graphviz-dot-mode "graphviz-dot-mode")
(add-to-list 'auto-mode-alist '("\\.dot$" . graphviz-dot-mode))
(add-hook 'graphviz-dot-mode-hook 'my/common-programming-hook)
