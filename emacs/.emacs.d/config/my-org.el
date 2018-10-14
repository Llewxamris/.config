;;; org: Your life in plain text
;;; https://orgmode.org/
(use-package org
  :ensure org
  :commands (org-mode org-capture org-agenda orgtbl-mode)
  :init
  (progn
    ;; Auto-enter org-mode on files matching *.org
    (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
    ;; Set the org-agenda to read from the follow directory
    (setq org-agenda-files (list "~/nc/doc/org/agenda"))
    (setq org-directory "~/nc/doc/org")
    ;; Add a timestamp whenever a task is set to done
    (setq org-log-done 'time)
    ;; Use `inbox.org` when capturing
    (setq org-default-notes-file (concat org-directory "/inbox.org"))
    ;; Activiate the following org-modules
    (setq org-modules '(org-habit))
    ;; Set keywords and quick access keys
    (setq org-todo-keywords
	  ;; Generic task sequence, including appointment keyword
	  (quote ((sequence "TODO(t)" "WIP(p)" "APPOINTMENT(a)" "|" "DONE(d)")
		  ;; Sequence for blocked tasks
		  (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)")
		  ;; Sequence for financial tasks
		  (sequence "EXPENSE(e)" "OVERDUE(o@/!)" "|" "PAID(p)"))))
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

;;; evil-org: Supplemental evil-mode keybindings to emacs org-mode
;;; https://github.com/Somelauw/evil-org-mode
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

;;; org-bullets: utf-8 bullets for org-mode
;;; https://github.com/sabof/org-bullets
(use-package org-bullets
  :ensure org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(provide 'my-org)
