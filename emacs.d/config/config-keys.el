(require 'my-functions)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)
(global-set-key (kbd "M-<home>") 'beginning-of-buffer)
(global-set-key (kbd "C-<home>") 'beginning-of-buffer)
(global-set-key (kbd "M-<end>") 'end-of-buffer)
(global-set-key (kbd "C-<end>") 'end-of-buffer)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-x C-r") 'my/recentf-ido-find-file)
(global-set-key (kbd "M-y") 'kill-ring-ido) ; replace usual kill-ring-pop
(global-set-key (kbd "<M-up>") 'my/move-line-up)
(global-set-key (kbd "<M-down>") 'my/move-line-down)
(global-set-key (kbd "C-c #") 'comment-region) ; use C-u C-c # to uncomment
(global-set-key (kbd "C-c e") 'my/eval-and-replace)

;; make C-x k work for emacsclient sessions too.
(add-hook 'server-switch-hook
  (lambda ()
    (when (current-local-map)
      (use-local-map (copy-keymap (current-local-map)))
     )
    (when server-buffer-clients
      (local-set-key (kbd "C-x k") 'server-edit)
     )
   )
 )
