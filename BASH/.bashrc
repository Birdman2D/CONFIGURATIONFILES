#!/bin/bash --noexec
# This will cause Bash to check the syntax of the script without actually executing it.
export TZ="Pacific/Auckland"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	# shellcheck disable=SC2015
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	#alias dir='dir --color=auto'
	#alias vdir='vdir --color=auto'

	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# shellcheck disable=SC1091
if [ -f "$HOME/.bash_aliases" ]; then
	. "$HOME/.bash_aliases"
fi

# kubectl
#  shellcheck disable=SC1090
source <(kubectl completion bash) # set up autocomplete in bash into the current shell, bash-completion package should be installed first.

# kubeon
# shellcheck disable=SC1091
source kube_ps1

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		# shellcheck disable=SC1091
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		# shellcheck disable=SC1091
		. /etc/bash_completion
	fi
fi

gb() {
	git branch 2>/dev/null | awk '/^\*/{ORS=""; print $2}'
}
git_branch() {
	echo -n '(' && gb && echo -n ')'
}

# Update the PS1 / Prompt String 1 (a.k.a the bash prompt) with the git branch plus the
# Kubernetes context and namespace where appropriate
# e.g. vagrant:~/cip (main)(⎈ |apif_dev:default)$
PS1='\u:\w \[\e[32m\]$(git_branch)\[\e[0m\]$(kube_ps1)$ '

# Turn kube info off by default - turn it on by calling kubeon
kubeoff

# Add python stuff to path
export PATH=$PATH:$HOME/.local/bin
