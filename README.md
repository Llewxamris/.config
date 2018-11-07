# Llewxamris' DotFiles
Collection of my personal config files. Built over time, on the backs of giants,
entirely based on my own needs. 

## bash/
Contains several QoL improvements to Bash, as well as personal alias'. Most of the
improvements comes from Mattia Tezzele's _bash-sensible_: https://github.com/mrzool/bash-sensible/
Includes better tab-completion, better history, and anti-clobbering. PS1 prompt includes the current
directory, and shows the `git` branch if applicable.

## emacs/
Emacs configuration, centered around `evil-mode`. Borrowing most packages from Spacemacs, but
implementing them on my own for a deeper understanding of my setup. `org-mode` configuration
inspired by Brent Hansen's fabulous `org-mode` document: http://doc.norang.ca/org-mode.html

`config/` contains configuration for the packages, which are grouped together by purpose.
`config/languages/` contains configuration for packages concerning a specific programming
language.

## scripts/bin/
Contains various shell scripts that are used within my environment.

- `backlight.sh`: Manipulates the backlight of my laptops monitor
- `git-prompt.sh`: Used for PS1 `git` information. Copyright © Shawn O. Pearce

## suckless/
Contains patches for `dwm`, `slstatus`, and `st`.

- `dwm.patch`: Sets the font and colourscheme of `dmenu` and the status bar.
  Also contains keymapping for laptop media keys
- `slstatus.patch`: Configures the status bar of `dwm`
- `st.patch`: Sets the font and colourscheme

## tmux/
Just sets `tmux` to use true-colour.

## vim/
Vim configuration. Slowly being deprecated for Emacs. Will eventually be replaced by `microvimrc`.

# License
All files are free to use regardless of purpose. See UNLICENSE for more
information.
