#!/bin/bash


################################################################################
# Configuration
################################################################################

# # UTF-8 all the way.
export LC_ALL='en_CA.UTF-8';
export LANG='en_CA';

# homebrew path
export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

#Further path additions depending on what you have installed. Just uncomment where appropriate
#NPM
# export PATH=/usr/local/share/npm/bin:$PATH

#homebrew ruby 1.9.3
# export PATH=/usr/local/opt/ruby193/bin:$PATH

#Android
# export ANDROID_HOME=/usr/local/opt/android-sdk
# export PATH=$ANDROID_HOME/platform-tools:$ANDROID_HOME/bin:$ANDROID_HOME/tools:$PATH
# export JAVA_HOME=`/usr/libexec/java_home -v 1.6`
export NODE_PATH=/usr/local/lib/node


# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

export HISTCONTROL=ignoredups # Ignores dupes in the history


# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# If possible, add tab completion for many more commands
[ -f `brew --prefix`/etc/bash_completion.d ] && source `brew --prefix`/etc/bash_completion.d/*

[ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash ] && source `brew --prefix`/etc/bash_completion.d/git-completion.bash


export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:';
 
# Always use colour output for ls.
[[ "$OSTYPE" =~ ^darwin ]] && alias ls='command ls -G' || alias ls='command ls --color';
 

################################################################################
# Aliases
################################################################################
# cordova/phonegap development
# alias c="cordova"
# alias cr="cordova run"
# alias cb="cordova build"
# alias ce="cordova emulate"
# alias cpl="cordova plugin"
# alias cpla="cordova plugin add"
# alias cplr="cordova plugin remove"
# alias adbcordova="noglob adb logcat CordovaLog:V *:S"
# alias simlog="noglob tail -f $HOME/Library/Logs/iOS\ Simulator/$(cut -d/ -f7 <<< $(ps ax|grep "iPhone Simulator/"|grep app))/system.log"

# `g` is a shortcut for git, it defaults to `git s` (status) if no argument is given.
function g() {
	local cmd=${1-status}
	shift
	git $cmd $@
}
__git_complete g __git_main #make autocomplete work even if we use 'g' instead of git

alias mkdir='mkdir -p' #create intermediary directories
alias ...='cd ../..'

#for Cynthia
# cd() { builtin cd "$@"; clear; ls; }	# Always list directory contents upon 'cd', and always on a nice new clean display
#for everybody else
cd() { builtin cd "$@"; ls; }	# Always list directory contents upon 'cd'



################################################################################
# Bash prompt
################################################################################

# ANSI colours and font properties.
FG_BLACK=$'\e[30m';
FG_RED=$'\e[31m';
FG_GREEN=$'\e[32m';
FG_YELLOW=$'\e[33m';
FG_BLUE=$'\e[34m';
FG_MAGENTA=$'\e[35m';
FG_CYAN=$'\e[36m';
FG_WHITE=$'\e[37m';
BG_BLACK=$'\e[40m';
BG_RED=$'\e[41m';
BG_GREEN=$'\e[42m';
BG_YELLOW=$'\e[43m';
BG_BLUE=$'\e[44m';
BG_MAGENTA=$'\e[45m';
BG_CYAN=$'\e[46m';
BG_WHITE=$'\e[47m';
FONT_RESET=$'\e[0m';
FONT_BOLD=$'\e[1m';
FONT_BRIGHT="$FONT_BOLD";
FONT_DIM=$'\e[2m';
FONT_UNDERLINE=$'\e[4m';
FONT_BLINK=$'\e[5m';
FONT_REVERSE=$'\e[7m';
FONT_HIDDEN=$'\e[8m';
FONT_INVISIBLE="$FONT_HIDDEN";

FG_ORANGE=$'\e[38;5;214m'
FG_GRAY=$'\e[38;5;237m'
FG_NICEBLUE=$'\e[38;5;105m'

# git prompt. Shows branch if in git repo, including a colored asterisk if the directory is 'dirty' (uncomitted changes)
__git_ps1 () {
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
 
  if [ -n "$b" ]; then
    printf "(%s%s)" "${b##refs/heads/}" "$(echo `git status 2>/dev/null` | grep "nothing to commit" > /dev/null 2>&1; if [ "$?" -ne "0" ]; then echo "${FG_ORANGE}*${FG_RED}"; fi)";
  fi
}

# this shortens the path very much. If you prefer the full path, replace '$(__collapse_pwd)' in the path with '\w'
__collapse_pwd () {
	echo $(pwd | sed -e "s|^$HOME|~|" -e 's|^/private||' -e 's-\([^/.]\{1,3\}\)[^/]*/-\1/-g')
}
 
PS1='${FG_GRAY}-----------------------------------------------------\T \n${FG_NICEBLUE}$(__collapse_pwd)${FG_RED}$(__git_ps1)\[\033[00m\] '
 

################################################################################
# This is rake completion support
################################################################################
function _rake_cache_path() {
  # If in a Rails app, put the cache in the cache dir
  # so version control ignores it
  if [ -e 'tmp/cache' ]; then
    prefix='tmp/cache/'
  fi
  echo "${prefix}.rake_t_cache"
}
 
function rake_cache_store() {
  rake --tasks --silent > "$(_rake_cache_path)"
}
 
function rake_cache_clear() {
  rm -f .rake_t_cache
  rm -f tmp/cache/.rake_t_cache
}
 
export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}
 
function _rakecomplete() {

  # build cache if missing
  if [ ! -e "$(_rake_cache_path)" ]; then
    rake_cache_store
  fi
 
  local tasks=`awk '{print $2}' "$(_rake_cache_path)"`
  COMPREPLY=($(compgen -W "${tasks}" -- ${COMP_WORDS[COMP_CWORD]}))
  return 0
}
 
complete -o default -o nospace -F _rakecomplete rake
################################################################################
