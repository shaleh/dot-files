;; I like that load-file loads exactly the file I request when a path is used
;; but I want to use compiled files if they exist.
(defun my/load-file (filename)
  (let ((elc (concat (file-name-sans-extension filename) ".elc")))
    (if (file-exists-p elc)
        (load-file elc)
      (load-file filename)
     )
   )
)

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

(defun my/resize-frame-wide ()
  ;; this was 120, but it does not leave room for line numbers
  "Resize the current frame to 125 wide"
  (interactive)
  (set-frame-size (selected-frame) 125 (frame-height))
 )

(defun my/resize-frame-tall ()
  "tall"
  (interactive)
  (set-frame-size (selected-frame) (frame-width) 65)
  )

(defun my/resize-frame-normal ()
  "Resize the current frame to 80 wide, leave height alone."
  (interactive)
  (set-frame-size (selected-frame) 80 (frame-height))
 )

(defun my/resize-frame-max-height ()
  "Resize frame to max height based on screen res"
  (interactive)
  (set-frame-size (selected-frame) (frame-width) (/ (display-pixel-height) (frame-char-height)))
 )

(defun my/move-line (n)
  "Move the current line up or down by N lines."
  (interactive "p")
  (let ((col (current-column))
        start
        end)
    (beginning-of-line)
    (setq start (point))
    (end-of-line)
    (forward-char)
    (setq end (point))
    (let ((line-text (delete-and-extract-region start end)))
      (forward-line n)
      (insert line-text)
      ;; restore point to original column in moved line
      (forward-line -1)
      (forward-char col)
     )
   )
 )

(defun my/move-line-up (n)
  "Move the current line up by N lines."
  (interactive "p")
  (my/move-line (if (null n) -1 (- n)))
 )

(defun my/move-line-down (n)
  "Move the current line down by N lines."
  (interactive "p")
  (my/move-line (if (null n) 1 n))
 )

(provide 'my-functions)
