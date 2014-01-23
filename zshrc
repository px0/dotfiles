# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# !!! search and replace: ag Deafult -l|xargs sed -i '' 's/Deafult/Default/g'


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias m="mvim"
alias o="open"
alias f="open ."
alias fl="|ag -S "
alias G="|ag -S "
alias -g M='| less'
alias -g L='| wc -l'
alias mkdir='mkdir -p'

alias ag="ag -S"

### cordova
alias c="cordova"
alias cr="cordova run"
alias cb="cordova build"
alias ce="cordova emulate"
alias cpl="cordova plugin"
alias cpla="cordova plugin add"
alias cplr="cordova plugin remove"
alias adbcordova="noglob adb logcat CordovaLog:V *:S"

alias simlog="noglob tail -f $HOME/Library/Logs/iOS\ Simulator/$(cut -d/ -f7 <<< $(ps ax|grep "iPhone Simulator/"|grep app))/system.log"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
unsetopt correct
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode osx ruby colorize brew )

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jk vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"


source $ZSH/oh-my-zsh.sh

#Load custom theme
source ~/dotfiles/custom/custom-af-magic.zsh-theme

#load my git aliases
source ~/dotfiles/zsh/*.zsh

# Customize to your needs...
export PATH=$HOME/dotfiles/bin:/usr/local/opt/ruby193/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.rvm/bin:/usr/local/share/npm/bin:$PATH
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/bin:$ANDROID_HOME/tools:$PATH
export NODE_PATH="/usr/local/lib/node"
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home"
export JAVA_HOME=`/usr/libexec/java_home -v 1.6`


# Some neat colors
export LSCOLORS=exfxcxdxbxexexabagacad

# Basic directory operations
alias ...='cd ../..'
alias ....='cd ../../..'
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias -- -='cd -'
cd() { builtin cd "$@"; ls; }				# Always list directory contents upon 'cd'

## -------------------------------------------------------------------
# Functions
## ff:       Find file under the current directory
## ql:       Opens any file in MacOS Quicklook Preview
## lr:		 Full Recursive Directory Listing
## flushDNS: Flush out the DNS Cache
# -------------------------------------------------------------------
ff() {noglob ag --smart-case -g "$@" ; }
ql() { qlmanage -p "$*" >& /dev/null; }
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias flushDNS='dscacheutil -flushcache'
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

# -------------------------------------------------------------------
# Oddball stuff
# -------------------------------------------------------------------
# necessary to make rake work inside of zsh
alias rake="noglob rake"
alias bower='noglob bower'

# RVM
# export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
# alias rvm='noglob rvm'

# myIP address
function myip() {
	ifconfig lo0 &> /dev/null && ifconfig lo0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "lo0 : " $2}'
	ifconfig en0 &> /dev/null && ifconfig en0 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en0 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en0 &> /dev/null && ifconfig en0 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en0 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 &> /dev/null && ifconfig en1 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en1 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en1 &> /dev/null && ifconfig en1 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en1 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en2 &> /dev/null && ifconfig en2 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en2 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en2 &> /dev/null && ifconfig en2 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en2 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en3 &> /dev/null && ifconfig en3 | grep 'inet ' | sed -e 's/:/ /' | awk '{print "en3 (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}'
	ifconfig en3 &> /dev/null && ifconfig en3 | grep 'inet6 ' | sed -e 's/ / /' | awk '{print "en3 (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}'
}
alias myips=myip

function android_screenshot() {
	adb shell screencap -p | perl -pe 's/\x0D\x0A/\x0A/g' > /tmp/screen.png
	echo "screenshot has been saved to /tmp/screen.png"
}

alias memHogsTop='top -l 1 -o rsize | head -20'
alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#node version manager
# source $(brew --prefix nvm)/nvm.sh
