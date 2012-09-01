(add-hook 'thrift-mode-hook
  (lambda ()
    (turn-on-fic-mode)
    (flyspell-prog-mode)
   )
 )