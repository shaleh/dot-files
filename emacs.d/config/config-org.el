(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cb" 'org-iswitchb)
(setq org-log-done t)
(setq org-directory (concat my/home-dir "org"))
(setq org-agenda-files (list org-directory))
(setq org-default-notes-file (concat org-directory "/captured-notes.org"))
(setq org-startup-indented t)
