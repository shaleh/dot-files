(add-hook 'css-mode-hook 'my/common-programming-hook)
(setq css-indent-offset 2)
(add-to-list 'safe-local-variable-values
             '(flycheck-css-stylelint-executable . (lambda (x) t)))
