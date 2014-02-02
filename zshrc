
ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Source Prezto.
# if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#   source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
# fi

source /usr/local/etc/autojump.zsh #this should really have been in the dictionay

# !!! search and replace: ag Deafult -l|xargs sed -i '' 's/Deafult/Default/g'

alias m="mvim"
alias o="open"
alias f="open ."
alias ra="rake"
alias fl="|ag -S "
alias G="|ag -S "
alias mkdir='mkdir -p'
alias ag="ag -S"

alias duh='du -sh *'

alias -g H='| head'
alias -g T='| tail'
alias -g G='| ag -S '
alias -g L="| less"
alias -g M='| less'
alias -g W='| wc -l'

alias zshrc='mvim ~/.zshrc' # Quick access to the ~/.zshrc file


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

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
unsetopt correct
DISABLE_CORRECTION="true"

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

# beeps are annoying
setopt NO_BEEP

# Case insensitive globbing
setopt NO_CASE_GLOB

# Be Reasonable!
setopt NUMERIC_GLOB_SORT

# I don't know why I never set this before.
setopt EXTENDED_GLOB

# Faster! (?)
zstyle ':completion::complete:*' use-cache 1

# Don't complete directory we are already in (../here)
zstyle ':completion:*' ignore-parents parent pwd

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# disable shared history
setopt append_history no_inc_append_history no_share_history

# vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

# use incremental search
bindkey "^R" history-incremental-search-backward

# add some readline keys back
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line

# handy keybindings
bindkey "^N" insert-last-word

#Load custom theme
source ~/dotfiles/custom/custom-af-magic.zsh-theme

#load my git aliases
# source ~/dotfiles/zsh/*.zsh
for file in ~/dotfiles/zsh/*.zsh; do
    source "$file"
done

# Customize to your needs...
export PATH=$HOME/dotfiles/bin:/usr/local/opt/ruby193/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$HOME/.rvm/bin:/usr/local/share/npm/bin:$PATH
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/bin:$ANDROID_HOME/tools:$PATH
export NODE_PATH=/usr/local/lib/node
# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home"
export JAVA_HOME=`/usr/libexec/java_home -v 1.6`


# Some neat colors
export LSCOLORS=exfxcxdxbxexexabagacad

# Basic directory operations
# keep directory stack. cd -5, cd +3, ls =4 
setopt autopushd pushdminus pushdsilent pushdtohome #explanation: http://zsh.sourceforge.net/Intro/intro_6.html
alias dh='dirs -v'

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
	for num in {0..9}; do;
		# ifconfig en$num &> /dev/null && ifconfig en$num | grep 'inet ' | sed -e 's/:/ /' | awk -v interface=en$num '{print interface" (IPv4): " $2 " " $3 " " $4 " " $5 " " $6}';
		# ifconfig en$num &> /dev/null && ifconfig en$num &> /dev/null && ifconfig en$num | grep 'inet6 ' | sed -e 's/ / /' | awk  -v interface=en$num '{print interface" (IPv6): " $2 " " $3 " " $4 " " $5 " " $6}';
		ifconfig en$num &> /dev/null && ifconfig en$num | grep 'inet ' | sed -e 's/:/ /' | awk -v interface=en$num '{print interface" (IPv4): " $2 }';
		ifconfig en$num &> /dev/null && ifconfig en$num &> /dev/null && ifconfig en$num | grep 'inet6 ' | sed -e 's/ / /' | awk  -v interface=en$num '{print interface" (IPv6): " $2 }';
		
	done
	# echo "external: " `curl http://ipecho.net/plain; echo`
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
#
plugins=(gitfast)
