;; linum-relative: Vim-like relative line numbers
;; https://github.com/coldnew/linum-relative
(use-package linum-relative
  :ensure linum-relative
  :init
  (linum-relative-global-mode 1))

;; Disable the intro screen & message
(setq inhibit-splash-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;; Sane line wrapping
(visual-line-mode 1)

;; Always trail newline
(setq require-final-newline t)

;; Disable the toolbar
(tool-bar-mode -1)

(provide 'my-lookfeel)
