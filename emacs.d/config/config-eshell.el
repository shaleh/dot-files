;;      (setenv "PATH" (concat (getenv PATH) ":/usr/local/bin"))

(require 'eshell)

(add-hook 'eshell-mode-hook
   '(lambda nil
      ;;(eshell/export "EPOCROOT=\\Paragon\\")
        (eshell/addpath "/usr/local/bin" "/Users/sperry/bin")
      )
 )

;; probably a better way to do this....
(defun my/goto-documents ()
  (interactive)
  (eshell-dirs-substitute-cd "~/Documents/"))

(defun my/goto-svn ()
  (interactive)
  (eshell-dirs-substitute-cd "/svn/"))

(defun my/goto-p4 ()
  (interactive)
  (eshell-dirs-substitute-cd "/p4/"))

(defun my/goto-org ()
  (interactive)
  (eshell-dirs-substitute-cd 'org-directory))
