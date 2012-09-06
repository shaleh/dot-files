(require 'my-macros)

(global-subword-mode 1)

(setq search-highlight t         ;; highlight when searching
      query-replace-highlight t) ;; and replacing

;; hl-line: highlight the current line
(when (fboundp 'global-hl-line-mode)
  (global-hl-line-mode t)
 )

(WhenEmacsOlderThan 22 2
  (setq disabled-command-hook nil)
 )

(WhenEmacsNewerThan 22 1
  (setq disabled-command-function nil)
 )

(setq line-number-mode t)
(setq column-number-mode t)

(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)

(show-paren-mode 1)

(load-library "ediff-trees")
(require 'ido)
(ido-mode 'both) ;; for buffers and files
(setq
  ido-save-directory-list-file (concat user-emacs-directory "ido.last")
  ido-enable-tramp-completion nil
  ido-case-fold  t
  ido-enable-last-directory-history t
  ido-max-work-directory-list 30
  ido-max-work-file-list      50
  ido-use-filename-at-point nil
  ido-use-url-at-point nil
  ido-enable-flex-matching nil
  ido-confirm-unique-completion t
 )

(require 'fic-mode)
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(require 'recentf)
(recentf-mode t)
(setq recentf-save-file (concat user-emacs-directory "recentf"))

(autoload 'linum-mode "linum" "mode for line numbers" t)
(autoload 'pwsafe "pwsafe" "load pwsafe" t)

(add-to-list 'auto-mode-alist '("\\.dot\\'" . graphviz-dot-mode)
 )
(add-to-list 'auto-mode-alist '("\\.thrift\\'" . thrift-mode)
 )

(defun my/enable-tab-mode ()
  (interactive)
  (setq indent-tabs-mode t))

(defun my/mk-tab-width-4 ()
  (interactive)
  (setq-default tab-width 4))
