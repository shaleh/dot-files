(require 'my-functions)

(setq my-package-list '(adoc-mode
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
                        git
                        git-timemachine
                        go-mode
                        google-this
                        graphviz-dot-mode
                        haskell-mode
                        hide-lines
                        highlight-indentation
                        indent-guide
                        jinja2-mode
                        js2-mode
                        json-mode
                        json-reformat
                        ;; kill-ring-ido
                        lorem-ipsum
                        lua-mode
                        markdown-mode
                        mwim
                        noflet
                        pass
                        password-store
                        python-mode
                        pyvenv
                        rebox2
                        rust-mode
                        thrift
                        toml-mode
                        whole-line-or-region
                        xcscope
                        yaml-mode
                        yasnippet))

(mapc #'my/require-package my-package-list)

(defun my/package-inconsistency()
  (-difference my-package-list (sort (delq nil (delete-dups package-activated-list)) #'string<))
 )

(defun my/package-installed-inconsistency()
  (-difference (sort (delq nil (delete-dups package-activated-list)) #'string<) my-package-list )
 )
