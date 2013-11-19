(require 'eshell)
(require 'em-smart)

(defun my/eshell-maybe-bol ()
  (interactive)
  (let ((p (point))
        )
    (eshell-bol)
    (if (= p (point))
        (beginning-of-line)
      )
    )
  )

(add-hook 'eshell-mode-hook
   '(lambda nil
        (eshell/export "EDITOR=~/bin/edit")
        (eshell/addpath my/bin-dir "/usr/local/bin")
        (setq show-trailing-whitespace nil)
        (local-set-key (kbd "C-a") 'my/eshell-maybe-bol)
        (setq yas--dont-activate t)
      )
 )

(setq eshell-directory-name (concat user-emacs-directory (convert-standard-filename "eshell"))
      eshell-history-file-name (concat user-emacs-directory (convert-standard-filename "state/eshell-history"))
      eshell-last-dir-ring-file-name (concat user-emacs-directory (convert-standard-filename "state/eshell-lastdir"))
      eshell-where-to-jump 'begin
      eshell-review-quick-commands nil
      eshell-smart-space-goes-to-end t
 )

(setq eshell-aliases-file (concat eshell-directory-name "alias"))
