(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			   ("melpa" . "http://melpa.org/packages/")
                           )
   )
  (package-initialize)

  (unless package-archive-contents
    (package-refresh-contents))

  (my/load-file (concat user-emacs-directory "package-list.el"))

  (let ((extra-package-names (concat user-emacs-directory "extra-package-list.el"))
        )
    (if (file-exists-p 'extra-package-names)
      (my/load-file 'extra-package-names)
     )
   )
