(require 'my-macros)
(require 'shaleh)

(shaleh-load-file "./config-look.el")
(shaleh-load-file "./config-keys.el")

(shaleh-load-file "./config-modes-common.el")
(shaleh-load-file "./config-programming-common.el")

; misc
(shaleh-load-file "./config-ediff.el")
(shaleh-load-file "./config-eshell.el")
(shaleh-load-file "./config-graphviz.el")
(shaleh-load-file "./config-markdown.el")
(shaleh-load-file "./config-org.el")
(shaleh-load-file "./config-yasnippet.el")

; coding
(shaleh-load-file "./config-c.el")
(shaleh-load-file "./config-elisp.el")
(shaleh-load-file "./config-go.el")
(shaleh-load-file "./config-haskell.el")
(shaleh-load-file "./config-java.el")
(shaleh-load-file "./config-javascript.el")
(shaleh-load-file "./config-jinja2.el")
(shaleh-load-file "./config-perl-mode.el")
(shaleh-load-file "./config-python.el")
(shaleh-load-file "./config-ruby.el")
(shaleh-load-file "./config-rust.el")
(shaleh-load-file "./config-server.el")
(shaleh-load-file "./config-shell-mode.el")
(shaleh-load-file "./config-thrift.el")

(let ((extra-config "./config-extras.el")
      )
  (if (file-exists-p extra-config)
     (shaleh-load-file extra-config)
   )
 )
