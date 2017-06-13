(require 'my-functions)

; Get list from package-activated-list.
(let ((my-package-list '(adoc-mode
                         browse-kill-ring
                         color-theme
                         color-theme-approximate
                         color-theme-buffer-local
                         color-theme-solarized
                         demangle-mode
                         elpy
                         fic-mode
                         find-file-in-project
                         flycheck
                         flycheck-haskell
                         flycheck-rust
                         git-timemachine
                         google-this
                         graphviz-dot-mode
                         haskell-mode
                         hide-lines
                         highlight-indentation
                         indent-guide
                         jinja2-mode
                         js2-mode
                         json-mode
                         ;;kill-ring-ido
                         lorem-ipsum
                         markdown-mode
                         mwim
                         noflet
                         python-mode
                         pyvenv
                         rebox2
                         rust-mode
                         thrift
                         toml-mode
                         whole-line-or-region
                         xcscope
                         yaml-mode
                         yasnippet)))
  (mapc #'my/require-package my-package-list)
 )
