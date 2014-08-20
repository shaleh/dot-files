(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			   ("marmalade" . "http://marmalade-repo.org/packages/")
			   ("melpa" . "http://melpa.milkbox.net/packages/"))
   )

  (package-initialize)

  (unless package-archive-contents
    (package-refresh-contents))

  (my/load-file (concat user-emacs-directory "package-list.el"))

  (WhenAtWork
    (my/load-file (concat user-emacs-directory "work-package-list.el"))
   )

  (WhenPersonal
    (my/load-file (concat user-emacs-directory "personal-package-list.el"))
   )
 )

