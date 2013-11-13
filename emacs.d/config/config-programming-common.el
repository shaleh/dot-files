(autoload 'sperry-linum-mode "sperry-linum" "mode for line numbers" t)
(setq-default sperry-linum-margin-padding 1)

(custom-set-variables
  '(help-at-pt-timer-delay 0.9)
  '(help-at-pt-display-when-idle '(flymake-overlay))
 )

(defun my/common-programming-hook ()
   (turn-on-fic-mode)
   (flyspell-prog-mode)
   (sperry-linum-mode)
   (subword-mode)
   (add-to-list 'my/indented-modes major-mode)
 )

(defun my/enable-tab-mode ()
   (interactive)
   (setq indent-tabs-mode t)
 )

(defun my/mk-tab-width-4 ()
   (interactive)
   (setq-default tab-width 4)
 )
