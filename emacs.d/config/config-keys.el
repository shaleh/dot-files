(require 'my-functions)

; Need these for busted remote sessions
(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])
(define-key input-decode-map "\e\e[1~" [(meta home)])
(define-key input-decode-map "\e\e[4~" [(meta end)])

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "<end>") 'end-of-line)
(global-set-key (kbd "M-<home>") 'beginning-of-buffer)
(global-set-key (kbd "C-<home>") 'beginning-of-buffer)
(global-set-key (kbd "M-<end>") 'end-of-buffer)
(global-set-key (kbd "C-<end>") 'end-of-buffer)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "C-x C-r") 'my/recentf-ido-find-file)
(global-set-key (kbd "M-y") 'kill-ring-ido) ; replace usual kill-ring-pop
(global-set-key (kbd "M-<up>") 'my/move-line-up)
(global-set-key (kbd "M-<down>") 'my/move-line-down)
(global-set-key (kbd "C-c #") 'comment-region) ; use C-u C-c # to uncomment
(global-set-key (kbd "C-c e") 'my/eval-and-replace)
