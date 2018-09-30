;;; linum-relative: Vim-like relative line numbers
;;; https://github.com/coldnew/linum-relative
(use-package linum-relative
  :ensure linum-relative
  :init
  (linum-relative-global-mode 1))

;;; atom-one-dark-theme: An Emacs port of the Atom One Dark theme from Atom.io.
;;; https://github.com/jonathanchu/atom-one-dark-theme
(use-package atom-one-dark-theme
  :ensure atom-one-dark-theme
  :config
  (progn
    (unless noninteractive
      (load-theme 'atom-one-dark t))))

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

;; Set font
(add-to-list 'default-frame-alist '(font . "Hack-10"))

(provide 'my-lookfeel)
