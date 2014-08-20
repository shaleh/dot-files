(setq user-mail-address "shaleh@speakeasy.net")

(require 'achievements)
(achievements-mode)

(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(my/load-file "./config-haskell.el")
(my/load-file "./config-idris.el")
(my/load-file "./config-thrift.el")
