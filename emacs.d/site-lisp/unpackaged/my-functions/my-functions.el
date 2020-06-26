(require 'package)
(require 'thingatpt)

(defun my/kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer)) (not (buffer-file-name buffer)))
      (kill-buffer buffer)
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

(defun my/byte-offset-at-point ()
  "Report the byte offset (0-indexed) of point."
  (interactive)
  (message "byte offset: %d" (1- (position-bytes (point))))
 )

(defun my/url-decode-region (start end)
  "Replace a region with the same contents, only URL decoded."
  (interactive "r")
  (let ((text (url-unhex-string (buffer-substring start end))))
    (delete-region start end)
    (insert text)
   )
 )

(defun my/url-encode-region (start end)
  "Replace a region with the same contents, only URL decoded."
  (interactive "r")
  (let ((text (url-hexify-string (buffer-substring start end))))
    (delete-region start end)
    (insert text)
   )
 )

(defun my/find-related-file (buf)
  "Visit related file currently in BUF.
For Python, this means either open foo_tests.py for foo.py or vice versa."
  (interactive "b")
  (let* ((current-file (buffer-file-name (get-buffer buf)))
         (base-name (file-name-sans-extension current-file))
         (ext (file-name-extension current-file)))
    (find-file-other-window
     (cond ((equal "py" ext) (if (string-suffix-p "_tests" base-name)
                                 (concat (string-remove-suffix "_tests" base-name) ".py")
                               (concat base-name "_tests.py")))
     ))
    )
  )

(defun my/reverse-region (beg end)
  "Reverse characters between BEG and END."
  (interactive "r")
  (let ((region (buffer-substring beg end)))
    (delete-region beg end)
    (insert (nreverse region))
   )
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

(defun my/enable-tab-mode ()
   (interactive)
   (setq indent-tabs-mode t)
   )

(defun my/mk-tab-width-4 ()
   (interactive)
   (setq-default tab-width 4)
   )

(provide 'my-functions)
