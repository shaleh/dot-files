(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)
(autoload 'json-mode "json-mode")
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-hook 'javascript-mode-hook 'my/common-programming-hook)