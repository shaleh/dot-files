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
   (lambda ()
     (eshell/export "EDITOR=~/bin/edit")
     (eshell/addpath my/bin-dir "/usr/local/bin")
     (setq show-trailing-whitespace nil)
     (local-set-key (kbd "C-a") 'eshell-bol)
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

<<<<<<< HEAD
(setq eshell-prompt-function
  (lambda ()
    (concat (if (> (length (eshell/pwd)) 50)
               (let* ((split_path (split-string (eshell/pwd) "/"))
                      (first_char (lambda (s) (if (zerop (length s)) nil (substring s 0 1))))
                      (shortened (mapconcat 'identity (mapcar first_char (butlast split_path 3)) "/"))
                      (minimal_path_parts (reverse (delq nil (subseq (reverse split_path) 0 3))))
                      (minimal_path (mapconcat 'identity minimal_path_parts "/"))
                      )
                 (concat shortened "/" minimal_path)
                )
              (eshell/pwd)
             )
       " $ "
     )
   )
 )

(defun my/shell-here ()
  (interactive)
  (let ((cur default-directory))
    (split-window-sensibly)
    (other-window 1)
    (eshell)
    (eshell/cd cur)
    (insert "")
    (eshell-send-input)
   )
 )
