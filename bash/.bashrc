#!/bin/bash
# Title: BASH Configuration File
# Author: Maxwell Haley
# Description: My personal configuration for BASH.
# Special thanks to the following guide:
# - Mattia Tezzele's "bash-sensible": https://github.com/mrzool/bash-sensible/

GOPATH=/home/max/go
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/bin:/usr/games:/home/max/.local/bin:/usr/sbin:/sbin:$GOPATH/bin:/home/max/bin:/snap/bin:/home/max/.cargo/bin
SHELL=/bin/bash
EDITOR=/usr/bin/vim
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
ANDROID_HOME=/usr/local/android-studio/sdk/
TERM=xterm-256color
ANT_HOME=/.ant

export JAVA_HOME
export ANDROID_HOME
export SHELL
export EDITOR
export TERM
export ANT_HOME
export PROFILE


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

# Man based completion
source /etc/bash_completion
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
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# ls
# alias ls='ls --color=auto --group-directories-first'
# alias l='ls -C --ignore-backups'
# alias ll='ls -alF'
# alias la='ls -A'
alias ls='exa --colour=automatic --colour-scale --group-directories-first'
alias l='ls --git-ignore --ignore-glob=*~'
alias la='l --all'
alias ll='ls --long --modified --git --time-style=long-iso --header'
alias lla='ll --all'

# Alert alias for long running commands
# q to close terminal
alias q='exit'

# Full system upgrade Debian
alias uu='sudo apt update && sudo apt upgrade && sudo apt autoremove'

# Create patch files for suckless programs
alias mkpatch-dwm='diff -u ~/src/dwm-6.1/config.def.h ~/src/dwm-6.1/config.h >| ~/git/dotfiles/suckless/dwm.patch'
alias mkpatch-slstatus='diff -u ~/src/slstatus/config.def.h ~/src/slstatus/config.h >| ~/git/dotfiles/suckless/slstatus.patch'
alias mkpatch-st='diff -u ~/src/st-0.8.1/config.def.h ~/src/st-0.8.1/config.h >| ~/git/dotfiles/suckless/st.patch'
# }}}

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# PS1 Prompt {{{
# Git Prompt info {{{
is_git_prompt_useful_here () {
	git rev-parse HEAD &> /dev/null || return 1

	return 0
}

parse_git_branch () {
	git branch | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

parse_git_ahead_behind () {
	local curr_branch
	local curr_remote
	local curr_merge_branch
	local count
	local ahead
	local behind
	local ab

	curr_branch=$(git rev-parse --abbrev-ref HEAD)
	curr_remote=$(git config branch.${curr_branch}.remote)

	# If the branch is local only, it won't have a remote
	[[ "$?" -gt 0 ]] && return 1

	curr_merge_branch=$(git config branch.${curr_branch}.merge | cut -d / -f 3)
	count=$(git rev-list --left-right --count ${curr_branch}...${curr_remote}/${curr_merge_branch} 2> /dev/null)

	# Might be the first commit which is not pushed yet
	[[ "$?" -gt 0 ]] && return 1

	ahead=$(printf "${count}" | cut -f1)
	behind=$(printf "${count}" | cut -f2)

	ab=''
	[[ "$ahead" -gt 0 ]] && ab+="⇡ ${ahead}"

	if [[ "$behind" -gt 0 ]]; then
		[[ -n "$ab" ]] && ab+="⇣ ${behind}" || ab+="⇣ ${behind}"
	fi

	[[ -n "$ab" ]] && printf "${ab}" || printf ''
}

parse_git_last_fetch () {
	local f
	local now
	local last_fetch

	f=$(git rev-parse --show-toplevel)
	now=$(date +%s)
	last_fetch=$(stat -f%m ${f}/.git/FETCH_HEAD 2> /dev/null || printf '')

	[[ -n "$last_fetch" ]] && [[ $(( now > (last_fetch + 15*60) )) -eq 1 ]] && printf '↯' || printf ''
}

parse_git_status () {
	local bits
	local dirty
	local deleted
	local untracked
	local newfile
	local ahead
	local renamed

	git status --porcelain | (
		unset dirty deleted untracked newfile ahead renamed
		while read -r line ; do
			case "$line" in
				'M'*)	dirty='m' ;;
				'UU'*)	dirty='u' ;;
				'D'*)	deleted='d' ;;
				'??'*)	untracked='t' ;;
				'A'*)	newfile='n' ;;
				'C'*)	ahead='a' ;;
				'R'*)	renamed='r' ;;
			esac
		done

		bits="$dirty$deleted$untracked$newfile$ahead$renamed"
		[[ -n "$bits" ]] && printf "${bits}" || printf ''
	)
}

gen_git_status () {
	local ahead_behind
	local fetch
	local status

	ahead_behind=$(parse_git_ahead_behind)
	fetch=$(parse_git_last_fetch)
	status=$(parse_git_status)

	[[ -n "$ahead_behind" ]] && [[ -n "$status" ]] && status+=" ${ahead_behind}" || status+="${ahead_behind}"
	[[ -n "$fetch" ]] && [[ -n "$status" ]] && status+=" ${fetch}" || status+="${fetch}"

	printf "${status}"
}
# }}}

generate_ps1() {
    local ec="$?"
    PS1=''

    # Colours
    local red='\e[1;31m\]'
    local green='\e[1;32m\]'
    local yellow='\e[0;33m\]'
    local blue='\e[0;34m\]'
    local purple='\e[0;35m\]'
    local bright_black='\e[1;30m\]'
    local clear='\e[0m\]'

    # Blocks
    local prompt
    local username
    local git=''

    # Set prompt colour to red if the last ran command failed
    if [[ "$ec" -eq 0 ]]; then
        prompt="$greenλ$clear"
    else
        prompt="$redλ$clear"
    fi

    # Make username red if running as root
    if [[ "$USER" != "root" ]]; then
        username="$yellow\\u"
    else
        username="$red\\u"
    fi

    is_git_prompt_useful_here
    if [[ "$?" -eq 0 ]]; then
    git="${bright_black}⊂ $(parse_git_branch) $(gen_git_status) ⊃"
    fi

    local path="${purple}⊂ ${username}@\\H:${blue}\\w ${purple}⊃"

    PS1="\\n$path $git\\n$prompt "
}

unset PS1
PROMPT_COMMAND=generate_ps1
# }}}
# vim:foldmethod=marker:foldlevel=0
