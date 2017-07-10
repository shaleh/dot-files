(require 'yasnippet)

(yas-global-mode 1)

;; Occasionally there is incorrect whitespace left behind.
(add-hook 'yas-after-exit-snippet-hook
  (lambda ()
    (whitespace-cleanup-region yas-snippet-beg yas-snippet-end)
     )
 )
