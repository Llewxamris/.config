;;; slime - The Superior Lisp Interaction Mode for Emacs
;;; https://github.com/slime/slime
(use-package slime
  :ensure t
  :config
  (progn
    (setq slime-contribs '(slime-fancy))
    (setq inferior-lisp-program "/usr/bin/sbcl")))

(provide 'my-lisp)
