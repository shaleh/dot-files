(require 'yasnippet)
(setq yas-snippet-dirs
  (list (concat user-emacs-directory "my-snippets")
        (concat user-emacs-directory "site-lisp/yasnippets/snippets")
    )
 )
(yas-global-mode 1)
