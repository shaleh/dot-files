(add-hook 'c-mode-common-hook
    (lambda ()
      (turn-on-fic-mode)
      (flyspell-prog-mode)
     )
 )
