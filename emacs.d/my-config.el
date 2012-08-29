;; find open source packages
(let ((default-directory (concat user-emacs-directory
			    (convert-standard-filename "site-lisp/"))))
   (normal-top-level-add-to-load-path '("."))
   (normal-top-level-add-subdirs-to-load-path))

(let ((default-directory (concat user-emacs-directory
			    (convert-standard-filename "my-lisp/"))))
   (normal-top-level-add-to-load-path '("."))
   (normal-top-level-add-subdirs-to-load-path))

(byte-recompile-directory (user-emacs-directory) 0)

;; functions
(load-file (concat user-emacs-directory "my-lisp/functions.el"))

;; configs
(let ((default-directory (concat user-emacs-directory
			    (convert-standard-filename "config/")))
      )
  (load-file "load-my-config.el")
 )

;; must come after the configs are loaded
(setq custom-file (concat user-emacs-directory "my-custom.el"))
(load-file custom-file)

(load "my-ack")

(load "thrift")
