(add-hook 'go-mode-hook 'my/common-programming-hook)
(add-hook 'go-mode-hook
  (lambda()
    (local-set-key (kbd "C-x C-o") 'ff-find-other-file)
   )
 )
