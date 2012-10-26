(require 'my-functions)
(require 'my-macros)

(when (fboundp 'tool-bar-mode)
   (tool-bar-mode -1)
 )

(when (fboundp 'scroll-bar-mode)
   (scroll-bar-mode -1)
 )

(setq
      inhibit-splash-screen t
      line-number-mode t
      column-number-mode t
 )

(WhenOSX
   (set-face-attribute 'default nil
             :family "Inconsolata" :height 140 :weight 'normal)
   (my/resize-frame-tall)
   (my/resize-frame-wide)
 )

;; load themes
(require 'color-theme)
(when (fboundp 'color-theme-initialize)
   (color-theme-initialize) ; depends on where color-theme came from
 )
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
