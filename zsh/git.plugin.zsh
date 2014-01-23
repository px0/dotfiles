# Aliases
alias g='git'
compdef g=git
alias gi='git'
compdef gi=git

alias gs='git s'
alias g='git commit'
alias ga='git add'
alias gaa='git add -A :/'
alias gcm='git commit -m '
alias gl='git lg'
alias gp='git pull'

# Will cd into the top of the current repository
# or submodule.
alias gcd='cd $(git rev-parse --show-toplevel || echo ".")'

# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

# # Work In Progress (wip)
# # These features allow to pause a branch development and switch to another one (wip)
# # When you want to go back to work, just unwip it
# #
# # This function return a warning if the current branch is a wip
# function work_in_progress() {
#   if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
#     echo "WIP!!"
#   fi
# }
# # these alias commit and uncomit wip branches
# alias gwip='git add -A; git ls-files --deleted -z | xargs -0 git rm; git commit -m "--wip--"'
# alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'

# # these alias ignore changes to file
# alias gignore='git update-index --assume-unchanged'
# alias gunignore='git update-index --no-assume-unchanged'
# # list temporarily ignored files
# alias gignored='git ls-files -v | grep "^[[:lower:]]"'



