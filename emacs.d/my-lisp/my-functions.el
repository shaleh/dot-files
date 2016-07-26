(require 'package)
(require 'thingatpt)

(defun my/hide-trailing-whitespace ()
  "Do not highlight trailing whitespace in this buffer."
  (interactive)
  (setq show-trailing-whitespace nil)
 )

(defun my/show-trailing-whitespace ()
  "Highlight trailing whitespace in this buffer."
  (interactive)
  (setq show-trailing-whitespace t)
 )

(defun my/recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let* ((file-assoc-list
	  (mapcar (lambda (x)
		    (cons (file-name-nondirectory x)
			  x)
                   )
		  recentf-list)
          )
	 (filename-list
	  (remove-duplicates (mapcar #'car file-assoc-list)
			     :test #'string=)
          )
	 (filename (ido-completing-read "Choose recent file: "
					filename-list
					nil
					t)
          )
         )
    (when filename
      (find-file (cdr (assoc filename
			     file-assoc-list))
       )
     )
   )
 )

(defun my/describe-thing-at-point ()
  (interactive)
  (let (sym)
    (cond ((symbolp (setq sym (variable-at-point))) (describe-variable sym))
          ((setq sym (function-called-at-point)) (describe-function sym))
     )
   )
 )

(defun my/find-thing-at-point (&optional always-ask)
  (interactive "P")
  (let* ((at-point (thing-at-point 'symbol))
         (s (and at-point (intern at-point)))
         (v (or (variable-at-point)
                (and s (boundp s) s)))
         (f (or (function-called-at-point)
                (and s (fboundp s) s)))
         )
    (push-mark (point) t)
    (cond (always-ask (call-interactively 'find-function))
          ((and v (not (numberp v)))
           (find-variable v)
           )
          ((and f (subrp (symbol-function f)))
           (let ((buf-pos (find-function-search-for-symbol
                           f nil (help-C-file-name (symbol-function f) 'subr))))
             (and (car buf-pos) (pop-to-buffer (car buf-pos)))
            )
           )
          (f (find-function f))
          (t (call-interactively 'find-function))
     )
   )
 )

(defun my/require-package (package)
  (unless (package-installed-p package)
    (package-install package)
   )
 )

(defun my/find-nth (str num)
  (interactive "MString: \nNCount: ")
  (search-forward str nil nil num)
 )

(provide 'my-functions)
