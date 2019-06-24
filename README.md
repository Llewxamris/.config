Configuration files and scripts. Goals include keeping a common look
and feel within both the applications in question, but also within
their configuration files. This means that:

- Applications should share a common colour scheme, font, key binds,
etc.
  - Colour scheme is [Nord][0]
  - Font is currently determined by the terminal application. Right
  now I am using the [Gnome Terminal][1] and the [Go Mono][2] font
- Configuration files share a common layout
  - Large header on top
  - Common lines grouped together inside clearly defined sections
  - Sections use `vim` markers for easy folding

Comments are used both to explain what the results are of a line or
a series of lines, and to explain why that result is desired.

All configuration files are meant to be stored within the default
[Freedesktop.org][3] configuration directory of `$HOME/.config/` under a
sub-directory of the applications name.

## ./fish/fish.config
The [Friendly Interactive Shell][4]--or fish--is a shell for Unix-like
operating systems that comes out-of-the-box with sane, 21st century
defaults. Unlike Bash, one does not require a [complex shell script][5]
to show Git information. Unlike Zsh, one does not need a [large
framework of plugins][6] just to be usable.

So far, moving from Bash to Fish has only improved my workflow.
However, I still write any shell scripts in `sh` or Bash. I would
not install Fish on any server. Lighter shells do fine in that
scenario.

The `fish.config` contains my environment variables, as well as `git`
abbreviations, file system bookmarks, and custom functions (mostly
used as aliases). It also contains a customized shell prompt.


## ./nvim/init.vim
[Neovim][7] is an attempt at modernizing the extremely popular text editor
, Vim. As long as Neovim continues to innovate without straying away
from the core of what makes Vim great, I don't see a reason to go
back to Vim.

I try to limit the amount of plugins I rely on for day-to-day use.
That said, [`coc.nvim`][8] is the opposite of _minimal_ and drastically
shifts Neovim towards being an IDE instead of just a text editor.

The `neovim.config` file contains some general settings based on
my personal preference, mappings & remappings, and visual changes.

## ./tmux/tmux.conf 
`tmux` is a terminal multiplexer. It is an essential part of my
workflow. The ability to manage several terminal instances within
one terminal application has become essential for me. Having every
project within it's own `tmux` session--containing workspaces, 
running containers, running servers--makes managing context an
absolute breeze.

Only two plugins are used at this moment. The package manager itself,
and the Nord theme plugin.

The `tmux.config` file contains several general, personal preference,
settings and key binds.

# $HOME/bin/setup.sh
A shell script to recreate my environment from a fresh Arch Linux
installation. It was being created to help manage moving from
Ubuntu to Arch Linux. However, I have abandoned that transition
simply due to time.

# License
All files are free to use regardless of purpose. See UNLICENSE for more
information.

[0]:https://www.nordtheme.com/
[1]:https://wiki.gnome.org/Apps/Terminal
[2]:https://blog.golang.org/go-fonts
[3]:https://www.freedesktop.org/wiki/
[4]:https://fishshell.com/
[4]:https://fishshell.com/
[5]:https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
[6]:https://ohmyz.sh/
[7]:https://neovim.io/
[8]:https://github.com/neoclide/coc.nvim
