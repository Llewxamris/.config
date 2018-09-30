(use-package org
  :ensure org
  :commands (org-mode org-capture org-agenda orgtbl-mode)
  :init
  (progn
    ;; Auto-enter org-mode on files matching *.org
    (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
    ;; Set the org-agenda to read from the follow directory
    (setq org-agenda-files (list "~/nc/doc/org"))
    (setq org-directory "~/nc/doc/org")
    ;; Add a timestamp whenever a task is set to done
    (setq org-log-done 'time)
    ;; Use `inbox.org` when capturing
    (setq org-default-notes-file (concat org-directory "/inbox.org"))
    ;; Activiate the following org-modules
    (setq org-modules '(org-habit))
    ;; Set keywords and quick access keys
    (setq org-todo-keywords
	  (quote ((sequence "APPOINTMENT(a)" "TODO(t)" "WIP(p)" "|" "DONE(d)")
		  (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))
    ;; Enable fast todo selection
    (setq org-use-fast-todo-selection t)
    ;; Define org-capture templates
    ;; %? - Starting cursor position
    ;; %U - Insert an inactive timestamp
    (setq org-capture-templates
	  (quote (("t" "todo" entry (file (concat org-directory "/inbox.org"))
		  "* TODO %?\n%U\n")
		 ("c" "calendar" entry (file+headline (concat org-directory "/todo.org") "Calendar")
		  "*%?\n%U\n")
		 ("a" "appointment" entry (file+headline (concat org-directory "/todo.org") "Calendar")
		  "* APPOINTMENT %?\n%U\n")
		 ("n" "note" entry (file (concat org-directory "/inbox.org"))
		  "* %?\n%U\n"))))))

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
