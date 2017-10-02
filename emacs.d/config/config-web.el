(require 'web-mode)

(setq web-mode-content-types-alist '(("jsx"  . "\\.js[x]?")))
(add-to-list 'auto-mode-alist '("\\.js[x]?$" . web-mode))

(require 'flycheck)
;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers '(javascript-jshint))
 )

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-mode 'javascript-eslint 'javascript-mode)

(add-hook 'web-mode-hook 'my/common-programming-hook)
