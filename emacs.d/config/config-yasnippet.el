(require 'yasnippet)
(setq yas-snippet-dirs
  (list (concat user-emacs-directory "my-snippets")
        (concat user-emacs-directory "site-lisp/yasnippet/snippets")
    )
 )
(yas-global-mode 1)
