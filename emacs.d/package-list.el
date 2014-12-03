(require 'my-functions)

; Get list from package-activated-list.
(let ((my-package-list '(color-theme
                         color-theme-approximate
                         color-theme-buffer-local
                         color-theme-solarized
                         demangle-mode
                         elpy
                         fic-mode
                         find-file-in-project
                         flycheck
                         git-timemachine
                         google-this
                         graphviz-dot-mode
                         hide-lines
                         highlight-indentation
                         indent-guide
                         jinja2-mode
                         js2-mode
                         kill-ring-ido
                         lorem-ipsum
                         markdown-mode
                         noflet
                         python-mode
                         pyvenv
                         rebox2
                         whole-line-or-region
                         yasnippet)))
  (mapc #'my/require-package my-package-list)
 )
