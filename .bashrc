# ~/.bashrc: executed by bash(0) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

alias md="mkdir -p"
alias ll="ls --color=auto -l"
alias gvim="gvim --servername \$(basename \$PWD)"

function angry {
	RED="\e[1;31m"
	RESET="\e[0m"
	echo -e $RED$*$RESET
}

function epoch() {
    date -d @${1:0:10}.${1:10} +'%a %h %d %H:%M:%S.%N %Y'
}

function term_title {
case "$TERM" in
    screen) tmux rename-window $(basename "$PWD") ;;
    xterm) echo -ne "\e]0;$*\a" ;;
esac
}

export GIT_EDITOR=vim
export CDPATH=.:~:~/dev
export PROMPT_COMMAND='RETURN=$?; term_title $(pwd)'

umask 002
shopt -s globstar
export GEM_HOME=/home/${USER}/.gemhome

if [ -f ~/.$HOSTNAME.rc ]; then
    . ~/.$HOSTNAME.rc
else
    echo 'Create a ~/.$HOSTNAME.rc for machine specific settings'
fi

if [ -f ~/.prompt ]; then
    . ~/.prompt
fi

ulimit -c unlimited
