(require 'my-functions)

;browse-kill-ring
(let ((my-package-list '(color-theme
                         color-theme-approximate
                         color-theme-buffer-local
                         color-theme-solarized
                         demangle-mode
                         elpy
                         fic-mode
                         flycheck
                         flycheck-cask
                         flycheck-haskell
                         git-timemachine
                         google-this
                         graphviz-dot-mode
                         hide-lines
                         indent-guide
                         jinja2-mode
                         js2-mode
                         kill-ring-ido
                         lorem-ipsum
                         markdown-mode
                         noflet
                         python-mode
                         rebox2
                         whole-line-or-region
                         yasnippet)))
  (mapc #'my/require-package my-package-list)
 )
