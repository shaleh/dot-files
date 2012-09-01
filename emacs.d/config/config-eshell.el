;;      (setenv "PATH" (concat (getenv PATH) ":/usr/local/bin"))

(autoload 'eshell "eshell" "eshell mode" t)

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
      ;;(eshell/export "EPOCROOT=\\Paragon\\")
        (eshell/addpath "/usr/local/bin" "/Users/sperry/bin")
        (setq show-trailing-whitespace nil)
        (local-set-key (kbd "C-a") 'my/eshell-maybe-bol)
      )
 )

(setq-default eshell-directory-name (concat user-emacs-directory "eshell"))
