#!/bin/bash

# # UTF-8 all the way.
export LC_ALL='en_CA.UTF-8';
export LANG='en_CA';

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null
done

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:';
 
# Always use colour output for ls.
[[ "$OSTYPE" =~ ^darwin ]] && alias ls='command ls -G' || alias ls='command ls --color';
 

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

# Git prompt.
git_branch () {
	branch="$(git symbolic-ref -q HEAD 2>/dev/null)";
	ret=$?;
	case $ret in
		0) echo "(${FG_WHITE}${branch##*/}${PROMPT_COLOUR})";;
		1) echo '(no branch)';;
		128) echo -n;;
		*) echo 'WTF?';;
	esac;
	return $ret;
}
[ -f ~/git-completion.bash ] && source ~/git-completion.bash;

# More advanced prompt.
__git_ps1 () {
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
 
  if [ -n "$b" ]; then
    printf " (%s)" "${b##refs/heads/}";
  fi
}
 
PS1='\[\033[32m\]\u\[\033[00m\]:\[\033[35m\]\w\[\033[31m\]$(__git_ps1) $(echo `git status 2>/dev/null` | grep "nothing to commit" > /dev/null 2>&1; if [ "$?" -eq "0" ]; then echo "\[\e[0;32m\]✓"; else echo "\[\e[0;31m\]✗"; fi)\[\033[00m\] '
 
