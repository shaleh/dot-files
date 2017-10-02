; Need these for busted remote sessions
(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])
(define-key input-decode-map "\e\e[1~" [(meta home)])
(define-key input-decode-map "\e\e[4~" [(meta end)])

(global-set-key (kbd "<home>")   'beginning-of-line)
(global-set-key (kbd "<end>")    'end-of-line)
(global-set-key (kbd "M-<home>") 'beginning-of-buffer)
(global-set-key (kbd "M-<end>")  'end-of-buffer)
(global-set-key (kbd "C-<home>") 'beginning-of-buffer)
(global-set-key (kbd "C-<end>")  'end-of-buffer)
(global-set-key (kbd "M-g")      'goto-line)
(global-set-key (kbd "M-<up>")   'shaleh-move-line-up)
(global-set-key (kbd "M-<down>") 'shaleh-move-line-down)
(global-set-key (kbd "C-a")      'mwim-beginning-of-code-or-line)
(global-set-key (kbd "C-r")      'isearch-backward-regexp)
(global-set-key (kbd "C-s")      'isearch-forward-regexp)
(global-set-key (kbd "C-c y")    'browse-kill-ring)
(global-set-key (kbd "C-c #")    'comment-dwim) ; use C-u C-c # to uncomment
(global-set-key (kbd "C-x a r")  'align-regexp)
(global-set-key (kbd "C-x C-m")  'execute-extended-command)
(global-set-key (kbd "C-x C-r")  'my/recentf-ido-find-file)
;; s is the Windows key aka super
(global-set-key (kbd "s-b")      'browse-url)
(global-set-key (kbd "s-g")      'google-this)
;; Stop flipping into overwrite mode!!
(global-unset-key [insert])
