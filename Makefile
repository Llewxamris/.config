.POSIX:
.SUFFIXES:
PREFIX = /home/max
DISTDIR = ./dist

EMACS = emacs
EMACSFLAGS = --batch --load=org --quick

COPY = cp
LINKFLAGS = --symbolic --force --relative

RM = rm
RMFLAGS = --recursive --force

SHELL=/bin/sh

TMUXDEST = .config/tmux/config.tmux
BASHDEST = .bashrc
BASHPROFDEST = .bash_profile
PROFILEDEST = .profile
LSCOLORSDEST = .local/share/lscolors.sh
SWAYDEST = .config/sway/config

.PHONY: all install alacritty bash tmux sway clean uninstall

all: alacritty bash sway tmux vim
install:
		$(SHELL) -c "./install.sh"
alacritty:
		$(EMACS) $(EMACSFLAGS) --eval '(org-babel-tangle-file "alacritty.org")'
bash:
		$(EMACS) $(EMACSFLAGS) --eval '(org-babel-tangle-file "bash.org")'
tmux:
		$(EMACS) $(EMACSFLAGS) --eval '(org-babel-tangle-file "tmux.org")'
sway:
		$(EMACS) $(EMACSFLAGS) --eval '(org-babel-tangle-file "sway.org")'
vim:
		$(EMACS) $(EMACSFLAGS) --eval '(org-babel-tangle-file "vim.org")'
clean:
		$(RM) $(RMFLAGS) $(DISTDIR)
uninstall:
		$(RM) $(RMFLAGS) $(PREFIX)/$(FISHDEST)
		$(RM) $(RMFLAGS) $(PREFIX)/$(TMUXDEST)
		$(RM) $(RMFLAGS) $(PREFIX)/$(BASHDEST)
		$(RM) $(RMFLAGS) $(PREFIX)/$(BASHPROFDEST)
		$(RM) $(RMFLAGS) $(PREFIX)/$(PROFILEDEST)
		$(RM) $(RMFLAGS) $(PREFIX)/$(LSCOLORSDEST)
		$(RM) $(RMFLAGS) $(PREFIX)/$(SWAYDEST)
