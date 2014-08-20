(add-hook 'c-mode-common-hook
  (lambda()
    (my/common-programming-hook)
    (c-set-style 'bsd)
    (local-set-key (kbd "C-x C-o") 'ff-find-other-file)
   )
 )

(add-hook 'c++-mode-hook
  (lambda()
    (c-set-style 'stroustrup)
   )
 )
