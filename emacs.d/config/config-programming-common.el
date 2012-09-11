(autoload 'linum-mode "linum" "mode for line numbers" t)

(defun my/common-programming-hook ()
   (turn-on-fic-mode)
   (flyspell-prog-mode)
   (linum-mode)
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
