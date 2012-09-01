(global-subword-mode 1)

(setq search-highlight t         ;; highlight when searching
      query-replace-highlight t) ;; and replacing

;; hl-line: highlight the current line
(when (fboundp 'global-hl-line-mode)
  (global-hl-line-mode t)
 )

(defmacro WhenEmacsOlderThan (major minor &rest body)
  (list 'if (or (< emacs-major-version major) (and (= emacs-major-version major) (< emacs-minor-version minor)))
           (cons 'progn body))
 )

(defmacro WhenEmacsNewerThan (major minor &rest body)
  (list 'if (or (> emacs-major-version major) (and (= emacs-major-version major) (> emacs-minor-version minor))) (cons 'progn body))
 )

(WhenEmacsOlderThan 22 3
  (setq disabled-command-hook nil)
 )

(WhenEmacsNewerThan 22 2
  (setq disabled-command-function nil)
 )

(setq line-number-mode t)
(setq column-number-mode t)

(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)

(show-paren-mode 1)

(require 'fic-mode)
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

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
