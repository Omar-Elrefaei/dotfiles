echo omar
source ~/.zsh-powerline.sh
#Omar declared options
#Small method to view markdown (.md) in the treminal


_zxc () {
	#ls -1
	echo omar hatem
}

zxc () {
	#echo $1
}

compdef _zxc zxc


sing () {
	repeat 5 do mplayer ~/Music/you-dont-know-me.opus 
	done
}

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
bri () {
	if [ -z $1 ]; then
		cat /sys/class/backlight/radeon_bl0/brightness
	elif [ $1 = "full" ]; then
		echo 255 > /sys/class/backlight/radeon_bl0/brightness
	else
		echo $1 > /sys/class/backlight/radeon_bl0/brightness
	fi
}

function apt() {
  case $* in
    install* ) shift 1; command sudo apt install "$@" | more ;;
    * ) command apt "$@" ;;
  esac
}

#top -b -n 1 | fzf
alias cd..='cd ..'
alias cd,,='cd ..'
alias cd...='cd ..; cd ..'


alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

alias ram='free -m'
alias open='xdg-open'
alias python='/usr/bin/python3'

alias s='cd ..'
alias gtodoist='google-chrome --profile-directory=Profile\ 4 --app="https://todoist.com"'
alias chrome='google-chrome --profile-directory=Default'
alias herokup='git add . && git commit -am "Demo" && git push heroku master'
alias hg='cat ~/.zsh_history | grep'
alias pg='ps ax | grep'
alias pgf='ps ax | fzf'
alias ebash='nano ~/.bashrc; source /home/omar/.bashrc'
alias ezsh='nano ~/.zshrc; source /home/omar/.zshrc'
alias embash-snppits='nano ~/bash-snippets/all.txt'
alias howdoi='howdoi -a -c'
alias how='HOWDOI_URL="askubuntu.com site:unix.stackexchange.com" ; howdoi -a -c'
alias s-how='HOWDOI_URL="stackoverflow.com" ; howdoi -a -c'
alias hero='heroku'
alias bat='upower -i $(upower -e | grep 'BAT') | grep -E "state|to\ full|percentage"'
alias firefox-nightly='~/Downloads/firefox/./firefox'
alias ffn='firefox-nightly'

export CORRECT_IGNORE_FILE=.*
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export GOPATH=~/go/GOPATH
export HOWDOI_URL='askubuntu.com'
export HOWDOI_COLORIZE=True
export VHS="/media/omar/MY DATA/OneDrive/Virtual-High-School"
export PATH=$PATH:$HOME/.cargo/bin
export PATH=~/scripts-bin/working/bin:$PATH
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$GOPATH/bin

#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /home/omar/.local/bin/powerline
#fi

#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#source ~/.xsh

#_____________________________________________________________
#_____________________________________________________________


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
 HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
 export UPDATE_ZSH_DAYS=5

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git battery)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
#source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
zstyle ':bracketed-paste-magic' active-widgets '.self-*'
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
