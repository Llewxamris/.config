;; evil-leader: <leader> key for evil
;; https://github.com/cofi/evil-leader
(use-package evil-leader
  :commands (evil-leader-mode)
  :ensure evil-leader
  :demand evil-leader
  :init
  (global-evil-leader-mode)
  :config
  (progn
    (evil-leader/set-leader ",")
    (evil-leader/set-key "w" 'save-buffer)
    (evil-leader/set-key "q" 'kill-buffer-and-window)
    (evil-leader/set-key "h" 'dired-jump)
    (evil-leader/set-key "t" 'dired)
    (evil-leader/set-key "v" 'split-window-right)
    (evil-leader/set-key "e" 'pp-eval-last-sexp)
    (evil-leader/set-key "," 'other-window)
    (evil-leader/set-key "b" 'ibuffer)
    (evil-leader/set-key "x" 'helm-M-x)
    (evil-leader/set-key "a" 'org-agenda)
    (evil-leader/set-key "c" 'org-capture)))

;; evil - The extensible vi layer for Emacs.
;; https://github.com/emacs-evil/evil
(use-package evil
  :ensure evil
  :config
  (progn
    (evil-mode 1)
    (define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
    (define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
    (define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
    (define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)))

(provide 'my-evil)
