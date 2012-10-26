(autoload 'django-html-mode "django-html-mode")
(autoload 'django-mode "django-mode")
(add-to-list 'yas-snippet-dirs
             (concat user-emacs-directory "site-lisp/django-mode/snippets"))
(add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))
