(require 'package)
(require 'thingatpt)

(defun my/move-beginning-of-line ()
  "move to beginning of line, or indentation"
  (interactive)
  (let ((pt (point)))
    (beginning-of-line-text)
    (if (eq pt (point))
        (beginning-of-line)
      )
    )
  )

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

(defun my/eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (backward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
             (current-buffer))
    (error (message "Invalid expression")
           (insert (current-kill 0)))
    )
  )

(defun split-name (s)
  (split-string
    (let ((case-fold-search nil))
      (downcase (replace-regexp-in-string "\\([a-z]\\)\\([A-Z]\\)" "\\1 \\2" s))
     )
    "[^A-Za-z0-9]+")
 )

(defun mapcar-head (fn-head fn-rest list)
  "Like MAPCAR, but applies a different function to the first element."
  (if list
      (cons (funcall fn-head (car list)) (mapcar fn-rest (cdr list)))
   )
 )

(defun shell-variable-style (s) (mapconcat 'upcase (split-name s) "_"))

(defun camelcase  (s) (mapconcat 'capitalize (split-name s) ""))

(defun underscore (s) (mapconcat 'downcase   (split-name s) "_"))

(defun dasherize  (s) (mapconcat 'downcase   (split-name s) "-"))

(defun colonize   (s) (mapconcat 'capitalize (split-name s) "::"))

(defun camelscore (s)
  (cond ((string-match-p "\:"  s) (underscore s))
        ((string-match-p "_" s)   (camelcase s))
        (t                        (colonize s))
   )
 )

(defun my/camelscore-word-at-point-internal ()
  (let* ((case-fold-search nil)
         (beg (and (skip-chars-backward "[:alnum:]:_-") (point)))
         (end (and (skip-chars-forward  "[:alnum:]:_-") (point)))
         (txt (buffer-substring beg end))
         (cml (camelscore txt))
         )
    (if cml
        (progn (delete-region beg end)
               (insert cml)
         )
     )
   )
)

(defun my/camelscore-word-at-point ()
  (interactive)
  (if (use-region-p)
      (save-restriction
         (narrow-to-region (region-beginning) (region-end))
         (my/camelscore-word-at-point-internal)
         (widen)
       )
    (my/camelscore-word-at-point-internal)
   )
)

(defun my/make-shell-variable-work-at-point-internal ()
  (let* ((case-fold-search nil)
         (beg (and (skip-chars-backward "[:alnum:]:-") (point)))
         (end (and (skip-chars-forward  "[:alnum:]:-") (point)))
         (txt (buffer-substring beg end))
         (cml (shell-variable-style txt))
         )
    (if cml
      (progn (delete-region beg end)
             (insert cml)
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

(defun my/dict2args (start end)
  "Converts python dict to function args"
  (interactive "r")
  (save-restriction
    (narrow-to-region start end)
    (goto-char 1)
    (let ((case-fold-search nil))
      (while (search-forward-regexp "'\\(.+\\)': \\(.+\\)\\([,}]\\)" nil t)
        (replace-match (concat (match-string 1)
                               "="
                               (match-string 2)
                               (match-string 3))
                       t nil)
       )
     )
   )
 )


(provide 'my-functions)
