(custom-set-variables
  '(help-at-pt-timer-delay 0.9)
  '(help-at-pt-display-when-idle '(flymake-overlay))
 )

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
   (turn-on-fic-mode)
   (flyspell-prog-mode)
   (linum-mode)
   (my/enable-subword-mode)
   (hl-line-mode)
   (indent-guide-mode)
   (local-set-key (kbd "C-a") 'my/move-beginning-of-line)
   (add-to-list 'my/indented-modes major-mode)
 )

(defvar my/indented-modes '())

;; auto-indent pasted code
;; (defadvice yank (after indent-region activate)
;;   (if (and (member major-mode my/indented-modes) (not (string-prefix-p "python" major-mode))) 
;;       (indent-region (region-beginning) (region-end) nil)
;;    )
;;  )

;; (defadvice yank-pop (after indent-region activate)
;;   (if (member major-mode my/indented-modes)
;;       (indent-region (region-beginning) (region-end) nil)
;;     )
;;   )

(defun my/enable-tab-mode ()
   (interactive)
   (setq indent-tabs-mode t)
 )

(defun my/mk-tab-width-4 ()
   (interactive)
   (setq-default tab-width 4)
 )

(mapc
  (lambda (hook)
    (add-hook hook 'my/common-programming-hook)
   )
  '(c-mode-common-hook
    emacs-lisp-mode-hook
    graphviz-dot-mode-hook
    java-mode-hook
    js2-mode-hook
    cperl-mode-hook
    python-mode-hook
    sh-mode-hook)
 )
