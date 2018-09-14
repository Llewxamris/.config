;; markdown-mode - Emacs Markdown Mode
;; https://github.com/jrblevin/markdown-mode
(use-package markdown-mode
  :ensure markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)))

(provide 'my-markdown)
