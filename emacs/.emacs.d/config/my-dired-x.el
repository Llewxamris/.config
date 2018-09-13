(put 'dired-find-alternate-file 'disabled nil)

;; -k :: Default to 1024-byte blocks for disk usage
;; -a :: Do not ignore entries starting with .
;; -B :: Do not list implied entires ending with ~
;; -h :: Human readable sizes
;; -l :: Use a long listing format
(setq dired-listing-switches "-kaBhl --group-directories-first")

(use-package dired-x
  :init
  (progn
    (defun my-dired-up-directory ()
      "Take dired up one directory, but behave like dired-find-alternate-file"
      (interactive)
      (let ((old (current-buffer)))
	(dired-up-directory)
	(kill-buffer old)))
	   (evil-define-key 'normal dired-mode-map "h" 'dired-up-directory)
	   (evil-define-key 'normal dired-mode-map "l" 'dired-find-alternate-file)
	   (evil-define-key 'normal dired-mode-map "o" 'dired-sort-toggle-or-edit)
	   (evil-define-key 'normal dired-mode-map "v" 'dired-toggle-marks)
	   (evil-define-key 'normal dired-mode-map "m" 'dired-mark)
	   (evil-define-key 'normal dired-mode-map "u" 'dired-unmark)
	   (evil-define-key 'normal dired-mode-map "U" 'dired-unmark-all-marks)
	   (evil-define-key 'normal dired-mode-map "c" 'dired-create-directory)
	   (evil-define-key 'normal dired-mode-map "n" 'evil-search-next)
	   (evil-define-key 'normal dired-mode-map "N" 'evil-search-previous)
	   (evil-define-key 'normal dired-mode-map "q" 'kill-this-buffer)
	   (evil-define-key 'normal dired-mode-map "h" 'my-dired-up-directory)))

(provide 'my-dired-x)
