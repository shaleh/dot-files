;; user-emacs-directory was added in v 23.
(if (boundp 'user-emacs-directory)
    nil
  (defvar user-emacs-directory "~/.emacs.d/")
 )

;; N.B. use convert-standard-filename to help transition between Unix and Win

(let ((default-directory (concat user-emacs-directory
			    (convert-standard-filename "my-lisp/"))))
   (normal-top-level-add-to-load-path '("."))
   (normal-top-level-add-subdirs-to-load-path)
 )

;;(when window-system (my/set-exec-path-from-shell-PATH))

(require 'my-macros)
(require 'my-functions)

(eval-when-compile (require 'cl))
(setq tramp-mode nil)

(WhenUnix
  (defvar my/home-dir (concat (expand-file-name "~") "/"))
  (defvar my/bin-dir (concat my/home-dir "bin/"))
 )

(let ((default-directory  "/usr/local/share/emacs/site-lisp/"))
  (normal-top-level-add-subdirs-to-load-path)
 )

(defvar my-site-lisp (concat user-emacs-directory (convert-standard-filename "site-lisp/")))

(setq package-user-dir (concat my-site-lisp "packaged"))

(let ((default-directory (concat my-site-lisp "unpackaged")))
  (when (file-directory-p default-directory)
     (normal-top-level-add-to-load-path '("."))
     (normal-top-level-add-subdirs-to-load-path)
   )
 )

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         )
 )
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents)
 )

(require 'shaleh)

(setq custom-file (concat user-emacs-directory "my-custom.el"))
(shaleh-load-file custom-file)

(add-hook 'after-init-hook
  (lambda ()
    ;; Barebones emacs is up. Now load required packages, all of my configuration, etc.
    (let ((default-directory (concat user-emacs-directory
                                   (convert-standard-filename "config/")))
          )
      (shaleh-load-file "load-my-config.el")
     )
   )
 )

(add-hook 'emacs-startup-hook
  (lambda ()
    ;; Ok Emacs is fully up, start eshell
    (eshell)
   )
 )
