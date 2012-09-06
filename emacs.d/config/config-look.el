(setq
      inhibit-splash-screen t
      tool-bar-mode -1
      line-number-mode t
      column-number-mode t
 )

;; load themes
(require 'color-theme)
(color-theme-initialize)
(require 'color-theme-solarized)
(color-theme-solarized-dark)

(defun my/light-style ()
  (interactive)
  (color-theme-solarized-light)
 )

(defun my/dark-style ()
  (interactive)
  (color-theme-solarized-dark)
 )
