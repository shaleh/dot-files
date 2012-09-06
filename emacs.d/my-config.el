(eval-when-compile (require 'cl))
(setq tramp-mode nil)

;; I like that load-file loads exactly the file I request when a path is used
;; but I want to use compiled files if they exist.
(defun my/load-file (filename)
  (let ((elc (concat (file-name-sans-extension filename) ".elc")))
    (if (file-exists-p elc)
        (load-file elc)
      (load-file filename)
     )
   )
)

;; find open source packages
(let ((default-directory (concat user-emacs-directory
			    (convert-standard-filename "site-lisp/"))))
   (normal-top-level-add-to-load-path '("."))
   (normal-top-level-add-subdirs-to-load-path))

(let ((default-directory (concat user-emacs-directory
			    (convert-standard-filename "my-lisp/"))))
   (normal-top-level-add-to-load-path '("."))
   (normal-top-level-add-subdirs-to-load-path))

(byte-recompile-directory user-emacs-directory 0)

;; functions
(my/load-file (concat user-emacs-directory "my-lisp/functions.el"))
;; macros
;;(my/load-file (concat user-emacs-directory "my-lisp/macros.el"))
(require 'my-macros)

;; configs
(let ((default-directory (concat user-emacs-directory
			    (convert-standard-filename "config/")))
      )
  (my/load-file "load-my-config.el")
 )

;; must come after the configs are loaded
(setq custom-file (concat user-emacs-directory "my-custom.el"))
(my/load-file custom-file)

(autoload 'ack "my-ack" "my ack function" t)
