;; user-emacs-directory was added in v 23.
(if (boundp 'user-emacs-directory)
   nil
  (defvar user-emacs-directory "~/.emacs.d/")
 )

(load-file (concat user-emacs-directory "my-config.el"))
