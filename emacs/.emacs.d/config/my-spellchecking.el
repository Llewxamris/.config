;; flyspell - On-the-fly spell checking in Emacs
;; http://www-sop.inria.fr/members/Manuel.Serrano/flyspell/flyspell.html
;; This package is installed manually
(use-package flyspell
  :ensure flyspell
  :config
  (add-hook 'markdown-mode-hook 'flyspell-mode))

;; popop - Visual Popup Interface Library for Emacs
;; https://github.com/auto-complete/popup-el
;; Custom keys not yet working
(use-package popup
  :ensure popup
  :config
  (evil-define-key 'normal popup-menu-keymap
    (kbd "j") 'popup-next
    (kbd "k") 'popup-previous))

;; flyspell-correct-popup - Correcting words with flyspell via custom interface.
;; https://github.com/d12frosted/flyspell-correct
(use-package flyspell-correct-popup
  :ensure flyspell-correct-popup
  :config
  (evil-leader/set-key "z" 'flyspell-correct-previous-word-generic))

;; auto-dictionaryEmacs: Automatic dictionary switcher for flyspell 
;; https://github.com/nschum/auto-dictionary-mode
(use-package auto-dictionary
  :ensure auto-dictionary
  :config
  (add-hook 'flyspell-mode-hook 'auto-dictionary-mode))

(provide 'my-spellchecking)
