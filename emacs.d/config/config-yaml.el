(require 'flycheck-yamllint)
(eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook 'flycheck-yamllint-setup))
