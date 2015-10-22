(setq racer-rust-src-path "/home/perryse/repos/rust/rust-1.1.0/src/")
(setq racer-cmd "/home/perryse/bin/racer")
(eval-after-load "rust-mode" '(require 'racer))
(add-hook 'rust-mode-hook
  '(lambda ()
     (racer-activate)
     (local-set-key (kbd "M-.") #'racer-find-definition)
     (local-set-key (kbd "TAB") #'racer-complete-or-indent)
    )
 )

