(defun my/kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
    (delq (current-buffer)
          (remove-if-not 'buffer-file-name (buffer-list))
     )
   )
 )

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
