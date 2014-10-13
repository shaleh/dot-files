(add-hook 'c-mode-common-hook
  (lambda()
    (c-set-style "bsd")
    (setq c-basic-offset 4)
    (c-set-offset 'substatement-open '0)
    (local-set-key (kbd "C-x C-o") 'ff-find-other-file)
   )
 )

(add-hook 'c++-mode-hook
  (lambda()
    (c-set-style "stroustrup")
    (local-set-key (kbd "C-x C-o") 'ff-find-other-file)
   )
 )
