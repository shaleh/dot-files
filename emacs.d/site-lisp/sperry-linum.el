;;; linum.el --- display line numbers in the left margin

;; Copyright (C) 2008, 2009, 2010, 2011, 2012 Free Software Foundation, Inc.

;; Author: Markus Triska <markus.triska@gmx.at>
;; Maintainer: FSF
;; Keywords: convenience

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Display line numbers for the current buffer.
;;
;; Toggle display of line numbers with M-x sperry-linum-mode.  To enable
;; line numbering in all buffers, use M-x global-sperry-linum-mode.

;;; Code:

(defconst sperry-linum-version "0.9x sperry")

(defvar sperry-linum-overlays nil "Overlays used in this buffer.")
(defvar sperry-linum-available nil "Overlays available for reuse.")
(defvar sperry-linum-before-numbering-hook nil
  "Functions run in each buffer before line numbering starts.")

(mapc #'make-variable-buffer-local '(sperry-linum-overlays sperry-linum-available))

(defgroup sperry-linum nil
  "Show line numbers in the left margin."
  :group 'convenience)

;;;###autoload
(defcustom sperry-linum-format 'dynamic
  "Format used to display line numbers.
Either a format string like \"%7d\", `dynamic' to adapt the width
as needed, or a function that is called with a line number as its
argument and should evaluate to a string to be shown on that line.
See also `sperry-linum-before-numbering-hook'."
  :group 'sperry-linum
  :type 'sexp)

(defcustom sperry-linum-margin-padding 0
  "Padding added to the left margin when displaying the line numbers.
Should be a positive integer. A value between 1 and 5 is probably sufficient."
  :group 'sperry-linum
  :type 'integer)

(defface sperry-linum
  '((t :inherit (shadow default)))
  "Face for displaying line numbers in the display margin."
  :group 'sperry-linum)

(defcustom sperry-linum-eager t
  "Whether line numbers should be updated after each command.
The conservative setting `nil' might miss some buffer changes,
and you have to scroll or press \\[recenter-top-bottom] to update the numbers."
  :group 'sperry-linum
  :type 'boolean)

(defcustom sperry-linum-delay nil
  "Delay updates to give Emacs a chance for other changes."
  :group 'sperry-linum
  :type 'boolean)

;;;###autoload
(define-minor-mode sperry-linum-mode
  "Toggle display of line numbers in the left margin."
  :lighter ""                           ; for desktop.el
  (if sperry-linum-mode
      (progn
        (if sperry-linum-eager
            (add-hook 'post-command-hook (if sperry-linum-delay
                                             'sperry-linum-schedule
                                           'sperry-linum-update-current) nil t)
          (add-hook 'after-change-functions 'sperry-linum-after-change nil t))
        (add-hook 'window-scroll-functions 'sperry-linum-after-scroll nil t)
        ;; Using both window-size-change-functions and
        ;; window-configuration-change-hook seems redundant. --Stef
        ;; (add-hook 'window-size-change-functions 'sperry-linum-after-size nil t)
        (add-hook 'change-major-mode-hook 'sperry-linum-delete-overlays nil t)
        (add-hook 'window-configuration-change-hook
                  ;; FIXME: If the buffer is shown in N windows, this
                  ;; will be called N times rather than once.  We should use
                  ;; something like sperry-linum-update-window instead.
                  'sperry-linum-update-current nil t)
        (sperry-linum-update-current))
    (remove-hook 'post-command-hook 'sperry-linum-update-current t)
    (remove-hook 'post-command-hook 'sperry-linum-schedule t)
    ;; (remove-hook 'window-size-change-functions 'sperry-linum-after-size t)
    (remove-hook 'window-scroll-functions 'sperry-linum-after-scroll t)
    (remove-hook 'after-change-functions 'sperry-linum-after-change t)
    (remove-hook 'window-configuration-change-hook 'sperry-linum-update-current t)
    (remove-hook 'change-major-mode-hook 'sperry-linum-delete-overlays t)
    (sperry-linum-delete-overlays)))

;;;###autoload
(define-globalized-minor-mode global-sperry-linum-mode sperry-linum-mode sperry-linum-on)

(defun sperry-linum-on ()
  (unless (minibufferp)
    (sperry-linum-mode 1)))

(defun sperry-linum-delete-overlays ()
  "Delete all overlays displaying line numbers for this buffer."
  (mapc #'delete-overlay sperry-linum-overlays)
  (setq sperry-linum-overlays nil)
  (dolist (w (get-buffer-window-list (current-buffer) nil t))
    (set-window-margins w 0 (cdr (window-margins w)))))

(defun sperry-linum-update-current ()
  "Update line numbers for the current buffer."
  (sperry-linum-update (current-buffer)))

(defun sperry-linum-update (buffer)
  "Update line numbers for all windows displaying BUFFER."
  (with-current-buffer buffer
    (when sperry-linum-mode
      (setq sperry-linum-available sperry-linum-overlays)
      (setq sperry-linum-overlays nil)
      (save-excursion
        (mapc #'sperry-linum-update-window
              (get-buffer-window-list buffer nil 'visible)))
      (mapc #'delete-overlay sperry-linum-available)
      (setq sperry-linum-available nil))))

(defun sperry-linum-update-window (win)
  "Update line numbers for the portion visible in window WIN."
  (goto-char (window-start win))
  (let ((line (line-number-at-pos))
        (limit (window-end win t))
        (fmt (cond ((stringp sperry-linum-format) sperry-linum-format)
                   ((eq sperry-linum-format 'dynamic)
                    (let ((w (length (number-to-string
                                      (count-lines (point-min) (point-max))))))
                      (concat "%" (number-to-string w) "d")))))
        (width 0))
    (run-hooks 'sperry-linum-before-numbering-hook)
    ;; Create an overlay (or reuse an existing one) for each
    ;; line visible in this window, if necessary.
    (while (and (not (eobp)) (<= (point) limit))
      (let* ((str (if fmt
                      (propertize (format fmt line) 'face 'sperry-linum)
                    (funcall sperry-linum-format line)))
             (visited (catch 'visited
                        (dolist (o (overlays-in (point) (point)))
                          (when (equal-including-properties
				 (overlay-get o 'sperry-linum-str) str)
                            (unless (memq o sperry-linum-overlays)
                              (push o sperry-linum-overlays))
                            (setq sperry-linum-available (delq o sperry-linum-available))
                            (throw 'visited t))))))
        (setq width (max width (+ (length str) sperry-linum-margin-padding)))
        (unless visited
          (let ((ov (if (null sperry-linum-available)
                        (make-overlay (point) (point))
                      (move-overlay (pop sperry-linum-available) (point) (point)))))
            (push ov sperry-linum-overlays)
            (overlay-put ov 'before-string
                         (propertize " " 'display `((margin left-margin) ,str)))
            (overlay-put ov 'sperry-linum-str str))))
      ;; Text may contain those nasty intangible properties, but that
      ;; shouldn't prevent us from counting those lines.
      (let ((inhibit-point-motion-hooks t))
        (forward-line))
      (setq line (1+ line)))
    (set-window-margins win width (cdr (window-margins win)))))

(defun sperry-linum-after-change (beg end len)
  ;; update overlays on deletions, and after newlines are inserted
  (when (or (= beg end)
            (= end (point-max))
            (string-match-p "\n" (buffer-substring-no-properties beg end)))
    (sperry-linum-update-current)))

(defun sperry-linum-after-scroll (win start)
  (sperry-linum-update (window-buffer win)))

;; (defun sperry-linum-after-size (frame)
;;   (sperry-linum-after-config))

(defun sperry-linum-schedule ()
  ;; schedule an update; the delay gives Emacs a chance for display changes
  (run-with-idle-timer 0 nil #'sperry-linum-update-current))

;; (defun sperry-linum-after-config ()
;;   (walk-windows (lambda (w) (sperry-linum-update (window-buffer w))) nil 'visible))

(defun sperry-linum-unload-function ()
  "Unload the Linum library."
  (global-sperry-linum-mode -1)
  ;; continue standard unloading
  nil)

(provide 'sperry-linum)

;;; linum.el ends here
