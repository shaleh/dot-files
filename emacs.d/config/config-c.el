(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key (kbd "C-x C-o") 'ff-find-other-file)
   )
 )

(add-hook 'c-mode-hook
  (lambda()
    (c-set-style "bsd")  ; use BSD a base but use 4 space indents and no hanging braces
    (setq c-basic-offset 4)
    (c-set-offset 'substatement-open '0)
   )
 )

(add-hook 'c++-mode-hook
  (lambda()
    (c-set-style "stroustrup")
   )
 )
