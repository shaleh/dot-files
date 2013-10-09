(autoload 'django-html-mode "django-html-mode")
(autoload 'django-mode "django-mode")
(add-to-list 'yas-snippet-dirs
             (concat user-emacs-directory "site-lisp/django-mode/snippets"))
(add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))


(defun my/html-toggle-paragraph ()
    "Add or remove HTML paragraph tags from the current paragraph"
    (interactive)
    (save-excursion
        (backward-paragraph)
        (when (looking-at "^\\s-*$")
            (forward-char 1)
         )
        (if (looking-at "<p>")
            (replace-match "")
          (insert "<p>")
         )
        (forward-paragraph)
        (when (looking-at "^\\s-*$")
            (backward-char 1)
         )
        (if (looking-back "</p>")
            (replace-match "")
          (insert "</p>")
         )
     )
 )
