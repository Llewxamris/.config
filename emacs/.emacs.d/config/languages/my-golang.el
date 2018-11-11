;;; go-mode: Emacs mode for the Go programming language
;;; https://github.com/dominikh/go-mode.el
(use-package go-mode
  :ensure t
  :config
  (progn
    (setq gofmt-command "goimports")
    (add-hook 'before-save-hook 'gofmt-before-save)))

;;; emacs-go-eldoc: eldoc for go language
;;; https://github.com/syohex/emacs-go-eldoc
(use-package go-eldoc
  :ensure t
  :config
  (progn
    (add-hook 'go-mode-hook 'go-eldoc-setup)))

;;; go-errcheck
;;; https://github.com/dominikh/go-errcheck.el
(use-package go-errcheck
  :ensure t)

(provide 'my-golang)
