(global-subword-mode 1)

(setq-default indent-tabs-mode nil)

(defun my/enable-tab-mode ()
  (interactive)
  (setq indent-tabs-mode t))

(defun my/mk-tab-width-4 ()
  (interactive)
  (setq-default tab-width 4))
