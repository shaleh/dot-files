(require 'my-macros)

(my/load-file "./config-look.el")
(my/load-file "./config-keys.el")

(my/load-file "./config-modes-common.el")
(my/load-file "./config-programming-common.el")

; misc
(my/load-file "./config-ediff.el")
(my/load-file "./config-eshell.el")
(my/load-file "./config-org.el")
(my/load-file "./config-yasnippet.el")

; coding
(my/load-file "./config-c.el")
(my/load-file "./config-django.el")
(my/load-file "./config-elisp.el")
(my/load-file "./config-haskell.el")
(my/load-file "./config-java.el")
(my/load-file "./config-perl-mode.el")
(my/load-file "./config-python.el")
(my/load-file "./config-shell-mode.el")
(my/load-file "./config-thrift.el")

(WhenAtWork
  (my/load-file "./config-work.el")
 )
