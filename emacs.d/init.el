(defvar my/home-dir (concat (expand-file-name "~") "/"))
(defvar my/bin-dir (concat my/home-dir "bin/"))

(setq custom-file (concat user-emacs-directory (convert-standard-filename "custom.el")))
(when (file-exists-p custom-file)
  (load custom-file)
  )

(defvar my-site-lisp (concat user-emacs-directory
			     (convert-standard-filename "site-lisp/")))
(setq package-user-dir (concat my-site-lisp "packaged"))
(let ((default-directory (concat my-site-lisp "unpackaged")))
  (when (file-directory-p default-directory)
     (normal-top-level-add-to-load-path '("."))
     (normal-top-level-add-subdirs-to-load-path)))
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

;; if not yet installed, install package use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; load org package and our emacs-config.org file
(require 'org)
(org-babel-load-file
 (expand-file-name "settings.org" user-emacs-directory))
