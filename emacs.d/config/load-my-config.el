(require 'my-macros)
(require 'shaleh)

(dolist (cfg '("./config-look.el"
               "./config-keys.el"
               "./config-kbd-macros.el"
               "./config-aliases.el"
               "./config-modes-common.el"
               "./config-eshell.el"
               "./config-dockerfile.el"
               ;; Programming helpers
               "./config-programming-common.el"
               "./config-css.el"
               "./config-ediff.el"
               "./config-graphviz.el"
               "./config-markdown.el"
               "./config-org.el"
               "./config-thrift.el"
               "./config-yaml.el"
               "./config-yasnippet.el"
               ;; Programming modes
               "./config-c.el"
               "./config-elisp.el"
               "./config-go.el"
               "./config-haskell.el"
               "./config-java.el"
               "./config-javascript.el"
               "./config-jinja2.el"
               "./config-perl-mode.el"
               "./config-python.el"
               "./config-ruby.el"
               "./config-rust.el"
               "./config-server.el"
               "./config-shell-mode.el"
               "./config-web.el"))
  (shaleh-load-file cfg)
 )

(let ((extra-config "./config-extras.el")
      )
  (if (file-exists-p extra-config)
     (shaleh-load-file extra-config)
   )
 )
