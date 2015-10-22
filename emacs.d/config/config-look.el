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

(when (display-graphic-p)
  (add-hook 'after-make-frame-functions
    (lambda (frame)
      (let ((mode 'dark))
        (set-frame-parameter frame 'background-mode mode)
        (enable-theme 'solarized)
 )
 )
   )
  (load-theme 'solarized t)
 )
