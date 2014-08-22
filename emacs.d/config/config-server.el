(server-start)

(defun my/kill-buffer-or-server-edit ()
  (interactive)
  (if server-buffer-clients
      (server-edit)
    (kill-buffer)
   )
 )

;; make C-x k work for emacsclient sessions too.
(add-hook 'server-switch-hook
  (lambda ()
    (local-set-key (kbd "C-x k") 'my/kill-buffer-or-server-edit)
   )
 )
