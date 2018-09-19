(use-package org
  :ensure org
  :commands (org-mode org-capture org-agenda orgtbl-mode)
  :init
  (progn
    (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
    (setq org-agenda-files (list "~/nc/doc/org"))
    ;; Add a timestamp whenever a task is set to done
    (setq org-log-done 'time)
    (setq org-directory "~/nc/doc/org")
    ;; Use `inbox.org` when capturing
    (setq org-default-notes-file (concat org-directory "/inbox.org"))
    (setq org-modules '(org-habit))))

(use-package evil-org
  :ensure t
  :after org
  :config
  (progn
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)))

(use-package org-bullets
  :ensure org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(provide 'my-org)

