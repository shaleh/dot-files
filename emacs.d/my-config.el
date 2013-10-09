(let ((default-directory (concat user-emacs-directory
			    (convert-standard-filename "my-lisp/"))))
   (normal-top-level-add-to-load-path '("."))
   (normal-top-level-add-subdirs-to-load-path))

(require 'my-macros)
(require 'my-functions)

(eval-when-compile (require 'cl))
(setq tramp-mode nil)

(WhenUnix
  (defvar my/home-dir (concat (expand-file-name "~") "/"))
  (defvar my/bin-dir (concat my/home-dir "bin/"))
 )

(WhenOSX
  (setenv "PATH" (concat my/bin-dir path-separator
                         "/usr/local/bin" path-separator
                         (getenv "PATH"))
   )
 )

;; find open source packages
(let ((default-directory (concat user-emacs-directory
			    (convert-standard-filename "site-lisp/"))))
   (normal-top-level-add-to-load-path '("."))
   (normal-top-level-add-subdirs-to-load-path))

;; configs
(let ((default-directory (concat user-emacs-directory
                                 (convert-standard-filename "config/")))
      )
  (my/load-file "load-my-config.el")
 )

;; must come after the configs are loaded
(setq custom-file (concat user-emacs-directory "my-custom.el"))
(my/load-file custom-file)

(server-start)
(eshell)
