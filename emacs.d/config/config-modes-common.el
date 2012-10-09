(require 'my-macros)

(WhenEmacsOlderThan 23 2
  (when (not (fboundp 'global-subword-mode))
    (require 'subword)
   )
 )

(show-paren-mode 1)

(setq
      global-subword-mode 1
      search-highlight t         ;; highlight when searching
      query-replace-highlight t  ;; and replacing
 )
(setq-default indent-tabs-mode nil)
(setq-default show-trailing-whitespace t)

(setq auto-save-list-file-prefix (concat user-emacs-directory "state/auto-save-list/.saves-"))

;; hl-line: highlight the current line
(when (fboundp 'global-hl-line-mode)
  (global-hl-line-mode t)
 )

(SetWhenEmacsOlderThan 22 1 'disabled-command-hook nil)

(WhenEmacsNewerThan 22 1
  (setq disabled-command-function nil)
 )

(require 'ido)
(ido-mode 'both) ;; for buffers and files
(setq
  ido-save-directory-list-file (concat user-emacs-directory "state/ido.last")
  ido-enable-tramp-completion nil
  ido-case-fold  t
  ido-enable-last-directory-history t
  ido-max-work-directory-list 30
  ido-max-work-file-list      50
  ido-use-filename-at-point nil
  ido-use-url-at-point nil
  ido-enable-flex-matching nil
  ido-confirm-unique-completion t
 )
(require 'kill-ring-ido)

(require 'fic-mode)
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(require 'recentf)
(recentf-mode t)
(setq recentf-save-file (concat user-emacs-directory "state/recentf"))

(WhenOSX
   (setq ispell-program-name "/usr/local/bin/aspell")
 )

(autoload 'ediff-trees "ediff-trees" "ediff-trees" t)
(autoload 'pwsafe "pwsafe" "load pwsafe" t)

(add-to-list 'auto-mode-alist '("\\.dot\\'" . graphviz-dot-mode))
(add-to-list 'auto-mode-alist '("\\.hex\\'" . hexl-mode))

(autoload 'ack "my-ack" "my ack function" t)
(autoload 'magit-status "magit" nil t)

(add-hook 'text-mode-hook (lambda () (flyspell-mode 1)))

(defun my/enable-tab-mode ()
  (interactive)
  (setq indent-tabs-mode t))

(defun my/mk-tab-width-4 ()
  (interactive)
  (setq-default tab-width 4))


;; Change cutting behavior:
;; "Many times you'll do a kill-line command with the only intention of
;; getting the contents of the line into the killring. Here's an idea stolen
;; from Slickedit, if you press copy or cut when no region is active, you'll
;; copy or cut the current line."
;; <http://www.zafar.se/bkz/Articles/EmacsTips>
(defadvice kill-ring-save (before slickcopy activate compile)
  "When called interactively with no active region, copy the current line instead."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2))
     )
   )
  )

(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill the current line instead."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2))
     )
   )
  )

(defvar my/indented-modes '())

;; auto-indent pasted code
(defadvice yank (after indent-region activate)
  (if (member major-mode my/indented-modes)
      (indent-region (region-beginning) (region-end) nil)
    )
  )

(defadvice yank-pop (after indent-region activate)
  (if (member major-mode my/indented-modes)
      (indent-region (region-beginning) (region-end) nil)
    )
  )
