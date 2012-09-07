(defmacro WhenAtWork (&rest body)
  `(if (file-exists-p (concat user-emacs-directory "work-stamp"))
      (progn ,@body)
     nil
    )
 )

(defmacro WhenEmacsOlderThan (major minor &rest body)
  `(if (or (< emacs-major-version ,major) (and (= emacs-major-version ,major)
                                               (< emacs-minor-version ,minor))
        )
      (progn ,@body)
     nil
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
     nill
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
