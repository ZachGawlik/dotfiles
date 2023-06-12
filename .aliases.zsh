function t() {
 tree -I '.git|node_modules|bower_components|.DS_Store' --dirsfirst --filelimit 15 -L ${1:-3} -aC $2
}

alias pn="pnpm"
alias v="nvim"
alias ls="ls -GpF"
alias mv="mv -iv"
alias cp="cp -iv"

alias tree="tree -I '.git|node_modules|DS_Store' --dirsfirst"

# Git aliases
alias g='git'
alias gpr='git pull --rebase'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git status'
alias gc='git checkout'
alias gcm='git checkout master'
alias ga='git add'
alias gcom='git commit -m'
alias gcoma='git commit -a -m'
alias gb='git branch'
alias gcb='git checkout -b'
alias gco='git checkout --'
alias gst='git stash'
alias gp='git push'
alias gl='git log'
alias glg='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset" --abbrev-commit --date=relative'
alias gm='git merge'
alias gr='git reset'
alias git-clean-merged="git branch --merged master | grep -v 'master$' | xargs git branch -d"
