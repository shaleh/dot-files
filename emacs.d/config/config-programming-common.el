(defun my/enable-subword-mode ()
  "Enable with subword or c-subword-mode"
  (interactive)
  (if (fboundp 'subword-mode)
      (subword-mode)
    (if (fboundp 'c-subword-mode)
        (c-subword-mode)
     )
   )
 )

(require 'indent-guide)

(defun my/common-programming-hook ()
   (fic-mode)
   (flyspell-prog-mode)
   (flycheck-mode)
   (if (boundp display-line-numbers)
       (setq display-line-numbers t)
     (linum-mode)
    )
   (my/enable-subword-mode)
   (hl-line-mode)
   (indent-guide-mode)
   (add-to-list 'my/indented-modes major-mode)
 )

(defvar my/indented-modes '())

(defun my/enable-tab-mode ()
   (interactive)
   (setq indent-tabs-mode t)
 )

(defun my/mk-tab-width-4 ()
   (interactive)
   (setq-default tab-width 4)
 )

(add-hook 'c-mode-common-hook 'my/common-programming-hook)
