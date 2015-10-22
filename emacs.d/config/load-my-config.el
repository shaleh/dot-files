(require 'my-macros)

(my/load-file "./config-packages.el")
(my/load-file "./config-look.el")
(my/load-file "./config-keys.el")

(my/load-file "./config-modes-common.el")
(my/load-file "./config-programming-common.el")

; misc
(my/load-file "./config-ediff.el")
(my/load-file "./config-eshell.el")
(my/load-file "./config-graphviz.el")
(my/load-file "./config-markdown.el")
(my/load-file "./config-org.el")
(my/load-file "./config-yasnippet.el")

; coding
(my/load-file "./config-c.el")
(my/load-file "./config-javascript.el")
(my/load-file "./config-jinja2.el")
(my/load-file "./config-perl-mode.el")
(my/load-file "./config-python.el")
(my/load-file "./config-ruby.el")
(my/load-file "./config-rust.el")

(WhenPersonal
  (my/load-file "./config-personal.el")
 )

(WhenAtWork
  (my/load-file "./config-work.el")
 )

(my/load-file "./config-server.el")
