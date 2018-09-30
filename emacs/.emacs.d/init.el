;; Setup package management
(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)

(add-to-list 'load-path (concat user-emacs-directory "config"))
(add-to-list 'load-path (concat user-emacs-directory "config" "/languages"))
(add-to-list 'load-path (concat user-emacs-directory "packages"))

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("org" . "http://orgmode.org/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (elfeed-org org-bullets evil-org flycheck flyspell-correct-popup markdown-mode auto-dictionary auto-dictionary-mode magit dired-x evil-leader elisp-slime-nav linum-relative evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; require custom packages
(require 'my-evil)
(require 'my-dired-x)
(require 'my-ibuffer)
(require 'my-lookfeel)
(require 'my-magit)
(require 'my-spellchecking)
(require 'my-flycheck)
(require 'my-org)
(require 'my-elfeed)

;; Language Support
(require 'my-markdown)

;; Better Eisp
(require 'elisp-slime-nav)

(defun my-lisp-hook ()
  (elisp-slime-nav-mode)
  (turn-on-eldoc-mode)
  )

(add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)
(evil-define-key 'normal emacs-listp-mode-map (kbd "K")
  'elisp-slime-nav-describe-elisp-thing-at-point)

(provide 'init)
