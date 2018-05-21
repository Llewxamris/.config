# Title: BASH Configuration File
# Author: Maxwell Haley
# Description: My personal configuration for BASH.
# Special thanks to the following guide:
# - Mattia Tezzele's "bash-sensible": https://github.com/mrzool/bash-sensible/

PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/bin:/usr/games:/home/max/.local/bin:/usr/sbin:/sbin
SHELL=/bin/bash
EDITOR=/usr/bin/vim
export EDITOR

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# General Options {{{
# Prevent file overwrite on stdout redirection
# USe '>|' to force redirection
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Automatically trim long paths
PROMPT_DIRTRIM=2

# Enable Brace ({}) expansion
# Alows the use of ranges when creating files
# `touch page{01..10}.txt` makes page01.txt, page02.txt, ..., page10.txt
# Can be used with raw strings
# `touch {index,about,faq}.html`
set +B

# Enable history expansion with space
bind Space:magic-space

# Turn on recursive globbing (** to recurese all directories)
shopt -s globstar 2> /dev/null

# Case-insensitive globbing
shopt -s nocaseglob
# }}}

# Smarter Tab-Completion {{{
bind "set completion-ignore-case on"

# Treat '-' and '_' as equivalent
bind "set completion-map-case on"

# Display matches for ambiguous patterns at first tab press"
bind "set show-all-if-ambiguous on"

# Add trailing slash when autocompleting symlinks to directories
bind "set mark-symlinked-directories on"
# }}}

# History {{{
# append to the history file, don't overwrite it
shopt -s histappend

# Save multi-line commands as one command
shopt -s cmdhist

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

# Giant history size
HISTSIZE=500000
HISTFILESIZE=100000

# Avoid duplicates
HISTCONTROL="erasedups:ignoreboth"

# Use ISO 8601 timestamp
HISTTIMEFORMAT='%F %T '
# }}}

# Navigation {{{
# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null

# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null

#Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# Bookmarks
shopt -s cdable_vars
export dotfiles="$HOME/git/dotfiles"
# }}}

# Aliases {{{
# Enable color support
alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alert alias for long running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# q to close terminal
alias q='exit'

# pacaur aliases
# alias pin='pacaur -S'
# alias pup='pacaur -Syu'
# alias pud='pacaur -Syu --devel'
# alias pre='pacaur -R'

alias term='gnome-terminal --hide-menubar'

alias mandom='apropos . | shuf -n 1 | awk "{print $1}" | xargs man'
# }}}

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Android Studio executable
alias android-studio='~/bin/android-studio/bin/studio.sh >> /dev/null 2>&1 &'

# Full system upgrade Debian
alias uu='sudo apt update && sudo apt upgrade && sudo apt autoremove'

# Launch man pages in vim using vman $PAGENAME
vman() {
    if vim -c "SuperMan $*"; then
        echo "No manual entry for $*"
    fi
}


PS1="\n\[\033[38;5;13m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;14m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\]\n\[$(tput sgr0)\]\[\033[38;5;9m\]>\[$(tput sgr0)\]\[\033[38;5;11m\]>\[$(tput sgr0)\]\[\033[38;5;10m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
# vim:foldmethod=marker:foldlevel=0
