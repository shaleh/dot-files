(add-to-list 'auto-mode-alist '("\\.thrift\\'" . thrift-mode)
             )
(add-hook 'thrift-mode-hook 'my/common-programming-hook)
