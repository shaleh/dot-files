(setq x-alt-keysym 'meta)

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

(load-theme 'solarized-dark-shaleh t)
