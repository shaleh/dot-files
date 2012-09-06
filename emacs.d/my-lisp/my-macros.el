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

(provide 'my-macros)
