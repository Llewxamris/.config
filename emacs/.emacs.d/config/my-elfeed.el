;;; elfeed-org: Configure the Elfeed RSS reader with an Orgmode file
;;; https://github.com/remyhonig/elfeed-org
(use-package elfeed-org
  :ensure elfeed-org
  :config
  (progn
    (elfeed-org)
    (setq rmh-elfeed-org-files (list (concat org-directory "/rss.org")))
    ;; The only custom bindings are `j` and `k`, the others are just
    ;; enabling default bindings in evil.
    (evil-define-key 'normal elfeed-search-mode-map
      (kbd "q") 'elfeed-search-quit-window
      (kbd "g") 'elfeed-search-update--force
      (kbd "G") 'elfeed-search-fetch
      (kbd "s") 'elfeed-search-live-filter
      (kbd "S") 'elfeed-search-set-filter
      (kbd "l") 'elfeed-search-browse-url
      (kbd "y") 'elfeed-search-yank
      (kbd "u") 'elfeed-search-tag-all-unread
      (kbd "r") 'elfeed-search-untag-all-unread
      (kbd "j") 'next-line
      (kbd "k") 'previous-line
      (kbd "+") 'elfeed-search-tag-all
      (kbd "-") 'elfeed-search-untag-all)))

;;; elfeed: An Emacs web feeds client
;;; https://github.com/skeeto/elfeed
(use-package elfeed
  :ensure t)

(provide 'my-elfeed)
