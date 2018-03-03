#Omar declared options
#Small method to view markdown (.md) in the treminal
md () {
    pandoc $1 | lynx -stdin
}

temp () {
    sensors
}

sgapt () {
    apt search $1 | grep -A 1 -B 1 -T $1
}

ecom () {
    name=$(whereis $1 | awk '{print $2}') && sudo nano $name
}

#top -b -n 1 | fzf

alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

alias chrome='google-chrome'
alias open='xdg-open'
alias python='/usr/bin/python3'
alias herokup='git add . && git commit -am "Demo" && git push heroku master'
alias ram='free -m'
alias hg='cat ~/.bash_history | grep'
alias pg='ps ax | grep'
alias pgf='ps ax | fzf'
alias ebash='nano ~/.bashrc; source /home/omar/.bashrc'
alias embash-snppits='nano ~/bash-snippets/all.txt'
alias howdoi='howdoi -a -c'
alias how='HOWDOI_URL="askubuntu.com site:unix.stackexchange.com" ; howdoi -a -c'
alias s-how='HOWDOI_URL="stackoverflow.com" ; howdoi -a -c'
alias hero='heroku'
alias bat='upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage"'
alias firefox-nightly='~/Downloads/firefox/./firefox'
alias ffn='firefox-nightly'


export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export GOPATH=/home/omar/go/GOPATH
export HOWDOI_URL='askubuntu.com'
export HOWDOI_COLORIZE=True
export VHS="/media/omar/MY DATA/OneDrive/Virtual-High-School"
export PATH=$PATH:$HOME/.cargo/bin
export PATH=/home/omar/scripts-bin/working/bin:$PATH
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$GOPATH/bin

#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /home/omar/.local/bin/powerline
#fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


#source ~/.xsh




# ~/.bashrc: executed by bash(1) for non-login shells. see 
# /usr/share/doc/bash/examples/startup-files (in the package bash-doc) for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=50000
HISTFILESIZE=50000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

#export TERM=screen-256color tmux

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ] ; then source /etc/profile.d/vte.sh; fi # Ubuntu Budgie END

