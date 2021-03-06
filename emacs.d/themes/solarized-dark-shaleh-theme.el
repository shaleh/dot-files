(deftheme solarized-dark-shaleh
  "Created 2017-08-11.")

(custom-theme-set-variables
 'solarized-dark-shaleh
 )

(custom-theme-set-faces
 'solarized-dark-shaleh
 '(cursor ((t (:foreground "#002b36" :background "#839496"))))
 '(error ((t (:weight bold :slant normal :underline nil :inverse-video nil :foreground "#dc322f"))))
 '(fringe ((t (:foreground "#586e75" :background "#073642"))))
 '(linum ((t (:foreground "#586e75" :background "#073642"))))
 '(header-line ((t (:foreground "#839496" :background "#073642" :weight normal :slant normal :underline nil :inverse-video t))))
 '(highlight ((t (:background "#073642"))))
 '(hl-line ((t (:underline nil :background "#073642"))))
 '(isearch ((t (:weight normal :slant normal :underline nil :inverse-video t :foreground "#cb4b16" :background "#002b36"))))
 '(isearch-fail ((t (:weight normal :slant normal :underline nil :inverse-video t :foreground "#cb4b16" :background "#002b36"))))
 '(lazy-highlight ((t (:weight normal :slant normal :underline nil :inverse-video t :foreground "#b58900" :background "#002b36"))))
 '(match ((t (:weight normal :slant normal :underline nil :inverse-video t :foreground "#b58900" :background "#002b36"))))
 '(link ((t (:weight normal :slant normal :underline t :inverse-video nil :foreground "#6c71c4"))))
 '(link-visited ((t (:weight normal :slant normal :underline t :inverse-video nil :foreground "#d33682"))))
 '(menu ((t (:foreground "#839496" :background "#073642"))))
 '(minibuffer-prompt ((t (:weight bold :slant normal :underline nil :inverse-video nil :foreground "#2aa198"))))
 '(mode-line ((t (:foreground "#93a1a1" :background "#073642" :weight normal :slant normal :underline nil :inverse-video t :box nil))))
 '(mode-line-inactive ((t (:foreground "#657b83" :background "#073642" :weight normal :slant normal :underline nil :inverse-video t :box nil))))
 '(region ((t (:foreground "#586e75" :background "#002b36" :weight normal :slant normal :underline nil :inverse-video t))))
 '(secondary-selection ((t (:background "#073642"))))
 '(shadow ((t (:foreground "#586e75"))))
 '(trailing-whitespace ((t (:weight normal :slant normal :underline nil :inverse-video t :foreground "#dc322f"))))
 '(vertical-border ((t (:foreground "#839496"))))
 '(comint-highlight-prompt ((t (:foreground "#268bd2"))))
 '(compilation-info ((t (:weight bold :slant normal :underline nil :inverse-video nil :foreground "#859900"))))
 '(compilation-warning ((t (:weight bold :slant normal :underline nil :inverse-video nil :foreground "#cb4b16"))))
 '(custom-button ((t (:foreground "#93a1a1" :background "#073642" :box (:line-width 2 :style released-button)))))
 '(custom-button-mouse ((t (:weight normal :slant normal :underline nil :inverse-video t :foreground "#93a1a1" :background "#073642" :inherit custom-button))))
 '(custom-button-pressed ((t (:weight normal :slant normal :underline nil :inverse-video t :foreground "#93a1a1" :background "#073642" :box (:line-width 2 :style pressed-button) :inherit custom-button-mouse))))
 '(custom-changed ((t (:weight normal :slant normal :underline nil :inverse-video t :foreground "#268bd2" :background "#fdf6e3"))))
 '(custom-comment ((t (:foreground "#93a1a1" :background "#073642"))))
 '(custom-comment-tag ((t (:foreground "#93a1a1" :background "#073642"))))
 '(custom-documentation ((t (:inherit default))))
 '(custom-group-tag ((t (:foreground "#93a1a1"))))
 '(custom-group-tag-1 ((t ((:weight bold :slant normal :underline nil :inverse-video nil) :foreground "#93a1a1"))))
 '(custom-invalid ((t (:weight normal :slant normal :underline nil :inverse-video t :foreground "#dc322f" :background "#002b36"))))
 '(custom-link ((t (:foreground "#6c71c4"))))
 '(custom-state ((t (:foreground "#859900"))))
 '(custom-variable-tag ((t (:foreground "#93a1a1"))))
 '(ido-only-match ((t (:foreground "#859900"))))
 '(ido-subdir ((t (:foreground "#268bd2"))))
 '(ido-first-match ((t (:weight bold :slant normal :underline nil :inverse-video nil :foreground "#859900"))))
 '(eshell-ls-archive ((t (:foreground "#d33682"))))
 '(eshell-ls-backup ((t (:foreground "#b58900"))))
 '(eshell-ls-clutter ((t (:foreground "#cb4b16"))))
 '(eshell-ls-directory ((t (:foreground "#268bd2"))))
 '(eshell-ls-executable ((t (:foreground "#859900"))))
 '(eshell-ls-missing ((t (:foreground "#dc322f"))))
 '(eshell-ls-product ((t (:foreground "#b58900"))))
 '(eshell-ls-readonly ((t (:foreground "#93a1a1"))))
 '(eshell-ls-special ((t (:foreground "#6c71c4"))))
 '(eshell-ls-symlink ((t (:foreground "#2aa198"))))
 '(eshell-ls-unreadable ((t (:foreground "#657b83"))))
 '(eshell-prompt ((t (:weight bold :slant normal :underline nil :inverse-video nil :foreground "#859900"))))
 '(font-lock-builtin-face ((t (:weight normal :slant normal :underline nil :inverse-video nil :foreground "#859900"))))
 '(font-lock-comment-face ((t (:foreground "#586e75" :inverse-video nil :underline nil :weight normal))))
 '(font-lock-constant-face ((t (:weight normal :slant normal :underline nil :inverse-video nil :foreground "#2aa198"))))
 '(font-lock-function-name-face ((t (:weight normal :slant normal :underline nil :inverse-video nil :foreground "#268bd2"))))
 '(font-lock-keyword-face ((t (:weight normal :slant normal :underline nil :inverse-video nil :foreground "#859900"))))
 '(font-lock-string-face ((t (:weight normal :slant normal :underline nil :inverse-video nil :foreground "#2aa198"))))
 '(font-lock-type-face ((t (:weight normal :slant normal :underline nil :inverse-video nil :foreground "#b58900"))))
 '(font-lock-variable-name-face ((t (:weight normal :slant normal :underline nil :inverse-video nil :foreground "#268bd2"))))
 '(font-lock-warning-face ((t (:weight bold :slant normal :underline nil :inverse-video nil :foreground "#dc322f"))))
 '(font-lock-doc-face ((t (:foreground "#586e75" :inverse-video nil :underline nil :weight normal))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#586e75" :inverse-video nil :underline nil :weight normal))))
 '(font-lock-preprocessor-face ((t (:weight normal :slant normal :underline nil :inverse-video nil :foreground "#cb4b16"))))
 '(font-lock-negation-char-face ((t (:weight normal :slant normal :underline nil :inverse-video nil :foreground "#dc322f"))))
 '(font-lock-regexp-grouping-construct ((t (:weight normal :slant normal :underline nil :inverse-video nil :foreground "#cb4b16"))))
 '(font-lock-regexp-grouping-backslash ((t (:weight normal :slant normal :underline nil :inverse-video nil :foreground "#b58900"))))
 '(info-xref ((t (:weight normal :slant normal :underline t :inverse-video nil :foreground "#268bd2"))))
 '(info-xref-visited ((t (:foreground "#d33682" :inherit info-xref))))
 '(speedbar-button-face ((t (:weight normal :slant normal :underline nil :inverse-video nil :foreground "#93a1a1"))))
 '(speedbar-directory-face ((t (:weight normal :slant normal :underline nil :inverse-video nil :foreground "#cb4b16"))))
 '(speedbar-file-face ((t (:weight normal :slant normal :underline nil :inverse-video nil :foreground "#859900"))))
 '(speedbar-highlight-face ((t (:background "#073642"))))
 '(speedbar-selected-face ((t (:weight normal :slant normal :underline t :inverse-video nil :foreground "#b58900"))))
 '(speedbar-separator-face ((t (:weight normal :slant normal :underline nil :inverse-video t))))
 '(speedbar-tag-face ((t (:weight normal :slant normal :underline nil :inverse-video nil :foreground "#268bd2"))))
 '(show-paren-match ((t (:weight bold :slant normal :underline nil :inverse-video nil :foreground "#2aa198" :background "#073642"))))
 '(show-paren-mismatch ((t (:weight bold :slant normal :underline nil :inverse-video nil :foreground "#dc322f" :background "#586e75"))))
 '(widget-field ((t (:foreground "#93a1a1" :background "#073642" :box (:line-width 1) :inherit default))))
 '(widget-single-line-field ((t (:inherit widget-field))))
 '(flymake-errline ((t (:weight normal :slant normal :underline nil :inverse-video t :foreground "#dc322f" :background "#002b36"))))
 '(flymake-warnline ((t (:weight bold :slant normal :underline nil :inverse-video nil :foreground "#dc322f" :background "#002b36"))))
 '(message-mml ((t (:foreground "#268bd2"))))
 '(message-cited-text ((t (:foreground "#eee8d5"))))
 '(message-separator ((t (:foreground "#fdf6e3"))))
 '(message-header-xheader ((t (:foreground "#6c71c4"))))
 '(message-header-name ((t (:foreground "#2aa198"))))
 '(message-header-other ((t (:foreground "#dc322f"))))
 '(message-header-newsgroups ((t (:weight bold :underline nil :inverse-video nil :foreground "#b58900"))))
 '(message-header-subject ((t (:foreground "#657b83"))))
 '(message-header-cc ((t (:weight bold :slant normal :underline nil :inverse-video nil :foreground "#859900"))))
 '(message-header-to ((t (:weight bold :slant normal :underline nil :inverse-video nil :foreground "#93a1a1"))))
 '(flyspell-incorrect ((t (:foreground "#dc322f"))))
 '(flyspell-duplicate ((t (:foreground "#b58900"))))
 '(term-color-black ((t (:foreground "#073642"))))
 '(term-color-red ((t (:foreground "#dc322f"))))
 '(term-color-green ((t (:foreground "#859900"))))
 '(term-color-yellow ((t (:foreground "#b58900"))))
 '(term-color-blue ((t (:foreground "#268bd2"))))
 '(term-color-magenta ((t (:foreground "#d33682"))))
 '(term-color-cyan ((t (:foreground "#2aa198"))))
 '(term-color-white ((t (:foreground "#657b83"))))
 '(default ((t (:foreground "#839496" :background "#002b36")))))

(provide-theme 'solarized-dark-shaleh)
