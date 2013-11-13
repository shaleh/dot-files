(server-start)

;; make C-x k work for emacsclient sessions too.
(add-hook 'server-switch-hook
  (lambda ()
    (when server-buffer-clients
      (local-set-key (kbd "C-x k") 'server-edit)
     )
   )
 )
