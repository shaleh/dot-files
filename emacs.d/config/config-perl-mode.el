(defalias 'perl-mode 'cperl-mode)

(add-hook 'cperl-mode-hook
  (lambda ()
    (my/common-programming-hook)
    (setq indent-tabs-mode t)
    (setq tab-width 4)))
