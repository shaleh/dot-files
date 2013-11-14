(require 'yasnippet)

(setq yas-snippet-dirs
  (list (concat user-emacs-directory "my-snippets")
        (concat user-emacs-directory "site-lisp/yasnippet/snippets")
    )
 )

(yas-global-mode 1)

;; Occasionally there is incorrect whitespace left behind.
(add-hook 'yas-after-exit-snippet-hook
          (lambda ()
            (whitespace-cleanup-region yas-snippet-beg yas-snippet-end)
           )
 )
