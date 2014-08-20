(defmacro WhenPersonal (&rest body)
  `(if (not (file-exists-p (concat user-emacs-directory "work-stamp")))
       (progn ,@body)
     nil
     )
  )

(defmacro WhenAtWork (&rest body)
  `(if (file-exists-p (concat user-emacs-directory "work-stamp"))
      (progn ,@body)
     nil
    )
 )

(defun my/emacs-older-than-p (major minor)
   (or (< emacs-major-version major) (and (= emacs-major-version major)
                                          (< emacs-minor-version minor)))
 )

(defmacro WhenEmacsOlderThan (major minor &rest body)
  `(when (my/emacs-older-than-p ,major ,minor)
     (progn ,@body)
    )
 )

(defun SetWhenEmacsOlderThan (major minor name value)
  (when (and (my/emacs-older-than-p major minor)
             (boundp name))
    (set name value)
   )
 )

(defmacro WhenEmacsNewerThan (major minor &rest body)
  `(if (or (> emacs-major-version ,major) (and (= emacs-major-version ,major)
                                               (> emacs-minor-version ,minor))
        )
       (progn ,@body)
      nil
    )
 )

(defmacro WhenOSX (&rest body)
  `(if (eq system-type 'darwin)
       (progn ,@body)
     nil
    )
 )

(defmacro WhenUnix (&rest body)
  `(cond
      ((or (eq system-type 'ms-dos)
           (eq system-type 'windows-nt))
       nil)
      (t (progn ,@body))
    )
 )

(provide 'my-macros)
